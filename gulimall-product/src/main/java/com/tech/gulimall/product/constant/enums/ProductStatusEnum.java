package com.tech.gulimall.product.constant.enums;

/**
 * @Description: 商品上架状态
 * @Author: phil
 * @Date: 2021/11/10 2:41
 */
public enum ProductStatusEnum {
    /**
     * 新建
     */
    NEW_SPU(0, "新建"),
    /**
     * 商品上架
     */
    SPU_UP(1, "商品上架"),
    /**
     * 商品下架
     */
    SPU_DOWN(2, "商品下架");

    private int code;

    private String msg;

    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }

    ProductStatusEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
