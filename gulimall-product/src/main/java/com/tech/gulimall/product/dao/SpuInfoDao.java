package com.tech.gulimall.product.dao;

import com.tech.gulimall.product.entity.po.SpuInfoEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * spu信息
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
@Mapper
public interface SpuInfoDao extends BaseMapper<SpuInfoEntity> {

    /*** 
    * @description: 更新spu状态
    * @param: [spuId, code] 
    * @return: void 
    * @author: phil 
    * @date: 2022/4/30 21:54
    */
    void upSpuStatus(@Param("spuId") Long spuId,@Param("code") int code);
}
