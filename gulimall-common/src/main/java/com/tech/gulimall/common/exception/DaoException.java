package com.tech.gulimall.common.exception;

/**
* @Description: mybatis异常
* @Author: phil
* @Date: 2021/11/8 18:31
*/
public class DaoException extends StandardException{
    public DaoException(String msg) {
        super(msg);
    }

    public DaoException(String msg, Throwable e) {
        super(msg, e);
    }

    public DaoException(String msg, int code) {
        super(msg, code);
    }

    public DaoException(String msg, int code, Throwable e) {
        super(msg, code, e);
    }
}
