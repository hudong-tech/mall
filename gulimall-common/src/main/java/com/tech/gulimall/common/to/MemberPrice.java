package com.tech.gulimall.common.to;

import lombok.Data;

import java.math.BigDecimal;

/**
*  
*
* @author phil 
* @email hudong.tech@gmail.com 
* @date 2022-04-08 16:53:26
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
