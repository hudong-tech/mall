package com.tech.gulimall.ware.dao;

import com.tech.gulimall.ware.entity.PurchaseDetailEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-12 21:27:21
 */
@Mapper
public interface PurchaseDetailDao extends BaseMapper<PurchaseDetailEntity> {


    /** 
    * @description: 获取没有采购项的空采购单id 
    * @param: [] 
    * @return: List<Long>
    * @author: phil 
    * @date: 2022/4/15 12:24
    */
    List<Long> getEmptyPurchaseIds();
}
