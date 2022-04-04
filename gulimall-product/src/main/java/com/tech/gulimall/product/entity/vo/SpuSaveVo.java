package com.tech.gulimall.product.entity.vo;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * Auto-generated: 2021-11-23 17:52:33
 *
 * @author bejson.com (i@bejson.com)
 * @website http://www.bejson.com/java2pojo/
 */

@Data
public class SpuSaveVo {

    /**
     * 商品名称
     */
    private String spuName;
    /**
     * 商品描述
     */
    private String spuDescription;
    /**
     * 所属分类id
     */
    @TableId
    private Long catalogId;
    /**
     * 品牌id
     */
    @TableId
    private Long brandId;
    /**
     * 重量
     */
    private BigDecimal weight;
    /**
     * 发布状态
     */
    private int publishStatus;
    /**
     * 描述
     */
    private List<String> decript;
    /**
     * 图片
     */
    private List<Images> images;
    /**
     * 积分信息
     */
    private Bounds bounds;
    /**
     * 基础属性
     */
    private List<BaseAttrs> baseAttrs;
    /**
     * skus
     */
    private List<Skus> skus;

}