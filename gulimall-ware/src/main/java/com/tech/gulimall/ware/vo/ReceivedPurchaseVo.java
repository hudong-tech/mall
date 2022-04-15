package com.tech.gulimall.ware.vo;

import lombok.Data;

import java.util.List;

/**
*  领取采购单
*
* @author phil 
* @email hudong.tech@gmail.com 
* @date 2022-04-15 10:58:06
**/
@Data
public class ReceivedPurchaseVo {

    /**
     * 采购单ids
     */
    private List<Long> ids;

    /**
     * 采购人员
     */
    private String user;
}
