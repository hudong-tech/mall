package com.tech.gulimall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.product.dao.BrandDao;
import com.tech.gulimall.product.entity.po.BrandEntity;
import com.tech.gulimall.product.service.BrandService;
import com.tech.gulimall.product.service.CategoryBrandRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Map;


@Service("brandService")
public class BrandServiceImpl extends ServiceImpl<BrandDao, BrandEntity> implements BrandService {

    @Autowired
    private CategoryBrandRelationService categoryBrandRelationService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        LambdaQueryWrapper<BrandEntity> queryWrapper = new LambdaQueryWrapper<>();
        String key = (String) params.get("key");
        if (!StringUtils.isEmpty(key)) {
            queryWrapper.eq(BrandEntity::getBrandId, key).or().like(BrandEntity::getName, key);
        }

        IPage<BrandEntity> page = this.page(
                new Query<BrandEntity>().getPage(params),
                queryWrapper
        );
        return new PageUtils(page);
    }

    @Override
    @Transactional(rollbackFor=Exception.class)
    public void updateDetail(BrandEntity brand) {
        // 保证冗余字段的数据一致
        if (null == brand || StringUtils.isEmpty(brand.getBrandId())) {
            throw new BizException("传入参数不完整，无法进行后续操作");
        }
        BrandEntity dbBrand = this.getById(brand);
        if (null == dbBrand) {
            throw new BizException("根据Id未找到品牌信息，无法进行更新数据!");
        }
        BeanUtils.copyWithoutNull(dbBrand,brand,null);
        BeanUtils.updateAuditFields(dbBrand,false,"hudong");
        this.updateById(dbBrand);
        categoryBrandRelationService.updateBrand(brand.getBrandId(), brand.getName());
    }
}