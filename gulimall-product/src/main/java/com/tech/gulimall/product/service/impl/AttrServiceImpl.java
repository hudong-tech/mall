package com.tech.gulimall.product.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.google.common.base.Splitter;
import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.common.utils.StringUtils;
import com.tech.gulimall.product.constant.enums.AttrEnum;
import com.tech.gulimall.product.dao.AttrAttrgroupRelationDao;
import com.tech.gulimall.product.dao.AttrDao;
import com.tech.gulimall.product.dao.AttrGroupDao;
import com.tech.gulimall.product.entity.po.AttrAttrgroupRelationEntity;
import com.tech.gulimall.product.entity.po.AttrEntity;
import com.tech.gulimall.product.entity.po.AttrGroupEntity;
import com.tech.gulimall.product.entity.po.CategoryEntity;
import com.tech.gulimall.product.entity.vo.AttrRespVo;
import com.tech.gulimall.product.entity.vo.AttrVo;
import com.tech.gulimall.product.service.AttrService;
import com.tech.gulimall.product.service.CategoryService;
import org.apache.commons.beanutils.ConvertUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
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

    /**
     * ???????????????,????????????????????????;??????????????????????????????????????????????????????????????????;?????????
     */
    private static final String MULTIPLE_VALUES_FlAG= ";";

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
        if (null == attr || null == attr.getAttrType() || null == attr.getValueType()
                || null == attr.getCatelogId() || StringUtils.isEmpty(attr.getIcon())
                || null == attr.getShowDesc() || null == attr.getEnable() || null == attr.getSearchType() ) {
            throw new BizException("??????????????????????????????????????????????????????");
        }

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
    public PageUtils baseAttrList(Map<String, Object> params, Long catelogId, String type) {
        LambdaQueryWrapper<AttrEntity> queryWrapper = new LambdaQueryWrapper<>();

        if (StringUtils.isEmpty(type)) {
            throw new BizException("????????????????????????");
        }
        queryWrapper.eq(AttrEntity::getAttrType, AttrEnum.ATTR_TYPE_BASE.getType().equals(type) ? AttrEnum.ATTR_TYPE_BASE.getCode() : AttrEnum.ATTR_TYPE_PRODUCT.getCode());

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

        // ?????????????????????id-name????????????map??????
        List<AttrGroupEntity> attrGroupEntities = attrGroupDao.selectList(null);
        for (AttrGroupEntity attrGroupEntity : attrGroupEntities) {
            attrGroupIdAndNameMap.put(attrGroupEntity.getAttrGroupId(),attrGroupEntity.getAttrGroupName());
        }
        // ??????????????????id ??? ?????????????????????????????????
        List<AttrAttrgroupRelationEntity> relationEntities = relationDao.selectList(null);
        for (AttrAttrgroupRelationEntity relationEntity : relationEntities) {
            attrIdAndGroupNameMap.put(relationEntity.getAttrId(),attrGroupIdAndNameMap.get(relationEntity.getAttrGroupId()));
        }

        // ????????????????????????
        Map<Long, String> catIdPathNameMap = categoryService.getIdPathNameRelation();

        PageUtils pageUtils = new PageUtils(page);
        List<AttrEntity> records = page.getRecords();
        List<AttrRespVo> attrRespVoList = records.stream().map((attrEntity) -> {
            AttrRespVo attrRespVo = new AttrRespVo();
            BeanUtils.copyWithoutNull(attrRespVo, attrEntity, null);
            // ??????????????????????????????
            // "catelogName": "??????/??????/??????", //??????????????????
            attrRespVo.setCatelogName(catIdPathNameMap.get(attrEntity.getCatelogId()));
            //	"groupName": "??????", //??????????????????
            // ????????????????????????????????????
            if (AttrEnum.ATTR_TYPE_BASE.getType().equals(type)) {
                String groupName = attrIdAndGroupNameMap.get(attrEntity.getAttrId());
                attrRespVo.setGroupName(groupName);
            }
            return attrRespVo;
        }).collect(Collectors.toList());

        pageUtils.setList(attrRespVoList);
        return pageUtils;
    }

    @Override
    public AttrRespVo getAttrInfo(Long attrId) {
        String attrGroupName = null;
        Long attrGroupId = null;
        Long[] catelogPath = null;
        AttrRespVo attrRespVo = new AttrRespVo();
        AttrEntity attrEntity = this.getById(attrId);
        BeanUtils.copyWithoutNull(attrRespVo,attrEntity,null);

        // ??????????????? ??????????????????????????????????????????
        if (AttrEnum.ATTR_TYPE_BASE.getCode() == attrEntity.getAttrType()) {
            // 1.??????????????????
            AttrAttrgroupRelationEntity relationEntity = relationDao.selectOne(new LambdaQueryWrapper<AttrAttrgroupRelationEntity>()
                    .eq(AttrAttrgroupRelationEntity::getAttrId, attrRespVo.getAttrId()));
            if (null != relationEntity && StringUtils.isNotEmpty(relationEntity.getAttrGroupId())) {
                attrGroupId = relationEntity.getAttrGroupId();
                attrGroupName = attrGroupDao.selectById(relationEntity.getAttrGroupId()).getAttrGroupName();
            }
        }
        // 2.??????????????????
        if (null != attrEntity.getCatelogId()) {
            CategoryEntity categoryEntity = categoryService.getById(attrEntity.getCatelogId());
            List<String> pathIdList = Splitter.on("#").omitEmptyStrings().splitToList(categoryEntity.getPath());
            catelogPath = (Long[]) ConvertUtils.convert(pathIdList, Long[].class);
        }
        //

        attrRespVo.setAttrGroupId(attrGroupId);
        attrRespVo.setGroupName(attrGroupName);
        attrRespVo.setCatelogPath(catelogPath);
        return attrRespVo;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateAttr(AttrVo attr) {
        if (null == attr || null == attr.getAttrType() || null == attr.getValueType()
                || null == attr.getCatelogId() || StringUtils.isEmpty(attr.getIcon())
                || null == attr.getShowDesc() || null == attr.getEnable() || null == attr.getSearchType() ) {
            throw new BizException("??????????????????????????????????????????????????????");
        }
        AttrEntity dbAttrEntity = this.getById(attr.getAttrId());
        if (null == dbAttrEntity) {
            throw new BizException("????????????????????????");
        }
        BeanUtils.copyWithoutNull(dbAttrEntity,attr,new String[]{"attrId"});
        BeanUtils.updateAuditFields(dbAttrEntity,false,"system");

        this.updateById(dbAttrEntity);
        // ??????????????????????????????????????? ??????-???????????????????????????
        if (null != attr.getAttrGroupId()) {
            AttrAttrgroupRelationEntity dbRelationEntity = relationDao.selectOne(new LambdaQueryWrapper<AttrAttrgroupRelationEntity>().eq(AttrAttrgroupRelationEntity::getAttrId, attr.getAttrId()));

            if (null == dbRelationEntity ) {
                AttrAttrgroupRelationEntity relationEntity = new AttrAttrgroupRelationEntity();
                relationEntity.setAttrId(attr.getAttrId());
                relationEntity.setAttrGroupId(attr.getAttrGroupId());
                relationEntity.setAttrSort(0);
                BeanUtils.updateAuditFields(relationEntity,true,"system");
                relationDao.insert(relationEntity);
            } else {
                // ????????????????????????????????????????????????
                if (attr.getAttrGroupId().equals(dbRelationEntity.getAttrGroupId())) {
                    return;
                }
                dbRelationEntity.setAttrGroupId(attr.getAttrGroupId());
                BeanUtils.updateAuditFields(dbRelationEntity,false,"system");
                relationDao.update(dbRelationEntity , new LambdaUpdateWrapper<AttrAttrgroupRelationEntity>().eq(AttrAttrgroupRelationEntity::getAttrId, dbRelationEntity.getAttrId()));

            }

        }
    }

    @Override
    public List<AttrEntity> getRelationAttr(Long attrgroupId) {
        List<Long> relationAttrList = new ArrayList<>();
        List<AttrEntity> relationAttrEntities = new ArrayList<>();

        List<AttrAttrgroupRelationEntity> relationEntities = relationDao.selectList(new LambdaQueryWrapper<AttrAttrgroupRelationEntity>()
                .eq(AttrAttrgroupRelationEntity::getAttrGroupId, attrgroupId));
        for (AttrAttrgroupRelationEntity relationEntity : relationEntities) {
            relationAttrList.add(relationEntity.getAttrId());
        }
        if (CollectionUtil.isNotEmpty(relationAttrList)) {
            relationAttrEntities = (List<AttrEntity>) this.listByIds(relationAttrList);
        }
        return relationAttrEntities;
    }

    @Override
    public PageUtils getNoRelationAttr(Long attrgroupId, Map<String, Object> params) {
        if (null == attrgroupId) {
            throw new BizException("??????????????????id???????????????");
        }
        // 1.?????????????????????????????????????????????????????????
        AttrGroupEntity attrGroupEntity = attrGroupDao.selectById(attrgroupId);
        Long catelogId = attrGroupEntity.getCatelogId();
        // 2.????????????????????????????????????????????????????????? = ??????????????????????????? - ?????????????????????????????????????????????????????????
        // 2.1 ???????????????????????????????????????
        List<AttrGroupEntity> attrGroupEntities = attrGroupDao.selectList(
                new LambdaQueryWrapper<AttrGroupEntity>().eq(AttrGroupEntity::getCatelogId, catelogId));
        List<Long> attrGroupList = attrGroupEntities.stream().map(item ->
                item.getAttrGroupId()
        ).collect(Collectors.toList());
        // 2.2 ????????????????????????????????????
        List<AttrAttrgroupRelationEntity> relationEntities = relationDao.selectList(
                new LambdaQueryWrapper<AttrAttrgroupRelationEntity>().in(AttrAttrgroupRelationEntity::getAttrGroupId, attrGroupList));
        List<Long> attrRelationList = relationEntities.stream().map(item -> item.getAttrId()).collect(Collectors.toList());
        // 2.3 ???????????????????????????????????????????????????
        LambdaQueryWrapper<AttrEntity> queryWrapper = new LambdaQueryWrapper<AttrEntity>().eq(AttrEntity::getCatelogId, catelogId)
                .eq(AttrEntity::getAttrType, AttrEnum.ATTR_TYPE_BASE.getCode());
        if (CollectionUtil.isNotEmpty(attrRelationList)) {
            queryWrapper.notIn(AttrEntity::getAttrId, attrRelationList);
        }
        // ????????????
        String key = (String) params.get("key");
        if (StringUtils.isNotEmpty(key)) {
            queryWrapper.and((wrapper) -> {
                wrapper.eq(AttrEntity::getAttrId, key).or().like(AttrEntity::getAttrName, key);
            });
        }
        IPage<AttrEntity> page = this.page(new Query<AttrEntity>().getPage(params), queryWrapper);

        return new PageUtils(page);
    }

    @Override
    public Map<Long, String> getAttrNameById(List<Long> attrId) {
        if (null == attrId || attrId.size() == 0) {
            throw new BizException("??????????????????????????????????????????");
        }
        List<AttrEntity> attrEntities = this.baseMapper.selectList(new LambdaQueryWrapper<AttrEntity>()
                .in(AttrEntity::getAttrId, attrId));
        Map<Long, String> attrIdAndNameMap = new HashMap<>();
        for (AttrEntity attrEntity : attrEntities) {
            attrIdAndNameMap.put(attrEntity.getAttrId(), attrEntity.getAttrName());
        }
        return attrIdAndNameMap;
    }

    @Override
    public List<Long> selectSearchAttrIds(List<Long> attrIds) {
        return baseMapper.selectSearchAttrIds(attrIds);
    }

}