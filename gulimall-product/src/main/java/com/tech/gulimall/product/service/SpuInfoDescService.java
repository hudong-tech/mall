package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.po.SpuInfoDescEntity;

import java.util.Map;

/**
 * spu信息介绍
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
public interface SpuInfoDescService extends IService<SpuInfoDescEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
    * @description: 保存spu的描述图片
    * @param: [descEntity]
    * @return: void
    * @author: phil
    * @date: 2022/4/6 16:24
    */
    void saveSpuInfoDesc(SpuInfoDescEntity descEntity);
}

