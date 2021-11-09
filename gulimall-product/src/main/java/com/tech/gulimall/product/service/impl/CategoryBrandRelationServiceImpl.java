package com.tech.gulimall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.product.dao.CategoryBrandRelationDao;
import com.tech.gulimall.product.entity.BrandEntity;
import com.tech.gulimall.product.entity.CategoryBrandRelationEntity;
import com.tech.gulimall.product.entity.CategoryEntity;
import com.tech.gulimall.product.service.BrandService;
import com.tech.gulimall.product.service.CategoryBrandRelationService;
import com.tech.gulimall.product.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service("categoryBrandRelationService")
public class CategoryBrandRelationServiceImpl extends ServiceImpl<CategoryBrandRelationDao, CategoryBrandRelationEntity> implements CategoryBrandRelationService {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private BrandService brandService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<CategoryBrandRelationEntity> page = this.page(
                new Query<CategoryBrandRelationEntity>().getPage(params),
                new QueryWrapper<CategoryBrandRelationEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public void saveDetail(CategoryBrandRelationEntity categoryBrandRelation) {
        Long brandId = categoryBrandRelation.getBrandId();
        Long catelogId = categoryBrandRelation.getCatelogId();
        BrandEntity brandEntity = brandService.getById(brandId);
        CategoryEntity categoryEntity = categoryService.getById(catelogId);
        categoryBrandRelation.setBrandName(brandEntity.getName());
        categoryBrandRelation.setCatelogName(categoryEntity.getName());
        this.save(categoryBrandRelation);
    }

    @Override
    public void updateBrand(Long brandId, String name) {
        if (null == brandId) {
            throw new BizException("品牌id为空");
        }
        List<CategoryBrandRelationEntity> relationEntities = baseMapper.selectList(
                new LambdaQueryWrapper<CategoryBrandRelationEntity>().eq(CategoryBrandRelationEntity::getBrandId, brandId));
        if( null == relationEntities) {
            return;
        }
        for (CategoryBrandRelationEntity relationEntity : relationEntities) {
            relationEntity.setBrandName(name);
        }

        this.updateBatchById(relationEntities);
    }

    @Override
    public void updateCategory(Long catId, String name) {
        if (null == catId) {
            throw new BizException("分类id为空");
        }
        List<CategoryBrandRelationEntity> relationEntities = baseMapper.selectList(
                new LambdaQueryWrapper<CategoryBrandRelationEntity>().eq(CategoryBrandRelationEntity::getCatelogId, catId));
        if( null == relationEntities) {
            return;
        }
        for (CategoryBrandRelationEntity relationEntity : relationEntities) {
            relationEntity.setCatelogName(name);
        }
        this.updateBatchById(relationEntities);
    }
}