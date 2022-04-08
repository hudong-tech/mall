package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.po.SkuSaleAttrValueEntity;
import com.tech.gulimall.product.entity.vo.Attr;

import java.util.List;
import java.util.Map;

/**
 * sku销售属性&值
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
public interface SkuSaleAttrValueService extends IService<SkuSaleAttrValueEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
    * @description: 保存sku的多个销售属性
    * @param: [skuId, attrs]
    * @return: void
    * @author: phil
    * @date: 2022/4/7 17:25
    */
    void saveSkuSaleAttrs(Long skuId, List<Attr> attrs);
}

