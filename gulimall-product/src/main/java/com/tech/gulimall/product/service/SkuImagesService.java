package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.SkuImagesEntity;

import java.util.Map;

/**
 * sku图片
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
public interface SkuImagesService extends IService<SkuImagesEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

