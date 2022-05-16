package com.tech.gulimall.common.constant.enums;

import lombok.Getter;

/**
 *  R code
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2022-04-15 06:10:12
 **/
public enum RCodeEnum {

    /**
     * 成功
     */
    SUCCESS(0);

    @Getter
    private int code;

    RCodeEnum(int code) {
        this.code = code;
    }
}
