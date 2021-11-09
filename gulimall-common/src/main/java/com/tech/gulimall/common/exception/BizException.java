package com.tech.gulimall.common.exception;

/**
* @Description: 业务操作异常（用于传递错误信息给前端控制器，严格意义上并不是异常）
* @Author: phil
* @Date: 2021/11/8 18:28
*/
public class BizException extends StandardException {
    public BizException(String msg) {
        super(msg);
    }

    public BizException(String msg, Throwable e) {
        super(msg, e);
    }

    public BizException(String msg, int code) {
        super(msg, code);
    }

    public BizException(String msg, int code, Throwable e) {
        super(msg, code, e);
    }
}
