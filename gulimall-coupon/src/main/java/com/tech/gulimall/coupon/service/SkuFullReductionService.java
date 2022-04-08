package com.tech.gulimall.coupon.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.to.SkuReductionTo;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.coupon.entity.SkuFullReductionEntity;

import java.util.Map;

/**
 * 商品满减信息
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-12 20:49:42
 */
public interface SkuFullReductionService extends IService<SkuFullReductionEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /***
    * @description: 保存sku的优惠满减信息
    * @param: [saveSkuReduction]
    * @return: void
    * @author: phil
    * @date: 2022/4/8 17:02
    */
    void saveSkuReduction(SkuReductionTo skuReductionTo);
}

