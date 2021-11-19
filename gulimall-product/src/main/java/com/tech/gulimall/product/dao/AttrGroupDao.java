package com.tech.gulimall.product.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tech.gulimall.product.entity.po.AttrGroupEntity;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

/**
 * 属性分组
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
@Mapper
public interface AttrGroupDao extends BaseMapper<AttrGroupEntity> {

    /***
    * @Description:  获取所有属性分组的id，name,组装成map
    * @Param: []
    * @return: Map<id, name>
    * @Author: phil
    * @Date: 2021/11/17 14:06
    */
    @MapKey("attr_group_id")
    Map<Long, String> getIdName2Map();
}
