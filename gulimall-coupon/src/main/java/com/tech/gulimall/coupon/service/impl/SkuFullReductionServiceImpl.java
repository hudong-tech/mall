package com.tech.gulimall.coupon.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.to.MemberPrice;
import com.tech.gulimall.common.to.SkuReductionTo;
import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.coupon.dao.SkuFullReductionDao;
import com.tech.gulimall.coupon.entity.MemberPriceEntity;
import com.tech.gulimall.coupon.entity.SkuFullReductionEntity;
import com.tech.gulimall.coupon.entity.SkuLadderEntity;
import com.tech.gulimall.coupon.service.MemberPriceService;
import com.tech.gulimall.coupon.service.SkuFullReductionService;
import com.tech.gulimall.coupon.service.SkuLadderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Service("skuFullReductionService")
public class SkuFullReductionServiceImpl extends ServiceImpl<SkuFullReductionDao, SkuFullReductionEntity> implements SkuFullReductionService {

    @Autowired
    private SkuLadderService skuLadderService;

    @Autowired
    private MemberPriceService memberPriceService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SkuFullReductionEntity> page = this.page(
                new Query<SkuFullReductionEntity>().getPage(params),
                new QueryWrapper<SkuFullReductionEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public void saveSkuReduction(SkuReductionTo skuReductionTo) {
        // 6.4 sku的优惠满减信息 gulimall_sms -> sms_sku_ladder(打折)    sms_sku_full_reduction(满减) sms_member_price(会员价格)
        // 1.sms_sku_full_reduction
        if (skuReductionTo.getFullCount() > 0) {
            SkuFullReductionEntity skuFullReductionEntity = new SkuFullReductionEntity();
            BeanUtils.copyProperties(skuReductionTo,skuFullReductionEntity);
            BeanUtils.updateAuditFields(skuFullReductionEntity, true);
            this.baseMapper.insert(skuFullReductionEntity);
        }

        // 2.sms_sku_ladder
        if (skuReductionTo.getFullPrice().compareTo(new BigDecimal("0")) == 1) {
            SkuLadderEntity skuLadderEntity = new SkuLadderEntity();
            BeanUtils.copyProperties(skuReductionTo,skuLadderEntity);
            BeanUtils.updateAuditFields(skuLadderEntity, true);
            skuLadderService.save(skuLadderEntity);
        }

        // 3.sms_member_price

        List<MemberPrice> memberPriceList = skuReductionTo.getMemberPrice();
        List<MemberPriceEntity> memberPriceEntities = new ArrayList<>();
        for (MemberPrice memberPrice : memberPriceList) {
            if (memberPrice.getPrice().compareTo(new BigDecimal("0")) == 1) {
                MemberPriceEntity memberPriceEntity = new MemberPriceEntity();
                memberPriceEntity.setSkuId(skuReductionTo.getSkuId());
                memberPriceEntity.setMemberLevelId(memberPrice.getId());
                memberPriceEntity.setMemberPrice(memberPrice.getPrice());
                memberPriceEntity.setMemberLevelName(memberPrice.getName());
                memberPriceEntity.setAddOther(1);
                BeanUtils.updateAuditFields(memberPriceEntity,true);
                memberPriceEntities.add(memberPriceEntity);
            }
        }
        memberPriceService.saveBatch(memberPriceEntities);
    }

}