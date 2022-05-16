package com.tech.gulimall.ware.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.to.SkuHasStackVo;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.ware.entity.WareSkuEntity;

import java.util.List;
import java.util.Map;

/**
 * 商品库存
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-12 21:27:21
 */
public interface WareSkuService extends IService<WareSkuEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /***
    * @description: 查询sku是否有库存
    * @param: [skuIds]
    * @return: java.util.List<com.tech.gulimall.common.to.SkuHasStackVo>
    * @author: phil
    * @date: 2022/5/10 17:36
    */
    List<SkuHasStackVo> getSkuHasStack(List<Long> skuIds);
}

