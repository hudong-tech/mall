package com.tech.gulimall.ware.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.ware.entity.PurchaseEntity;
import com.tech.gulimall.ware.vo.MergeVo;

import java.util.Map;

/**
 * 采购信息
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-12 21:27:21
 */
public interface PurchaseService extends IService<PurchaseEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /*** 
    * @description: 查询未领取的采购单
    * @param: [params] 
    * @return: com.tech.gulimall.common.utils.PageUtils 
    * @author: phil 
    * @date: 2022/4/15 5:44
    */
    PageUtils queryPageUnReceivePurchase(Map<String, Object> params);

    /** 
    * @description: 合并采购需求
    * @param: [mergeVo] 
    * @return: String
    * @author: phil 
    * @date: 2022/4/15 6:05
    */
    String mergePurchase(MergeVo mergeVo);
}

