package com.tech.gulimall.product.dao;

import com.tech.gulimall.product.entity.CategoryEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商品三级分类
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:50
 */
@Mapper
public interface CategoryDao extends BaseMapper<CategoryEntity> {
	
}
