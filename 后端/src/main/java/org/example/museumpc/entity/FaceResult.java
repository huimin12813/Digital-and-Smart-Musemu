package org.example.museumpc.entity;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * 人脸检测与识别结果 DTO
 * 仅保留业务真正需要的字段：人数和识别到的人名
 */
@Setter
@Getter
public class FaceResult {

    private int faceCount;        // 检测到的人脸总数
    private List<FaceInfo> faces; // 人脸详情列表

    public FaceResult() {}

    public FaceResult(int faceCount, List<FaceInfo> faces) {
        this.faceCount = faceCount;
        this.faces = faces;
    }

    /**
     * 单个人脸信息：目前仅保留姓名
     */
    public static class FaceInfo {
        private String name; // 识别出的姓名

        public FaceInfo() {}

        public FaceInfo(String name) {
            this.name = name;
        }


        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
    }
}