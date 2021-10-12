package com.tech.gulimall.order.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.order.entity.MqMessageEntity;

import java.util.Map;

/**
 * 
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-12 21:22:23
 */
public interface MqMessageService extends IService<MqMessageEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

