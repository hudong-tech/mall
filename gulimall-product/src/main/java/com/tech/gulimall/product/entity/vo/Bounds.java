package com.tech.gulimall.product.entity.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 录入商品 -- 积分信息
 * Auto-generated: 2021-11-23 17:52:33
 *
 * @author bejson.com (i@bejson.com)
 * @website http://www.bejson.com/java2pojo/
 */
@Data
public class Bounds {
    /**
     * 积分
     */
    private BigDecimal buyBounds;
    /**
     * 成长值
     */
    private BigDecimal growBounds;

}