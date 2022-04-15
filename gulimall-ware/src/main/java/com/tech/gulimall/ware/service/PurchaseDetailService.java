package com.tech.gulimall.ware.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.ware.entity.PurchaseDetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-12 21:27:21
 */
public interface PurchaseDetailService extends IService<PurchaseDetailEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
    * @description: 根据 采购单id 批量查询 采购项信息
    * @param: [purchaseList]
    * @return: java.util.List<com.tech.gulimall.ware.entity.PurchaseDetailEntity>
    * @author: phil
    * @date: 2022/4/15 10:02
    */
    List<PurchaseDetailEntity> listDetailByPurchaseIds(List<Long> purchaseIds);
}

