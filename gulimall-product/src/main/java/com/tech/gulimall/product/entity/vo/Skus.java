package com.tech.gulimall.product.entity.vo;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * 录入商品 -- sku
 * Auto-generated: 2021-11-23 17:52:33
 *
 * @author bejson.com (i@bejson.com)
 * @website http://www.bejson.com/java2pojo/
 */
@Data
public class Skus {
    /**
     * 销售属性
     */
    private List<Attr> attr;
    /**
     * sku名称
     */
    private String skuName;
    /**
     * 价格
     */
    private BigDecimal price;
    /**
     * 标题
     */
    private String skuTitle;
    /**
     * 副标题
     */
    private String skuSubtitle;
    /**
     * 图片信息
     */
    private List<Images> images;
    /**
     * descar组合，如["深空灰色", "CELLULAR 64G"]
     */
    private List<String> descar;
    /**
     * 满几件
     */
    private BigDecimal fullCount;
    /**
     * 打几折
     */
    private int discount;
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