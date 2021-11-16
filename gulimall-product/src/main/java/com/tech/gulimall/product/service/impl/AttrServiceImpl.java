package com.tech.gulimall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.product.constant.enums.AttrEnum;
import com.tech.gulimall.product.dao.AttrAttrgroupRelationDao;
import com.tech.gulimall.product.dao.AttrDao;
import com.tech.gulimall.product.entity.po.AttrAttrgroupRelationEntity;
import com.tech.gulimall.product.entity.po.AttrEntity;
import com.tech.gulimall.product.entity.vo.AttrVo;
import com.tech.gulimall.product.service.AttrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.Map;


@Service("attrService")
public class AttrServiceImpl extends ServiceImpl<AttrDao, AttrEntity> implements AttrService {

    @Autowired
    private AttrAttrgroupRelationDao relationDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<AttrEntity> page = this.page(
                new Query<AttrEntity>().getPage(params),
                new QueryWrapper<AttrEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    @Transactional(rollbackFor=Exception.class)
    public void saveAttr(AttrVo attr) {
        AttrEntity attrEntity = new AttrEntity();
        BeanUtils.copyWithoutNull(attrEntity,attr,null);
        BeanUtils.updateAuditFields(attrEntity,true);
        this.save(attrEntity);
        if (AttrEnum.ATTR_TYPE_BASE.getCode() == attr.getAttrType() && !StringUtils.isEmpty(attrEntity.getAttrId()) && !StringUtils.isEmpty(attr.getAttrGroupId())) {
            AttrAttrgroupRelationEntity relationEntity  = new AttrAttrgroupRelationEntity();
            relationEntity.setAttrGroupId(attr.getAttrGroupId());
            relationEntity.setAttrId(attrEntity.getAttrId());
            relationEntity.setAttrSort(0);
            BeanUtils.updateAuditFields(relationEntity,true);
            relationDao.insert(relationEntity);
        }
    }

    @Override
    public PageUtils baseAttrList(Map<String, Object> params, Long catelogId) {
        LambdaQueryWrapper<AttrEntity> queryWrapper = new LambdaQueryWrapper<>();

        String key = (String) params.get("key");
        if (! StringUtils.isEmpty(key)) {
            queryWrapper.eq(AttrEntity::getAttrId, key).or().like(AttrEntity::getAttrName, key);
        }

        if (catelogId != 0) {
            queryWrapper.eq(AttrEntity::getCatelogId, catelogId);
        }

        IPage<AttrEntity> page = this.page(
                new Query<AttrEntity>().getPage(params),
                queryWrapper
        );

        return new PageUtils(page);
    }
}