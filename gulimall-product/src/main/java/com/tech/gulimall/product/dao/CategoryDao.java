package com.tech.gulimall.product.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tech.gulimall.product.entity.po.CategoryEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

/**
 * 商品三级分类
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:50
 */
@Mapper
public interface CategoryDao extends BaseMapper<CategoryEntity> {

    /**
    * @Description: 更新分类的path
    * @Param: [catIdPathMap]
    * @return: void
    * @Author: phil
    * @Date: 2021/11/6 21:57
    */
    void updatePath(@Param("catIdPathMap") Map<Long, String> catIdPathMap);
}
