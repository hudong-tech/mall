package com.tech.gulimall.common.constant.enums;

import lombok.Getter;

/**
 *  采购项状态 0-新建 | 1-已分配 | 2-正在采购 | 3-已完成 | 4-采购失败
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2022-04-15 10:10:12
 **/
public enum PurchaseDetailStatusEnum {
    CREATED(0, "新建"),
    ASSIGNED(1, "已分配"),
    BUYING(2, "正在采购"),
    FINISH(3, "已完成"),
    HASERROR(4, "采购失败");

    @Getter
    private int code;

    @Getter
    private String msg;

    PurchaseDetailStatusEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
