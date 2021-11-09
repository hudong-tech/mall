package com.tech.gulimall.common.exception;

/**
* @Description: 系统异常
* @Author: phil
* @Date: 2021/11/8 18:31
*/
public class SysException extends StandardException{
    public SysException(String msg) {
        super(msg);
    }

    public SysException(String msg, Throwable e) {
        super(msg, e);
    }

    public SysException(String msg, int code) {
        super(msg, code);
    }

    public SysException(String msg, int code, Throwable e) {
        super(msg, code, e);
    }
}
