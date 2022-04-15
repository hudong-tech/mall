package com.tech.gulimall.common.constant.enums;

import lombok.Getter;

/**
*  采购单状态 采购单状态 0-新建 | 1-已分配 | 2-已领取 | 3-已完成 | 4-有异常
*
* @author phil 
* @email hudong.tech@gmail.com 
* @date 2022-04-15 06:10:12
**/
public enum PurchaseStatusEnum {
    /**
     * 新建
     */
    CREATED(0, "新建"),
    /**
     * 已分配
     */
    ASSIGNED(1, "已分配"),
    /**
     * 已领取
     */
    RECEIVE(2, "已领取"),
    /**
     * 已完成
     */
    FINISH(3, "已完成"),
    /**
     * 有异常
     */
    HASERROR(4, "有异常");

    @Getter
    private int code;

    @Getter
    private String msg;

    PurchaseStatusEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

}
