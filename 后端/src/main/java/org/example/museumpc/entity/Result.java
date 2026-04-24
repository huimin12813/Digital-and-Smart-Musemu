package org.example.museumpc.entity; // 确保包名与你的项目路径一致

import lombok.Data;

@Data
public class Result {
    private int code;    // 状态码：200 成功，500 失败
    private String msg;  // 提示消息
    private Object data; // 返回的具体数据

    public Result(int code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    // 静态成功方法
    public static Result success(String msg) {
        return new Result(200, msg, null);
    }

    public static Result success(String msg, Object data) {
        return new Result(200, msg, data);
    }

    // 静态失败方法
    public static Result error(String msg) {
        return new Result(500, msg, null);
    }
}