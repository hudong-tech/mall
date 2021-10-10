package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.ProductAttrValueEntity;

import java.util.Map;

/**
 * spu属性值
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
public interface ProductAttrValueService extends IService<ProductAttrValueEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

