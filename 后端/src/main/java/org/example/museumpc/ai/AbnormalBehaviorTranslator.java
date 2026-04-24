package org.example.museumpc.ai;

import ai.djl.modality.cv.Image;
import ai.djl.modality.cv.util.NDImageUtils;
import ai.djl.ndarray.NDArray;
import ai.djl.ndarray.NDList;
import ai.djl.ndarray.types.DataType;
import ai.djl.translate.Translator;
import ai.djl.translate.TranslatorContext;

import java.util.*;

public class AbnormalBehaviorTranslator implements Translator<Image, Map<String, Object>> {

    public static final String[] CLASS_NAMES = {
        "Fence_Climbing", "Fighting", "Normal_Videos", "Robbery", "Shooting", "Stealing"
    };

    private static final float CONFIDENCE_THRESHOLD = 0.5f;

    @Override
    public NDList processInput(TranslatorContext ctx, Image input) {
        NDArray array = input.toNDArray(ctx.getNDManager(), Image.Flag.COLOR);
        array = NDImageUtils.resize(array, 224, 224);
        array = array.transpose(2, 0, 1);
        array = array.toType(DataType.FLOAT32, false).div(255.0f);
        return new NDList(array);
    }

    @Override
    public Map<String, Object> processOutput(TranslatorContext ctx, NDList list) {
        NDArray output = list.get(0);

        // shape: [1, 6] or [6]
        if (output.getShape().dimension() == 2) {
            output = output.get(0);
        }

        float[] probs = output.toFloatArray();

        // find top class
        int topClass = 0;
        float topProb = probs[0];
        for (int i = 1; i < probs.length; i++) {
            if (probs[i] > topProb) {
                topProb = probs[i];
                topClass = i;
            }
        }

        // build top-3 list
        Integer[] indices = new Integer[probs.length];
        for (int i = 0; i < indices.length; i++) indices[i] = i;
        Arrays.sort(indices, (a, b) -> Float.compare(probs[b], probs[a]));

        List<Map<String, Object>> topK = new ArrayList<>();
        for (int i = 0; i < Math.min(3, indices.length); i++) {
            Map<String, Object> item = new HashMap<>();
            item.put("className", CLASS_NAMES[indices[i]]);
            item.put("confidence", Math.round(probs[indices[i]] * 100.0) / 100.0);
            topK.add(item);
        }

        Map<String, Object> result = new HashMap<>();
        result.put("classId", topClass);
        result.put("className", CLASS_NAMES[topClass]);
        result.put("confidence", Math.round(topProb * 100.0) / 100.0);
        result.put("detected", topProb >= CONFIDENCE_THRESHOLD && topClass != 2); // class 2 = Normal
        result.put("topK", topK);
        return result;
    }
}
