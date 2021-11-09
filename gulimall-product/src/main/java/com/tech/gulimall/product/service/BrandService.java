package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.BrandEntity;

import java.util.Map;

/**
 * 品牌
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:50
 */
public interface BrandService extends IService<BrandEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
    * @Description: 更新，并处理冗余，如品牌-三级分类关联关系
    * @Param: [brand]
    * @return: void
    * @Author: phil
    * @Date: 2021/11/8 16:47
    */
    void updateDetail(BrandEntity brand);
}

