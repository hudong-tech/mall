package com.tech.gulimall.product.constant.enums;

/**
 * @className: ValueTypeEnum
 * @description: pms_attr 「value_type」值类型
 * @author: phil
 * @date: 2021/11/21
 **/
public enum ValueTypeEnum {
    /**
     * 只能单个值
     */
    ONLY_SINGLE_VALUE(0),
    /**
     * 允许多个值
     */
    ALLOW_MULTIPLE_VALUES(1);

    private int code;

    ValueTypeEnum(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }
}
