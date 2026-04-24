package org.example.museumpc.ai;

import ai.djl.modality.cv.Image;
import ai.djl.modality.cv.util.NDImageUtils;
import ai.djl.ndarray.NDArray;
import ai.djl.ndarray.NDList;
import ai.djl.translate.Translator;
import ai.djl.translate.TranslatorContext;

import java.util.*;

public class FireTranslator implements Translator<Image, List<Map<String, Object>>> {

    // 置信度阈值：大于 45% 才认为是目标
    private static final float CONFIDENCE_THRESHOLD = 0.45f;
    // NMS (非极大值抑制) 阈值：去重用的，重合度大于 45% 的只保留一个
    private static final float NMS_THRESHOLD = 0.45f;

    @Override
    public NDList processInput(TranslatorContext ctx, Image input) {
        NDArray array = input.toNDArray(ctx.getNDManager(), Image.Flag.COLOR);
        array = NDImageUtils.resize(array, 640, 640);
        array = array.transpose(2, 0, 1);
        array = array.toType(ai.djl.ndarray.types.DataType.FLOAT32, false).div(255.0f);
        return new NDList(array);
    }

    @Override
    public List<Map<String, Object>> processOutput(TranslatorContext ctx, NDList list) {
        NDArray output = list.get(0);

        // 如果输出包含 batch 维度 (例如 [1, 6, 8400])，去掉它变成 [6, 8400]
        if (output.getShape().dimension() == 3) {
            output = output.get(0);
        }

        // 🌟 核心步骤 1：将 (6, 8400) 转置为 (8400, 6)
        // 这样每一行就是一个框的数据：[cx, cy, w, h, fire_prob, smoke_prob]
        output = output.transpose();

        float[] flatData = output.toFloatArray();
        int numBoxes = (int) output.getShape().get(0); // 8400
        int numElements = (int) output.getShape().get(1); // 6

        List<Detection> rawDetections = new ArrayList<>();

        // 🌟 核心步骤 2：遍历 8400 个框，筛选出置信度高的
        for (int i = 0; i < numBoxes; i++) {
            int offset = i * numElements;

            float cx = flatData[offset];     // 中心点 X
            float cy = flatData[offset + 1]; // 中心点 Y
            float w = flatData[offset + 2];  // 宽
            float h = flatData[offset + 3];  // 高

            // 获取类别概率 (第4个是火，第5个是烟)
            float fireProb = flatData[offset + 4];
            float smokeProb = flatData[offset + 5];

            // 找出最大概率和对应的类别
            float maxProb = Math.max(fireProb, smokeProb);
            int classId = (fireProb > smokeProb) ? 0 : 1;

            if (maxProb > CONFIDENCE_THRESHOLD) {
                // 将中心点宽高 (cx, cy, w, h) 转换为 左上右下 (x1, y1, x2, y2)
                float x1 = cx - w / 2;
                float y1 = cy - h / 2;
                float x2 = cx + w / 2;
                float y2 = cy + h / 2;

                rawDetections.add(new Detection(classId, maxProb, new float[]{x1, y1, x2, y2}));
            }
        }

        // 🌟 核心步骤 3：执行 NMS (非极大值抑制)，剔除同一个火焰上的多个重复框
        List<Detection> finalDetections = applyNMS(rawDetections, NMS_THRESHOLD);

        // 🌟 核心步骤 4：封装为你需要的最终 Map 格式
        List<Map<String, Object>> result = new ArrayList<>();
        for (Detection det : finalDetections) {
            Map<String, Object> box = new HashMap<>();
            box.put("class", det.classId);
            box.put("name", det.classId == 0 ? "fire" : "smoke");
            // 保留两位小数的置信度
            box.put("confidence", Math.round(det.confidence * 100.0) / 100.0);
            box.put("bbox", new int[]{
                    Math.round(det.bbox[0]),
                    Math.round(det.bbox[1]),
                    Math.round(det.bbox[2]),
                    Math.round(det.bbox[3])
            });
            result.add(box);
        }

        return result;
    }

    // ================= 以下为 NMS 去重算法相关 =================

    private static class Detection {
        int classId;
        float confidence;
        float[] bbox;

        Detection(int classId, float confidence, float[] bbox) {
            this.classId = classId;
            this.confidence = confidence;
            this.bbox = bbox;
        }
    }

    private List<Detection> applyNMS(List<Detection> list, float iouThresh) {
        // 按置信度从大到小排序
        list.sort((a, b) -> Float.compare(b.confidence, a.confidence));

        List<Detection> selected = new ArrayList<>();
        boolean[] active = new boolean[list.size()];
        Arrays.fill(active, true);

        for (int i = 0; i < list.size(); i++) {
            if (!active[i]) continue;
            selected.add(list.get(i));

            for (int j = i + 1; j < list.size(); j++) {
                if (!active[j]) continue;
                // 只对同类别的框进行重叠检查
                if (list.get(i).classId != list.get(j).classId) continue;

                if (calculateIoU(list.get(i).bbox, list.get(j).bbox) > iouThresh) {
                    active[j] = false; // 重合度太高，剔除
                }
            }
        }
        return selected;
    }

    private float calculateIoU(float[] box1, float[] box2) {
        float x1 = Math.max(box1[0], box2[0]);
        float y1 = Math.max(box1[1], box2[1]);
        float x2 = Math.min(box1[2], box2[2]);
        float y2 = Math.min(box1[3], box2[3]);

        float intersection = Math.max(0, x2 - x1) * Math.max(0, y2 - y1);
        float area1 = (box1[2] - box1[0]) * (box1[3] - box1[1]);
        float area2 = (box2[2] - box2[0]) * (box2[3] - box2[1]);

        return intersection / (area1 + area2 - intersection);
    }
}