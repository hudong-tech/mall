package com.tech.gulimall.ware.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.tech.gulimall.ware.entity.WareSkuEntity;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 商品库存
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-12 21:27:21
 */
@Mapper
public interface WareSkuDao extends BaseMapper<WareSkuEntity> {

    /***
    * @description: 根据skuIds查询库存数量
    * @param: [skuIds]
    * @return: java.util.List<java.util.Map<java.lang.Long,java.lang.Integer>>
    * @author: phil
    * @date: 2022/5/10 18:26
    */
    @MapKey("sku_id")
    List<Map<String, Object>> getStackByIds(@Param("skuIds") List<Long> skuIds);
}
