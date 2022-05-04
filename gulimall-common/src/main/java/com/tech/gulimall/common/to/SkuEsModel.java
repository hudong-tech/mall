package com.tech.gulimall.common.to;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
*  sku在es中的存储模型
*
* @author phil 
* @email hudong.tech@gmail.com 
* @date 2022-04-17 22:27:49
**/
@Data
public class SkuEsModel {
    /**
     * sku id
     */
    private Long skuId;
    /**
     * spu id
     */
    private Long spuId;
    /**
     * sku标题
     */
    private String skuTitle;
    /**
     * sku价格
     */
    private BigDecimal skuPrice;
    /**
     * sku图片
     */
    private String skuImg;
    /**
     * 销售数量
     */
    private Long saleCount;
    /**
     * 是否有库存
     */
    private boolean hasStock;
    /**
     * 热度
     */
    private Long  hotScore;
    /**
     * 品牌id
     */
    private Long brandId;
    /**
     * 分类id
     */
    private Long catelogId;
    /**
     * 品牌名称
     */
    private String brandName;
    /**
     * 品牌logo
     */
    private String brandImg;
    /**
     * 分类名称
     */
    private String catelogName;
    /**
     * 基础属性
     */
    private List<Attr> attrs;

    @Data
    public static class Attr{
        /**
         * 基础属性id
         */
        private Long attrId;
        /**
         * 基础属性名称
         */
        private String attrName;
        /**
         * 基础属性值
         */
        private String attrValue;
    }
}
