package com.tech.gulimall.product.entity.vo;

import lombok.Data;

/**
 * @className: BrandVo
 * @description: 品牌id-名称
     * "brandId": 0,
     * "brandName": "string",
 * @author: phil
 * @date: 2021/11/22
 **/
@Data
public class BrandVo {

    /**
     * 品牌id
     */
    private Long brandId;

    /**
     * 品牌名称
     */
    private String brandName;
}
