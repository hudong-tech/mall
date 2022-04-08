package com.tech.gulimall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.common.utils.StringUtils;
import com.tech.gulimall.product.dao.SkuInfoDao;
import com.tech.gulimall.product.entity.po.SkuInfoEntity;
import com.tech.gulimall.product.service.SkuInfoService;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Map;


@Service("skuInfoService")
public class SkuInfoServiceImpl extends ServiceImpl<SkuInfoDao, SkuInfoEntity> implements SkuInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SkuInfoEntity> page = this.page(
                new Query<SkuInfoEntity>().getPage(params),
                new QueryWrapper<SkuInfoEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPageByCondition(Map<String, Object> params) {
        LambdaQueryWrapper<SkuInfoEntity> queryWrapper = new LambdaQueryWrapper<>();
        String key = (String) params.get("key");

        if (StringUtils.isNotEmpty(key)) {
            queryWrapper.and(wrapper ->
              wrapper.eq(SkuInfoEntity::getSkuId, key).or().like(SkuInfoEntity::getSkuName, key)
            );
        }

        String catelogId = (String) params.get("catelogId");
        if (StringUtils.isNotEmpty(catelogId)) {
            queryWrapper.eq(SkuInfoEntity::getCatalogId, catelogId);
        }

        String brandId = (String) params.get("brandId");
        if (StringUtils.isNotEmpty(brandId)) {
            queryWrapper.eq(SkuInfoEntity::getBrandId, brandId);
        }

        String min = (String) params.get("min");
        if (StringUtils.isNotEmpty(min)) {
            BigDecimal minDecimal = new BigDecimal(min);
            if (minDecimal.compareTo(new BigDecimal(0)) == 1) {
                queryWrapper.ge(SkuInfoEntity::getPrice, min);
            }
        }

        String max = (String) params.get("max");
        if (StringUtils.isNotEmpty(max)) {
            BigDecimal maxBigDecimal = new BigDecimal(max);
            if (maxBigDecimal.compareTo(new BigDecimal(0)) == 1) {
                queryWrapper.le(SkuInfoEntity::getPrice, max);
            }
        }

        IPage<SkuInfoEntity> page = this.page(
                new Query<SkuInfoEntity>().getPage(params),
                queryWrapper);

        return new PageUtils(page);
    }

}