package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.po.ProductAttrValueEntity;
import com.tech.gulimall.product.entity.vo.BaseAttrs;

import java.util.List;
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

    /** 
    * @description: 保存spu基础属性
    * @param: [spuId, baseAttrs]
    * @return: void 
    * @author: phil 
    * @date: 2022/4/7 1:40
    */
    void saveSpuBaseAttrs(Long spuId, List<BaseAttrs> baseAttrs);
}

