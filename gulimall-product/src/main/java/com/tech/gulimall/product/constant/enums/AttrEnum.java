package com.tech.gulimall.product.constant.enums;

/**
* @Description: 属性类型 0-销售属性，1-基本属性
* @Author: phil
* @Date: 2021/11/10 2:41
*/
public enum AttrEnum {
    /**
     * 销售属性
     */
    ATTR_TYPE_PRODUCT(0),
    /**
     * 基本属性
     */
    ATTR_TYPE_BASE(1);
    private int code;

    AttrEnum(int code) {
        this.code = code;
    }

    public int getCode() {
        return code;
    }
}
