package com.tech.gulimall.product.dao;

import com.tech.gulimall.product.entity.po.AttrEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 商品属性
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
@Mapper
public interface AttrDao extends BaseMapper<AttrEntity> {

    /***
    * @description: 过滤出可被检索的属性id集合
    * @param: [attrIds]
    * @return: java.util.List<java.lang.Long>
    * @author: phil
    * @date: 2022/4/30 22:20
    */
    List<Long> selectSearchAttrIds(@Param("attrIds") List<Long> attrIds);
}
