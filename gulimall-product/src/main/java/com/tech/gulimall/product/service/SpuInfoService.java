package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.po.SpuInfoEntity;
import com.tech.gulimall.product.entity.vo.SpuSaveVo;

import java.util.Map;

/**
 * spu信息
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
public interface SpuInfoService extends IService<SpuInfoEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
     * 保存spu信息
     * @param spuSaveVo
     */
    void saveSpuInfo(SpuSaveVo spuSaveVo);

    /***
    * @description: spu检索
    * @param: [params]
    * @return: com.tech.gulimall.common.utils.PageUtils
    * @author: phil
    * @date: 2022/4/9 2:36
    */
    PageUtils queryPageByCondition(Map<String, Object> params);

    /**
    * @description: 商品上架
    * @param: [spuId]
    * @return: void
    * @author: phil
    * @date: 2022/4/17 22:13
    */
    void upSpuForSearch(Long spuId);
}

