package com.tech.gulimall.product.service.impl;

import com.alibaba.fastjson.TypeReference;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.constant.enums.RCodeEnum;
import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.to.SkuEsModel;
import com.tech.gulimall.common.to.SkuHasStackVo;
import com.tech.gulimall.common.to.SkuReductionTo;
import com.tech.gulimall.common.to.SpuBoundTo;
import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.common.utils.R;
import com.tech.gulimall.product.constant.enums.ProductStatusEnum;
import com.tech.gulimall.product.dao.SpuInfoDao;
import com.tech.gulimall.product.entity.po.*;
import com.tech.gulimall.product.entity.vo.BaseAttrs;
import com.tech.gulimall.product.entity.vo.Images;
import com.tech.gulimall.product.entity.vo.Skus;
import com.tech.gulimall.product.entity.vo.SpuSaveVo;
import com.tech.gulimall.product.feign.CouponFeignService;
import com.tech.gulimall.product.feign.SearchFeignService;
import com.tech.gulimall.product.feign.WareFeignService;
import com.tech.gulimall.product.service.*;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service("spuInfoService")
public class SpuInfoServiceImpl extends ServiceImpl<SpuInfoDao, SpuInfoEntity> implements SpuInfoService {

    @Autowired
    private SpuInfoDescService spuInfoDescService;

    @Autowired
    private SpuImagesService spuImagesService;

    @Autowired
    private ProductAttrValueService attrValueService;

    @Autowired
    private SkuInfoService skuInfoService;

    @Autowired
    private SkuImagesService skuImagesService;

    @Autowired
    private SkuSaleAttrValueService skuSaleAttrValueService;

    @Autowired
    private CouponFeignService couponFeignService;

    @Autowired
    private BrandService brandService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private SearchFeignService searchFeignService;

    @Autowired
    private AttrService attrService;

    @Autowired
    private WareFeignService wareFeignService;


    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SpuInfoEntity> page = this.page(
                new Query<SpuInfoEntity>().getPage(params),
                new QueryWrapper<SpuInfoEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveSpuInfo(SpuSaveVo spuSaveVo) {
        // 1.??????spu???????????? pms_spu_info
        SpuInfoEntity spuInfoEntity = new SpuInfoEntity();
        BeanUtils.copyProperties(spuSaveVo, spuInfoEntity);
        BeanUtils.updateAuditFields(spuInfoEntity,true);
        this.baseMapper.insert(spuInfoEntity);
        // 2.??????spu??????????????? pms_spu_info_desc
        SpuInfoDescEntity descEntity = new SpuInfoDescEntity();
        descEntity.setSpuId(spuInfoEntity.getId());
        List<String> decript = spuSaveVo.getDecript();
        descEntity.setDecript(String.join(",", decript));
        BeanUtils.updateAuditFields(descEntity, true);
        spuInfoDescService.saveSpuInfoDesc(descEntity);
        // 3.??????spu???????????? pms_spu_images
        List<String> images = spuSaveVo.getImages();
        spuImagesService.saveImages(spuInfoEntity.getId(), images);
        // 4.??????spu??????????????? pms_product_attr_value
        List<BaseAttrs> baseAttrs = spuSaveVo.getBaseAttrs();
        attrValueService.saveSpuBaseAttrs(spuInfoEntity.getId(), baseAttrs);
        // 5.??????spu??????????????? gulimall_sms -> sms_spu_bounds
        SpuBoundTo spuBoundTo = new SpuBoundTo();
        BeanUtils.copyProperties(spuSaveVo.getBounds(), spuBoundTo);
        spuBoundTo.setSpuId(spuInfoEntity.getId());
        R saveR = couponFeignService.save(spuBoundTo);
        if (saveR.getCode() != 0) {
            log.error("????????????spu?????????????????????" + saveR.getMsg());
        }

        // 6.????????????spu???????????????sku??????
        List<Skus> skus = spuSaveVo.getSkus();
        if (null != skus && skus.size() > 0) {
            for (Skus sku : skus) {
                // 6.1 sku??????????????? pms_sku_info
                SkuInfoEntity skuInfoEntity = new SkuInfoEntity();
                BeanUtils.copyProperties(sku,skuInfoEntity);
                skuInfoEntity.setSpuId(spuInfoEntity.getId());
                skuInfoEntity.setCatalogId(spuInfoEntity.getCatalogId());
                skuInfoEntity.setBrandId(spuInfoEntity.getBrandId());
                skuInfoEntity.setSaleCount(0L);
                for (Images image : sku.getImages()) {
                    if (image.getDefaultImg() == 1) {
                        skuInfoEntity.setSkuDefaultImg(image.getImgUrl());
                    }
                }
                BeanUtils.updateAuditFields(skuInfoEntity,true);
                skuInfoService.save(skuInfoEntity);
                // 6.2 sku??????????????? pms_sku_images
                // filter ???????????? ????????????????????????????????????
                List<SkuImagesEntity> skuImagesEntities = sku.getImages().stream().map(skuImage -> {
                    SkuImagesEntity skuImagesEntity = new SkuImagesEntity();
                    BeanUtils.copyProperties(skuImage, skuImagesEntity);
                    skuImagesEntity.setSkuId(skuInfoEntity.getSkuId());
                    return skuImagesEntity;
                }).filter(skuImage ->
                    StringUtils.isNotEmpty(skuImage.getImgUrl())
                ).collect(Collectors.toList());
                skuImagesService.saveBatch(skuImagesEntities);
                // 6.3 sku????????????????????? pms_sku_sale_attr_value
                skuSaleAttrValueService.saveSkuSaleAttrs(skuInfoEntity.getSkuId(), sku.getAttr());
                // 6.4 sku????????????????????? gulimall_sms -> sms_sku_ladder(??????)    sms_sku_full_reduction(??????) sms_member_price(????????????)
                SkuReductionTo skuReductionTo = new SkuReductionTo();
                BeanUtils.copyProperties(sku,skuReductionTo);
                skuReductionTo.setSkuId(skuInfoEntity.getSkuId());
                // ????????????????????????0?????? ???????????????0
                // BigDecimal??????????????????1,????????????0 skuReductionTo.getFullPrice().compareTo(new BigDecimal("0"))
                if (skuReductionTo.getFullCount() > 0 || skuReductionTo.getFullPrice().compareTo(new BigDecimal("0")) == 1) {
                    R r = couponFeignService.saveSkuReductionTo(skuReductionTo);
                    if (r.getCode() != 0) {
                        log.error("????????????sku?????????????????????" + r.getMsg());
                    }
                }
            }
        }
    }

    @Override
    public PageUtils queryPageByCondition(Map<String, Object> params) {
        /**
         * status: 2
         * key:
         * brandId: 9
         * catelogId: 225
         */
        LambdaQueryWrapper<SpuInfoEntity> queryWrapper = new LambdaQueryWrapper<>();
        String key = (String) params.get("key");
        if (StringUtils.isNotEmpty(key)) {
            queryWrapper.and(w ->
                w.eq(SpuInfoEntity::getId, key).or().like(SpuInfoEntity::getSpuName, key)
            );
        }
        String status = (String) params.get("status");
        if (StringUtils.isNotEmpty(status)) {
            queryWrapper.eq(SpuInfoEntity::getPublishStatus, status);
        }
        String brandId = (String) params.get("brandId");
        if (StringUtils.isNotEmpty(brandId)) {
            queryWrapper.eq(SpuInfoEntity::getBrandId, brandId);
        }

        String catelogId = (String) params.get("catelogId");
        if (StringUtils.isNotEmpty(catelogId)) {
            queryWrapper.eq(SpuInfoEntity::getCatalogId, catelogId);
        }

        IPage<SpuInfoEntity> page = this.page(
                new Query<SpuInfoEntity>().getPage(params),
                queryWrapper
        );

        return new PageUtils(page);
    }

    @Override
    public void upSpuForSearch(Long spuId) {
        // 0. ????????????spu??????
        SpuInfoEntity dbSpuInfoEntity = this.baseMapper.selectById(spuId);
        if (null == dbSpuInfoEntity) {
            throw new BizException("??????????????????????????????spu?????????");
        }
        if (dbSpuInfoEntity.getPublishStatus() == ProductStatusEnum.SPU_UP.getCode()){
            throw new BizException("??????????????????????????????????????????????????????");
        }
        // 1. ????????????spuId???????????????sku????????????????????????????????????
        List<SkuInfoEntity> skuInfoEntities = skuInfoService.getSkuBySpuId(spuId);

        BrandEntity brandEntity = null;
        CategoryEntity categoryEntity = null;
        if (null != dbSpuInfoEntity.getBrandId()) {
            brandEntity = brandService.getById(dbSpuInfoEntity.getBrandId());
        }
        if (null != dbSpuInfoEntity.getCatalogId()) {
            categoryEntity = categoryService.getById(dbSpuInfoEntity.getCatalogId());
        }

        // 2. ????????????sku?????????????????????????????????????????????
        List<ProductAttrValueEntity> productAttrValueEntities = attrValueService.list(new LambdaQueryWrapper<ProductAttrValueEntity>()
                .eq(ProductAttrValueEntity::getSpuId, spuId));
        List<Long> attrIds = productAttrValueEntities.stream().map(attr -> attr.getAttrId()).collect(Collectors.toList());
        List<Long> searchIds = attrService.selectSearchAttrIds(attrIds);
        HashSet<Long> searchIdsSet = new HashSet<>(searchIds);
        // 2.1 ????????????????????????
        List<SkuEsModel.Attr> searchAttrs = productAttrValueEntities.stream().filter(
                entity -> searchIdsSet.contains(entity.getAttrId())
        ).map(entity -> {
            SkuEsModel.Attr attr = new SkuEsModel.Attr();
            BeanUtils.copyWithoutNull(attr, entity);
            return attr;
        }).collect(Collectors.toList());

        // 3. ??????????????????????????????????????????????????????
        Map<Long, Boolean> stockMap = null;
        try {
            List<Long> skuIds = skuInfoEntities.stream().map(SkuInfoEntity::getSkuId).collect(Collectors.toList());
            R r = wareFeignService.getSkuHasStack(skuIds);
            if (RCodeEnum.SUCCESS.getCode() == r.getCode()) {
                TypeReference<List<SkuHasStackVo>> typeReference = new TypeReference<List<SkuHasStackVo>>() {
                };
                stockMap = r.getData(typeReference).stream().collect(Collectors.toMap(SkuHasStackVo::getSkuId, SkuHasStackVo::getHasStack));
            }
        } catch (Exception e) {
            log.error("??????????????????????????????!", e);
        }

        // 4. ????????????sku?????????
        Map<Long, Boolean> finalStockMap = stockMap;
        final BrandEntity finalBrandEntity = brandEntity;
        final CategoryEntity finalCategoryEntity = categoryEntity;

        List<SkuEsModel> skuEsModelList = skuInfoEntities.stream().map(sku -> {
            SkuEsModel skuEsModel = new SkuEsModel();
            BeanUtils.copyProperties(sku, skuEsModel);
            skuEsModel.setSkuPrice(sku.getPrice());
            skuEsModel.setSkuImg(sku.getSkuDefaultImg());
            // 5.1 ?????????????????????0
            skuEsModel.setHotScore(0L);
            // 5. ????????????????????????????????????
            if (null != finalBrandEntity) {
                skuEsModel.setBrandName(finalBrandEntity.getName());
                skuEsModel.setBrandImg(finalBrandEntity.getLogo());
            }

            if (null != finalCategoryEntity) {
                skuEsModel.setCatelogId(finalCategoryEntity.getCatId());
                skuEsModel.setCatelogName(finalCategoryEntity.getName());
            }

            // 5.2 ?????????????????????
            skuEsModel.setAttrs(searchAttrs);
            // 5.3 ?????????????????????
            skuEsModel.setHasStock(finalStockMap == null ? false : finalStockMap.get(sku.getSkuId()));

            return skuEsModel;
        }).collect(Collectors.toList());

//          System.out.println("skuEsModelList:" + JSONArray.parseArray(JSON.toJSONString(skuEsModelList)));

        // 6. ???????????????es????????????
        R r = null;

        if (skuEsModelList.size() != 0) {
            r = searchFeignService.saveProductAsIndices(skuEsModelList);
        }
        if (null != r && RCodeEnum.SUCCESS.getCode() == r.getCode()) {
            dbSpuInfoEntity.setPublishStatus(ProductStatusEnum.SPU_UP.getCode());
            dbSpuInfoEntity.setUpdatedBy("admin");
            BeanUtils.updateAuditFields(dbSpuInfoEntity,false);
            this.baseMapper.updateById(dbSpuInfoEntity);
        } else {
            log.error("????????????es???????????????");
            // 7. todo ???????????????????????????????????? ???????????????????????????????????????
            // Feign????????????
            /**
             * 1???????????????????????????????????????json
             *    SynchronousMethodHandler.class
             *      RequestTemplate template = this.buildTemplateFromArgs.create(argv);
             * 2???????????????????????????
             *      return this.executeAndDecode(template);
             * 3?????????????????????????????????
             *      while(true) {
             *          try {
             *             return this.executeAndDecode(template);
             *          } catch(RetryableException e) {
             *              try{
             *                 retryer.continueOrPropagate(e);
             *              } catch () {
             *                  // ???????????????????????????
             *                  throw ex;
             *              }
             *              // ???????????????
             *              countinue;
             *          }
             *      }
             */
        }


    }

}