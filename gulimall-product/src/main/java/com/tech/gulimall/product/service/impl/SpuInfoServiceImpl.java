package com.tech.gulimall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.product.dao.SpuInfoDao;
import com.tech.gulimall.product.entity.po.SpuInfoEntity;
import com.tech.gulimall.product.entity.vo.SpuSaveVo;
import com.tech.gulimall.product.service.SpuInfoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;


@Service("spuInfoService")
public class SpuInfoServiceImpl extends ServiceImpl<SpuInfoDao, SpuInfoEntity> implements SpuInfoService {

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
        // 1.保存spu基本信息 pms_spu_info
        // 2.保存spu的描述图片 pms_spu_info_desc
        // 3.保存spu的图片集 pms_spu_images
        // 4.保存spu的规格参数 pms_product_attr_value
        // 5.保存spu的积分信息 gulimall_sms -> sms_spu_bounds
        // 6.保存当前spu对应的所有sku信息
        // 6.1 sku的基本信息 pms_sku_info
        // 6.2 sku的图片信息 pms_spu_images
        // 6.3 sku的销售属性信息 pms_sku_sale_attr_value
        // 6.4 sku的优惠满减信息 gulimall_sms -> sms_sku_ladder(打折)    sms_sku_full_reduction(满减) sms_member_price(会员价格)
    }

}