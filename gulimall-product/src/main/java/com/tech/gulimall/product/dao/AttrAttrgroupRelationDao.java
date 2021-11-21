package com.tech.gulimall.product.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tech.gulimall.product.entity.po.AttrAttrgroupRelationEntity;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 属性&属性分组关联
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
@Mapper
public interface AttrAttrgroupRelationDao extends BaseMapper<AttrAttrgroupRelationEntity> {

    /***
    * @Description: 获取属性id和属性分组id的对应关系
    * @Param: []
    * @return: Map<属性id,属性分组id>
    * @Author: phil
    * @Date: 2021/11/17 16:12
    */
    @MapKey("t.attr_id")
    Map<Long, Long> getRelation2Maps();

    /***
    * @Description: 批量删除属性&属性分组关联关系
    * @Param: [relationEntities]
    * @return: void
    * @Author: phil
    * @Date: 2021/11/22 0:17
    */
    void removeBatchRelation(@Param("entities") List<AttrAttrgroupRelationEntity> relationEntities);
}
