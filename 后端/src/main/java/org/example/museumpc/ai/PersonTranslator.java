package org.example.museumpc.ai;

import ai.djl.modality.cv.Image;
import ai.djl.modality.cv.util.NDImageUtils;
import ai.djl.ndarray.NDArray;
import ai.djl.ndarray.NDList;
import ai.djl.translate.Translator;
import ai.djl.translate.TranslatorContext;

import java.util.*;

/**
 * YOLOv8 预训练模型解析器，只提取 person 类 (class 0)
 * 模型输出 shape: (84, 8400) = 4 bbox + 80 class probs
 */
public class PersonTranslator implements Translator<Image, List<float[]>> {

    private static final float CONFIDENCE_THRESHOLD = 0.45f;
    private static final float NMS_THRESHOLD = 0.45f;
    private static final int PERSON_CLASS_ID = 0;

    @Override
    public NDList processInput(TranslatorContext ctx, Image input) {
        NDArray array = input.toNDArray(ctx.getNDManager(), Image.Flag.COLOR);
        array = NDImageUtils.resize(array, 640, 640);
        array = array.transpose(2, 0, 1);
        array = array.toType(ai.djl.ndarray.types.DataType.FLOAT32, false).div(255.0f);
        return new NDList(array);
    }

    @Override
    public List<float[]> processOutput(TranslatorContext ctx, NDList list) {
        NDArray output = list.get(0);

        if (output.getShape().dimension() == 3) {
            output = output.get(0);
        }

        // (84, 8400) -> (8400, 84)
        output = output.transpose();

        float[] flatData = output.toFloatArray();
        int numBoxes = (int) output.getShape().get(0);
        int numElements = (int) output.getShape().get(1);

        List<float[]> rawDetections = new ArrayList<>();

        for (int i = 0; i < numBoxes; i++) {
            int offset = i * numElements;

            float cx = flatData[offset];
            float cy = flatData[offset + 1];
            float w = flatData[offset + 2];
            float h = flatData[offset + 3];

            // class 0 = person，在 offset+4 的位置
            float personProb = flatData[offset + 4 + PERSON_CLASS_ID];

            if (personProb > CONFIDENCE_THRESHOLD) {
                float x1 = cx - w / 2;
                float y1 = cy - h / 2;
                float x2 = cx + w / 2;
                float y2 = cy + h / 2;
                rawDetections.add(new float[]{x1, y1, x2, y2, personProb});
            }
        }

        List<float[]> result = applyNMS(rawDetections, NMS_THRESHOLD);
        return result;
    }

    private List<float[]> applyNMS(List<float[]> list, float iouThresh) {
        list.sort((a, b) -> Float.compare(b[4], a[4]));
        List<float[]> selected = new ArrayList<>();
        boolean[] active = new boolean[list.size()];
        Arrays.fill(active, true);

        for (int i = 0; i < list.size(); i++) {
            if (!active[i]) continue;
            selected.add(list.get(i));
            for (int j = i + 1; j < list.size(); j++) {
                if (!active[j]) continue;
                if (calculateIoU(list.get(i), list.get(j)) > iouThresh) {
                    active[j] = false;
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
