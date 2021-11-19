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
import com.tech.gulimall.product.dao.AttrGroupDao;
import com.tech.gulimall.product.entity.po.AttrAttrgroupRelationEntity;
import com.tech.gulimall.product.entity.po.AttrEntity;
import com.tech.gulimall.product.entity.po.AttrGroupEntity;
import com.tech.gulimall.product.entity.vo.AttrRespVo;
import com.tech.gulimall.product.entity.vo.AttrVo;
import com.tech.gulimall.product.service.AttrService;
import com.tech.gulimall.product.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service("attrService")
public class AttrServiceImpl extends ServiceImpl<AttrDao, AttrEntity> implements AttrService {

    @Autowired
    private AttrAttrgroupRelationDao relationDao;

    @Autowired
    private AttrGroupDao attrGroupDao;

    @Autowired
    private CategoryService categoryService;

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

        Map<Long, String> attrGroupIdAndNameMap = new HashMap<>(1000);
        Map<Long, String> attrIdAndGroupNameMap = new HashMap<>(1000);

        // 获取属性分组的id-name，组装成map形式
        List<AttrGroupEntity> attrGroupEntities = attrGroupDao.selectList(null);
        for (AttrGroupEntity attrGroupEntity : attrGroupEntities) {
            attrGroupIdAndNameMap.put(attrGroupEntity.getAttrGroupId(),attrGroupEntity.getAttrGroupName());
        }
        // 获取规格参数id 和 所属分组名字的对应关系
        List<AttrAttrgroupRelationEntity> relationEntities = relationDao.selectList(null);
        for (AttrAttrgroupRelationEntity relationEntity : relationEntities) {
            attrIdAndGroupNameMap.put(relationEntity.getAttrId(),attrGroupIdAndNameMap.get(relationEntity.getAttrGroupId()));
        }

        // 获取分类路径名称
        Map<Long, String> catIdPathNameMap = categoryService.getIdPathNameRelation();

        PageUtils pageUtils = new PageUtils(page);
        List<AttrEntity> records = page.getRecords();
        List<AttrRespVo> attrRespVoList = records.stream().map((attrEntity) -> {
            AttrRespVo attrRespVo = new AttrRespVo();
            BeanUtils.copyWithoutNull(attrRespVo, attrEntity, null);
            // 设置分类和分组的名字
            // "catelogName": "手机/数码/手机", //所属分类名字
            attrRespVo.setCatelogName(catIdPathNameMap.get(attrEntity.getCatelogId()));
            //	"groupName": "主体", //所属分组名字
            String groupName = attrIdAndGroupNameMap.get(attrEntity.getAttrId());
            attrRespVo.setGroupName(groupName);

            return attrRespVo;
        }).collect(Collectors.toList());

        pageUtils.setList(attrRespVoList);
        return pageUtils;
    }
}