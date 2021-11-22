package com.tech.gulimall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.CollectionUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.product.dao.AttrAttrgroupRelationDao;
import com.tech.gulimall.product.entity.po.AttrAttrgroupRelationEntity;
import com.tech.gulimall.product.entity.vo.AttrGroupRelationVo;
import com.tech.gulimall.product.service.AttrAttrgroupRelationService;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service("attrAttrgroupRelationService")
public class AttrAttrgroupRelationServiceImpl extends ServiceImpl<AttrAttrgroupRelationDao, AttrAttrgroupRelationEntity> implements AttrAttrgroupRelationService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<AttrAttrgroupRelationEntity> page = this.page(
                new Query<AttrAttrgroupRelationEntity>().getPage(params),
                new QueryWrapper<AttrAttrgroupRelationEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public void removeRelation(AttrGroupRelationVo[] vos) {
        List<AttrAttrgroupRelationEntity> relationEntities = Arrays.asList(vos).stream().map((item) -> {
            AttrAttrgroupRelationEntity relationEntity = new AttrAttrgroupRelationEntity();
            BeanUtils.copyWithoutNull(relationEntity, item, null);
            return relationEntity;
        }).collect(Collectors.toList());
        baseMapper.removeBatchRelation(relationEntities);
    }

    @Override
    public void saveBatch(List<AttrGroupRelationVo> vos) {
        if (CollectionUtils.isEmpty(vos)) {
            throw new BizException("传入参数为空，无法进行下一步操作！");
        }
        List<AttrAttrgroupRelationEntity> relationEntities = vos.stream().map(attr -> {
            AttrAttrgroupRelationEntity relationEntity = new AttrAttrgroupRelationEntity();
            BeanUtils.copyWithoutNull(relationEntity, attr, null);
            return relationEntity;
        }).collect(Collectors.toList());
        BeanUtils.updateAuditFields(relationEntities,true,"system");
        this.saveBatch(relationEntities);
    }

}