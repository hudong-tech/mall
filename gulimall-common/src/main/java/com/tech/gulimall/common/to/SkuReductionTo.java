package com.tech.gulimall.common.to;

import lombok.Data;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.List;

/**
*  
*
* @author phil 
* @email hudong.tech@gmail.com 
* @date 2022-04-08 16:46:52
**/
@Data
public class SkuReductionTo {
    /**
     * skuId
     */
    @NotNull(message = "skuId不能为空！")
    private Long skuId;
    /**
     * 满几件
     */
    private int fullCount;
    /**
     * 打几折
     */
    private BigDecimal discount;
    /**
     * 是否叠加其他优惠[0-不可叠加，1-可叠加]
     */
    private int countStatus;
    /**
     * 满多少
     */
    private BigDecimal fullPrice;
    /**
     * 减多少
     */
    private BigDecimal reducePrice;
    /**
     * 是否叠加其他优惠[0-不可叠加，1-可叠加]
     */
    private int priceStatus;
    /**
     * 会员价格
     */
    private List<MemberPrice> memberPrice;
}
