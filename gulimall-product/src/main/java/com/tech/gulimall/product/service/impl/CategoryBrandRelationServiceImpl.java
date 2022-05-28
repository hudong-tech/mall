package com.tech.gulimall.product.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.common.utils.StringUtils;
import com.tech.gulimall.product.dao.CategoryBrandRelationDao;
import com.tech.gulimall.product.entity.po.BrandEntity;
import com.tech.gulimall.product.entity.po.CategoryBrandRelationEntity;
import com.tech.gulimall.product.entity.po.CategoryEntity;
import com.tech.gulimall.product.entity.vo.BrandVo;
import com.tech.gulimall.product.service.BrandService;
import com.tech.gulimall.product.service.CategoryBrandRelationService;
import com.tech.gulimall.product.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
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
        if( relationEntities.size() == 0) {
            return;
        }
        for (CategoryBrandRelationEntity relationEntity : relationEntities) {
            relationEntity.setCatelogName(name);
        }
        this.updateBatchById(relationEntities);
    }

    @Override
    public List<BrandEntity> getBrandsByCatId(Long catId) {
        List<Long> brandIds = new ArrayList<>(16);
        List<BrandEntity> brandEntities = new ArrayList<>();
        if (StringUtils.isEmpty(catId)) {
            throw new BizException("传入三级分类id为空，无法进行下一步操作");
        }
        List<CategoryBrandRelationEntity> relationEntities = this.baseMapper.selectList(
                new LambdaQueryWrapper<CategoryBrandRelationEntity>().eq(CategoryBrandRelationEntity::getCatelogId, catId));
        for (CategoryBrandRelationEntity relationEntity : relationEntities) {
            brandIds.add(relationEntity.getBrandId());
        }
        if (CollectionUtil.isNotEmpty(brandIds)) {
            brandEntities = brandService.getBrandList(brandIds);
        }
        return brandEntities;
    }

    @Override
    public List<BrandVo> getBrandsVoByCatId(Long catId) {
        List<BrandVo> brandVos = new ArrayList<>(16);
        List<BrandEntity> brandEntities = getBrandsByCatId(catId);
        for (BrandEntity brandEntity : brandEntities) {
            BrandVo brandVo = new BrandVo();
            brandVo.setBrandId(brandEntity.getBrandId());
            brandVo.setBrandName(brandEntity.getName());
            brandVos.add(brandVo);
        }
        return brandVos;
    }
}