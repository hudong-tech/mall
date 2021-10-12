package com.tech.gulimall.ware.dao;

import com.tech.gulimall.ware.entity.WareSkuEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 商品库存
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-12 21:27:21
 */
@Mapper
public interface WareSkuDao extends BaseMapper<WareSkuEntity> {
	
}
