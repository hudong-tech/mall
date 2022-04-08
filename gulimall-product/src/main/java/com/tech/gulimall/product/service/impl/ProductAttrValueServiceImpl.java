package com.tech.gulimall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.product.dao.ProductAttrValueDao;
import com.tech.gulimall.product.entity.po.ProductAttrValueEntity;
import com.tech.gulimall.product.entity.vo.BaseAttrs;
import com.tech.gulimall.product.service.AttrService;
import com.tech.gulimall.product.service.ProductAttrValueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service("productAttrValueService")
public class ProductAttrValueServiceImpl extends ServiceImpl<ProductAttrValueDao, ProductAttrValueEntity> implements ProductAttrValueService {

    @Autowired
    private AttrService attrService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<ProductAttrValueEntity> page = this.page(
                new Query<ProductAttrValueEntity>().getPage(params),
                new QueryWrapper<ProductAttrValueEntity>()
        );
        return new PageUtils(page);
    }

    @Override
    public void saveSpuBaseAttrs(Long spuId, List<BaseAttrs> baseAttrs) {
        if (null == spuId) {
            throw new BizException("传入参数不完整，无法保存spu基础属性！");
        }
        List<Long> attrIds = baseAttrs.stream().map(BaseAttrs::getAttrId).collect(Collectors.toList());
        Map<Long, String> attrIdAndNameMap = attrService.getAttrNameById(attrIds);

        ArrayList<ProductAttrValueEntity> attrValueEntities = new ArrayList<>();
        for (BaseAttrs baseAttr : baseAttrs) {
            ProductAttrValueEntity attrValueEntity = new ProductAttrValueEntity();
            attrValueEntity.setSpuId(spuId);
            attrValueEntity.setAttrId(baseAttr.getAttrId());
            attrValueEntity.setAttrName(attrIdAndNameMap.get(baseAttr.getAttrId()));
            attrValueEntity.setAttrValue(baseAttr.getAttrValues());
            attrValueEntity.setQuickShow(baseAttr.getShowDesc());
            BeanUtils.updateAuditFields(attrValueEntity, true);
            attrValueEntities.add(attrValueEntity);
        }
        this.saveBatch(attrValueEntities);
    }

}