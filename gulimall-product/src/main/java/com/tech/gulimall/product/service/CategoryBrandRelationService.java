package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.CategoryBrandRelationEntity;

import java.util.Map;

/**
 * 品牌分类关联
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
public interface CategoryBrandRelationService extends IService<CategoryBrandRelationEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
    * @Description: 保存品牌-三级分类关联关系
    * @Param: [categoryBrandRelation]
    * @return: void
    * @Author: phil
    * @Date: 2021/11/8 16:38
    */
    void saveDetail(CategoryBrandRelationEntity categoryBrandRelation);

    /**
    * @Description: 根据品牌id，更新品牌名称
    * @Param: [brandId, name]
    * @return: void
    * @Author: phil
    * @Date: 2021/11/8 17:00
    */
    void updateBrand(Long brandId, String name);

    /**
    * @Description: 根据三级分类id，更新分类名称
    * @Param: [catId, name]
    * @return: void
    * @Author: phil
    * @Date: 2021/11/8 19:24
    */
    void updateCategory(Long catId, String name);
}

