package com.tech.gulimall.order.dao;

import com.tech.gulimall.order.entity.MqMessageEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-12 21:22:23
 */
@Mapper
public interface MqMessageDao extends BaseMapper<MqMessageEntity> {
	
}
