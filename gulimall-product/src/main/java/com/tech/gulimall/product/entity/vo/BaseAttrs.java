package com.tech.gulimall.product.entity.vo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 录入商品 -- 基本属性
 * Auto-generated: 2021-11-23 17:52:33
 *
 * @author bejson.com (i@bejson.com)
 * @website http://www.bejson.com/java2pojo/
 */
@Data
public class BaseAttrs {

    /**
     * 基础属性id
     */
    @TableId
    private Long attrId;
    /**
     * 属性值
     */
    private String attrValues;
    /**
     * 快速展示【是否展示在介绍上；0-否 1-是】
     */
    private int showDesc;

}