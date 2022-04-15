package com.tech.gulimall.ware.vo;

import lombok.Data;

import java.util.List;

/**
*  合并整单vo
*
* @author phil 
* @email hudong.tech@gmail.com 
* @date 2022-04-15 06:01:20
**/

@Data
public class MergeVo {

    /**
     * 整单id
     */
    private Long purchaseId;

    /**
     * 合并项集合
     */
    private List<Long> items;
}
