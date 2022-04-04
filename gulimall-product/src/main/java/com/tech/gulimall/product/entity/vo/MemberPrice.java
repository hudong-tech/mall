package com.tech.gulimall.product.entity.vo;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @className: MemberPrice
 * @description: 录入商品 -- 会员价格
 * @author: phil
 * @date: 2021/11/23
 **/
@Data
public class MemberPrice {
    /**
     * 会员id
     */
    private Long id;
    /**
     * 会员名
     */
    private String name;
    /**
     * 会员价格
     */
    private BigDecimal price;
}
