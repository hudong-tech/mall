package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.po.SkuInfoEntity;

import java.util.Map;

/**
 * sku信息
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
public interface SkuInfoService extends IService<SkuInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
    * @description:  sku检索
    * @param: [params]
    * @return: com.tech.gulimall.common.utils.PageUtils
    * @author: phil
    * @date: 2022/4/9 3:04
    */
    PageUtils queryPageByCondition(Map<String, Object> params);
}

