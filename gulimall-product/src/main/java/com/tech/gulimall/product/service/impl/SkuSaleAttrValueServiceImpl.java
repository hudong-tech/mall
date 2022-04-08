package com.tech.gulimall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.product.dao.SkuSaleAttrValueDao;
import com.tech.gulimall.product.entity.po.SkuSaleAttrValueEntity;
import com.tech.gulimall.product.entity.vo.Attr;
import com.tech.gulimall.product.service.SkuSaleAttrValueService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Service("skuSaleAttrValueService")
public class SkuSaleAttrValueServiceImpl extends ServiceImpl<SkuSaleAttrValueDao, SkuSaleAttrValueEntity> implements SkuSaleAttrValueService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<SkuSaleAttrValueEntity> page = this.page(
                new Query<SkuSaleAttrValueEntity>().getPage(params),
                new QueryWrapper<SkuSaleAttrValueEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    @Transactional
    public void saveSkuSaleAttrs(Long skuId, List<Attr> attrs) {
        if (null == skuId) {
            throw new BizException("未传入skuId, 无法保存销售属性！");
        }

        ArrayList<SkuSaleAttrValueEntity> skuSaleAttrValueEntities = new ArrayList<>();
        for (Attr attr : attrs) {
            SkuSaleAttrValueEntity entity = new SkuSaleAttrValueEntity();
            BeanUtils.copyProperties(attr, entity);
            entity.setSkuId(skuId);
            BeanUtils.updateAuditFields(entity,true);
            skuSaleAttrValueEntities.add(entity);
        }
        this.saveBatch(skuSaleAttrValueEntities);
    }

}