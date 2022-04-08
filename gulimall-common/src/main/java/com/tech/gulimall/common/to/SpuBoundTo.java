package com.tech.gulimall.common.to;

import lombok.Data;

import java.math.BigDecimal;

/**
*  
* 商品spu积分TO
* @author phil 
* @email hudong.tech@gmail.com 
* @date 2022-04-08 16:07:36
**/
@Data
public class SpuBoundTo {

    /**
     * spuId
     */
    private Long spuId;
    /**
     * 积分
     */
    private BigDecimal buyBounds;
    /**
     * 成长值
     */
    private BigDecimal growBounds;
}
