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
    ATTR_TYPE_PRODUCT(0, "product"),
    /**
     * 基本属性
     */
    ATTR_TYPE_BASE(1, "base");
    private int code;
    private String type;

    AttrEnum(int code, String type) {
        this.code = code;
        this.type = type;
    }

    public int getCode() {
        return code;
    }

    public String getType() {
        return type;
    }
}
