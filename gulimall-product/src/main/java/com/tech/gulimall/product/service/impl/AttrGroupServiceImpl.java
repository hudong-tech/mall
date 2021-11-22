package com.tech.gulimall.product.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.product.dao.AttrGroupDao;
import com.tech.gulimall.product.entity.po.AttrEntity;
import com.tech.gulimall.product.entity.po.AttrGroupEntity;
import com.tech.gulimall.product.entity.vo.AttrGroupWithAttrsVo;
import com.tech.gulimall.product.service.AttrGroupService;
import com.tech.gulimall.product.service.AttrService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service("attrGroupService")
public class AttrGroupServiceImpl extends ServiceImpl<AttrGroupDao, AttrGroupEntity> implements AttrGroupService {

    private static final Long ZERO = 0L;

    @Autowired
    private AttrService attrService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<AttrGroupEntity> page = this.page(
                new Query<AttrGroupEntity>().getPage(params),
                new QueryWrapper<AttrGroupEntity>()
        );

        return new PageUtils(page);
    }

    @Override
    public PageUtils queryPage(Map<String, Object> params, Long catelogId) {
        String key = (String) params.get("key");
        // select * from AttrGroup where attr_group_id='key' or attr_group_name like 'key'
        LambdaQueryWrapper<AttrGroupEntity> queryWrapper = new LambdaQueryWrapper<>();
        if (!StringUtils.isEmpty(key)) {
            queryWrapper.eq(AttrGroupEntity::getAttrGroupId, key)
                    .or().like(AttrGroupEntity::getAttrGroupName, key);
        }
        if (! ZERO.equals(catelogId)) {
            queryWrapper.eq(AttrGroupEntity::getCatelogId, catelogId);
        }
        IPage<AttrGroupEntity> page = this.page(new Query<AttrGroupEntity>().getPage(params), queryWrapper);
        return new PageUtils(page);
    }

    @Override
    public List<AttrGroupWithAttrsVo> getAttrGroupWithAttrsByCateLogId(Long catelogId) {

        if (null == catelogId) {
            throw new BizException("三级分类id为空，无法进行下一步操作！");
        }
        // 1. 查询所有分组信息
        List<AttrGroupEntity> attrGroupEntities = this.list(new LambdaQueryWrapper<AttrGroupEntity>().eq(AttrGroupEntity::getCatelogId, catelogId));
        List<AttrGroupWithAttrsVo> attrGroupWithAttrsVos = attrGroupEntities.stream().map(item -> {
            AttrGroupWithAttrsVo attrGroupWithAttrsVo = new AttrGroupWithAttrsVo();
            BeanUtils.copyWithoutNull(attrGroupWithAttrsVo, item, null);
            if (null == item.getAttrGroupId()) {
                throw new BizException("查询出属性分组的脏数据！属性分组id为空！");
            }
            List<AttrEntity> attrs = attrService.getRelationAttr(item.getAttrGroupId());
            attrGroupWithAttrsVo.setAttrs(attrs);
            return attrGroupWithAttrsVo;
        }).collect(Collectors.toList());
        // 2. 查询所有属性
        return attrGroupWithAttrsVos;
    }
}