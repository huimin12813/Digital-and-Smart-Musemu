package org.example.museumpc.service;

import ai.djl.modality.cv.Image;
import cn.smartjavaai.common.cv.SmartImageFactory;
import cn.smartjavaai.common.entity.*;
import cn.smartjavaai.common.entity.face.LivenessResult;
import cn.smartjavaai.common.enums.face.LivenessStatus;
import cn.smartjavaai.face.model.facedect.FaceDetModel;
import cn.smartjavaai.face.model.facerec.FaceRecModel;
import cn.smartjavaai.face.model.liveness.LivenessDetModel;
import com.alibaba.fastjson.JSON;
import org.example.museumpc.entity.AccessLog;
import org.example.museumpc.entity.Face;
import org.example.museumpc.entity.FaceResult;
import org.example.museumpc.mqtt.MqttSendClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.sql.*;
import java.util.*;

@Service
public class FaceDetectionService {

    private static final Logger logger = LoggerFactory.getLogger(FaceDetectionService.class);

    @Autowired
    private FaceDetModel faceModel;

    @Autowired
    private FaceRecModel faceRecModel;

    @Autowired(required = false)
    private LivenessDetModel livenessModel;

    // MySQL 的 JDBC 模板 (用于业务数据)
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private MqttSendClient mqttSendClient;

    private String lastDetectedName = "";
    private int successCount = 0;
    private boolean mqttTriggered = false;
    private long lastResetTime = 0;

    // 本地 SQLite 数据库路径 (存放在项目根目录)
    private static final String SQLITE_DB_URL = "jdbc:sqlite:face_data.db";

    @PostConstruct
    public void initDatabase() {
        logger.info(">>> 正在初始化本地 SQLite 向量数据库...");
        try (Connection conn = DriverManager.getConnection(SQLITE_DB_URL);
             Statement stmt = conn.createStatement()) {

            // 在 SQLite 中创建用于存储特征的表
            String sql = "CREATE TABLE IF NOT EXISTS face_vector (" +
                    "id TEXT PRIMARY KEY, " +
                    "name TEXT NOT NULL, " +
                    "feature TEXT NOT NULL)";
            stmt.execute(sql);
            logger.info(">>> SQLite 向量数据库初始化成功！文件位置: face_data.db");

        } catch (SQLException e) {
            logger.error(">>> SQLite 初始化失败: {}", e.getMessage());
        }
    }

    // ================== 活体检测 ==================
    private boolean checkLiveness(BufferedImage bufferedImage) {
        if (livenessModel == null) return true;
        try {
            Image image = SmartImageFactory.getInstance().fromBufferedImage(bufferedImage);
            R<LivenessResult> result = livenessModel.detectTopFace(image);
            if (!result.isSuccess()) {
                logger.warn("活体检测失败: {}", result.getMessage());
                return false;
            }
            LivenessResult livenessResult = result.getData();
            boolean isLive = livenessResult.getStatus() == LivenessStatus.LIVE;
            if (isLive) {
                logger.info("活体检测通过，得分: {}", livenessResult.getScore());
            } else {
                logger.warn("拦截非活体攻击，状态: {}, 得分: {}", livenessResult.getStatus(), livenessResult.getScore());
            }
            return isLive;
        } catch (Exception e) {
            logger.error("活体引擎异常", e);
            return false;
        }
    }

    // ================== 注册 (双写机制) ==================
    public String registerFaceWithMetadata(String imageBase64, Map<String, Object> metadata) {
        if (faceRecModel == null) throw new RuntimeException("特征提取模型未就绪");
        try {
            BufferedImage image = base64ToBufferedImage(imageBase64);

            // 1. 提取特征向量
            R<float[]> featureResult = faceRecModel.extractTopFaceFeature(image);
            if (!featureResult.isSuccess() || featureResult.getData() == null) {
                throw new RuntimeException("未能提取到有效的人脸特征");
            }

            String name = metadata != null ? (String) metadata.getOrDefault("name", "Unknown") : "Unknown";
            String role = metadata != null ? (String) metadata.getOrDefault("role", "visitor") : "visitor";
            String metaJson = metadata != null ? JSON.toJSONString(metadata) : "{}";
            String featureJson = JSON.toJSONString(featureResult.getData());

            // 自动生成唯一 ID
            String realFaceId = UUID.randomUUID().toString().replace("-", "");

            // 2. 写入云端/业务端 MySQL (不存特征，减小体积)
            String mysqlSql = "INSERT INTO person (id, name, role, metadata, create_time) VALUES (?, ?, ?, ?, NOW())";
            jdbcTemplate.update(mysqlSql, realFaceId, name, role, metaJson);

            // 3. 写入本地 SQLite (仅存特征，用于极速比对)
            String sqliteSql = "INSERT INTO face_vector (id, name, feature) VALUES (?, ?, ?)";
            try (Connection conn = DriverManager.getConnection(SQLITE_DB_URL);
                 PreparedStatement pstmt = conn.prepareStatement(sqliteSql)) {
                pstmt.setString(1, realFaceId);
                pstmt.setString(2, name);
                pstmt.setString(3, featureJson);
                pstmt.executeUpdate();
            }

            logger.info(">>> 人脸注册成功! ID={}, 已同步至 MySQL 与 SQLite", realFaceId);
            return realFaceId;

        } catch (Exception e) {
            logger.error("注册异常", e);
            throw new RuntimeException("注册失败: " + e.getMessage());
        }
    }

    // ================== 登录 ==================
    public Map<String, Object> faceLogin(String imageBase64) {
        try {
            BufferedImage image = base64ToBufferedImage(imageBase64);
            if (!checkLiveness(image)) {
                recordAccessLog("Unknown", "Unknown", "Unknown", false, "Auth_Terminal", "活体检测失败");
                return null;
            }

            R<float[]> featureResult = faceRecModel.extractTopFaceFeature(image);
            if (!featureResult.isSuccess() || featureResult.getData() == null) {
                recordAccessLog("Unknown", "Unknown", "Unknown", false, "Auth_Terminal", "未提取到特征");
                return null;
            }

            float[] currentFeature = featureResult.getData();

            float maxScore = 0;
            String bestMatchId = null;
            String bestMatchName = "Unknown";

            // 1. 从本地 SQLite 极速读取特征进行比对
            String sqliteSql = "SELECT id, name, feature FROM face_vector";
            try (Connection conn = DriverManager.getConnection(SQLITE_DB_URL);
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(sqliteSql)) {

                while (rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    float[] dbFeature = JSON.parseObject(rs.getString("feature"), float[].class);

                    float score = calculateSimilarity(currentFeature, dbFeature);
                    if (score > maxScore) {
                        maxScore = score;
                        bestMatchId = id;
                        bestMatchName = name;
                    }
                }
            }

            // 2. 如果识别成功，再去 MySQL 获取完整权限信息
            if (maxScore > 0.75f && bestMatchId != null) {
                // 去 MySQL 查询该人员的详细档案
                Map<String, Object> mysqlUser = jdbcTemplate.queryForMap("SELECT role, metadata FROM person WHERE id = ?", bestMatchId);
                String role = (String) mysqlUser.get("role");
                String metadata = (String) mysqlUser.get("metadata");

                recordAccessLog(bestMatchId, bestMatchName, role, true, "Auth_Terminal", "身份核验通过");

                Map<String, Object> result = new HashMap<>();
                result.put("id", bestMatchId);
                result.put("name", bestMatchName);
                result.put("role", role);
                result.put("metadata", metadata);
                result.put("similarity", maxScore);
                return result;
            } else {
                recordAccessLog("Unknown", "Unknown", "Unknown", false, "Auth_Terminal", "查无此人");
                return null;
            }
        } catch (Exception e) {
            logger.error("登录异常", e);
            return null;
        }
    }

    // ================== MQTT 联动识别 ==================
    public String identifyFace(BufferedImage image) {
        if (faceRecModel == null) return "Unknown";
        try {
            if (!checkLiveness(image)) {
                resetRecognition();
                return "Unknown";
            }

            R<float[]> featureResult = faceRecModel.extractTopFaceFeature(image);
            if (!featureResult.isSuccess() || featureResult.getData() == null) {
                resetRecognition();
                return "Unknown";
            }
            float[] currentFeature = featureResult.getData();

            float maxScore = 0;
            String bestMatchName = "Unknown";

            // 从 SQLite 读取
            try (Connection conn = DriverManager.getConnection(SQLITE_DB_URL);
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery("SELECT name, feature FROM face_vector")) {
                while (rs.next()) {
                    float[] dbFeature = JSON.parseObject(rs.getString("feature"), float[].class);
                    float score = calculateSimilarity(currentFeature, dbFeature);
                    if (score > maxScore) {
                        maxScore = score;
                        bestMatchName = rs.getString("name");
                    }
                }
            }

            if (maxScore > 0.80f && !bestMatchName.equals("Unknown")) {
                if (bestMatchName.equals(lastDetectedName)) {
                    if (!mqttTriggered) successCount++;
                } else {
                    lastDetectedName = bestMatchName;
                    successCount = 1;
                    mqttTriggered = false;
                }

                if (successCount >= 3 && !mqttTriggered) {
                    mqttSendClient.publish("device/1/cmd", "{\"led\":1}");
                    logger.info(">>> [MQTT] 活体识别成功，已发送开灯指令: {}", bestMatchName);
                    mqttTriggered = true;
                }
                return bestMatchName;
            } else {
                resetRecognition();
                return "Unknown";
            }
        } catch (Exception e) {
            return "Error";
        }
    }

    public FaceResult detect(String base64Image) {
        BufferedImage image = base64ToBufferedImage(base64Image);
        if (faceModel == null || image == null) return new FaceResult(0, new ArrayList<>());

        try {
            Image smartImage = SmartImageFactory.getInstance().fromBufferedImage(image);
            R<DetectionResponse> result = faceModel.detect(smartImage);

            if (result.isSuccess() && result.getData() != null) {
                List<FaceResult.FaceInfo> faceInfoList = new ArrayList<>();
                String name = identifyFace(image);

                for (DetectionInfo d : result.getData().getDetectionInfoList()) {
                    FaceResult.FaceInfo faceInfo = new FaceResult.FaceInfo(name);
                    faceInfoList.add(faceInfo);
                }
                return new FaceResult(faceInfoList.size(), faceInfoList);
            }
        } catch (Exception e) { logger.error("检测异常", e); }
        return new FaceResult(0, new ArrayList<>());
    }

    // ================== 删除人脸 (双删) ==================
    public boolean deleteFace(String faceId) {
        boolean mysqlDeleted = jdbcTemplate.update("DELETE FROM person WHERE id = ?", faceId) > 0;
        try (Connection conn = DriverManager.getConnection(SQLITE_DB_URL);
             PreparedStatement pstmt = conn.prepareStatement("DELETE FROM face_vector WHERE id = ?")) {
            pstmt.setString(1, faceId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            logger.error("SQLite 删除失败", e);
        }
        return mysqlDeleted;
    }

    public List<Face> getAllFaces() {
        return jdbcTemplate.query("SELECT id, name, metadata, create_time as createTime FROM person", new BeanPropertyRowMapper<>(Face.class));
    }

    public List<AccessLog> getRecentAccessLogs(int limit) {
        String sql = "SELECT id, person_id as personId, person_name as personName, role, " +
                "access_time as accessTime, granted, device_id as deviceId, reason " +
                "FROM access_log ORDER BY access_time DESC LIMIT ?";
        return jdbcTemplate.query(sql, new org.springframework.jdbc.core.BeanPropertyRowMapper<>(AccessLog.class), limit);
    }

    // ====== 核心比对算法 (余弦相似度) ======
    private float calculateSimilarity(float[] f1, float[] f2) {
        float dotProduct = 0, normA = 0, normB = 0;
        for (int i = 0; i < f1.length; i++) {
            dotProduct += f1[i] * f2[i];
            normA += f1[i] * f1[i];
            normB += f2[i] * f2[i];
        }
        return (float) (dotProduct / (Math.sqrt(normA) * Math.sqrt(normB)));
    }

    private void resetRecognition() {
        long now = System.currentTimeMillis();
        if (now - lastResetTime > 3000) {
            if (mqttTriggered) {
                mqttSendClient.publish("device/1/cmd", "{\"led\":0}");
                mqttTriggered = false;
            }
            successCount = 0;
            lastDetectedName = "";
        }
        lastResetTime = now;
    }

    private void recordAccessLog(String personId, String personName, String role, Boolean granted, String deviceId, String reason) {
        String sql = "INSERT INTO access_log (person_id, person_name, role, granted, device_id, reason) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            jdbcTemplate.update(sql, personId, personName, role, granted, deviceId, reason);
        } catch(Exception e) {
            logger.error("记录日志失败", e);
        }
    }

    private BufferedImage base64ToBufferedImage(String base64) {
        try {
            base64 = base64.trim()
                    .replace("：", ":").replace("，", ",").replace("；", ";").replace("　", "")
                    .replace(" ", "").replace("\n", "").replace("\r", "");
            if (base64.contains(",")) base64 = base64.substring(base64.indexOf(",") + 1);
            else if (base64.contains("base64")) base64 = base64.substring(base64.indexOf("base64") + 6);

            byte[] bytes = Base64.getDecoder().decode(base64.replaceAll("\\s", ""));
            BufferedImage image = ImageIO.read(new ByteArrayInputStream(bytes));
            if (image == null) throw new RuntimeException("数据无效");
            return image;
        } catch (Exception e) {
            throw new RuntimeException("图片转换失败: " + e.getMessage(), e);
        }
    }

    // ================== 人脸搜索 (1:N) ==================
    public List<Map<String, Object>> searchFace(String imageBase64, int topK, double threshold) {
        List<Map<String, Object>> results = new ArrayList<>();
        if (faceRecModel == null) return results;

        try {
            BufferedImage image = base64ToBufferedImage(imageBase64);

            // 1. 提取当前图片特征
            R<float[]> featureResult = faceRecModel.extractTopFaceFeature(image);
            if (!featureResult.isSuccess() || featureResult.getData() == null) {
                return results; // 没提取到特征，直接返回空列表
            }
            float[] currentFeature = featureResult.getData();

            // 用于存放所有过线（大于阈值）的匹配结果
            List<Map<String, Object>> allMatches = new ArrayList<>();

            // 2. 从 SQLite 读取所有特征进行比对
            String sqliteSql = "SELECT id, name, feature FROM face_vector";
            try (Connection conn = DriverManager.getConnection(SQLITE_DB_URL);
                 Statement stmt = conn.createStatement();
                 ResultSet rs = stmt.executeQuery(sqliteSql)) {

                while (rs.next()) {
                    String id = rs.getString("id");
                    String name = rs.getString("name");
                    float[] dbFeature = com.alibaba.fastjson.JSON.parseObject(rs.getString("feature"), float[].class);

                    // 计算相似度
                    float score = calculateSimilarity(currentFeature, dbFeature);

                    // 如果相似度大于传入的阈值 (如 0.62)
                    if (score >= threshold) {
                        Map<String, Object> match = new HashMap<>();
                        match.put("id", id);
                        match.put("name", name);
                        match.put("similarity", score);
                        allMatches.add(match);
                    }
                }
            }

            // 3. 按相似度从大到小排序
            allMatches.sort((a, b) -> Float.compare((float) b.get("similarity"), (float) a.get("similarity")));

            // 4. 截取前 TopK 个结果
            int limit = Math.min(topK, allMatches.size());
            for (int i = 0; i < limit; i++) {
                results.add(allMatches.get(i));
            }

            return results;

        } catch (Exception e) {
            logger.error("人脸搜索异常", e);
            return results;
        }
    }
}