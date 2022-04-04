package com.tech.gulimall.product.entity.vo;

import lombok.Data;

/**
 * @className: Images
 * @description: 录入商品 -- 图片信息
 * @author: phil
 * @date: 2021/11/23
 **/
@Data
public class Images {
    /**
     * 图片url
     */
    private String imgUrl;
    /**
     * 默认展示图
     */
    private int defaultImg;
}
