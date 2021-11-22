package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.po.AttrGroupEntity;
import com.tech.gulimall.product.entity.vo.AttrGroupWithAttrsVo;

import java.util.List;
import java.util.Map;

/**
 * 属性分组
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
public interface AttrGroupService extends IService<AttrGroupEntity> {

    PageUtils queryPage(Map<String, Object> params);

    PageUtils queryPage(Map<String, Object> params, Long catelogId);

    /** 
    * @Description: 获取分类下所有分组&关联属性
    * @Param: [catelogId] 
    * @return: List<AttrGroupWithAttrsVo>
    * @Author: phil
    * @Date: 2021/11/22 17:19
    */
    List<AttrGroupWithAttrsVo> getAttrGroupWithAttrsByCateLogId(Long catelogId);
}

