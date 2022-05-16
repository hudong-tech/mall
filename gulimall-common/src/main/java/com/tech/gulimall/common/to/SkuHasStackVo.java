package com.tech.gulimall.common.to;

import lombok.Data;

/**
* 库存量查询vo
*
* @author phil 
* @email hudong.tech@gmail.com 
* @date 2022-05-10 17:32:39
**/
@Data
public class SkuHasStackVo {
    /**
     * skuId
     */
    private Long skuId;

    /**
     * 是否有库存
     */
    private Boolean hasStack;
}
