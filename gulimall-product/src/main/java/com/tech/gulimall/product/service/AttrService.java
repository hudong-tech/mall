package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.po.AttrEntity;
import com.tech.gulimall.product.entity.vo.AttrRespVo;
import com.tech.gulimall.product.entity.vo.AttrVo;

import java.util.List;
import java.util.Map;

/**
 * 商品属性
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
public interface AttrService extends IService<AttrEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /***
    * @Description: 保存属性
    * @Param: [attr]
    * @return: void
    * @Author: phil
    * @Date: 2021/11/10 2:15
    */
    void saveAttr(AttrVo attr);

    /**
    * @Description:  分页查询分类规格参数
    * @Param: [params, catelogId, type]
    * @return: com.tech.gulimall.common.utils.PageUtils
    * @Author: phil
    * @Date: 2021/11/10 3:01
    */
    PageUtils baseAttrList(Map<String, Object> params, Long catelogId, String type);

    /**
     * 查询商品属性信息
     * @param attrId
     * @return
     */
    AttrRespVo getAttrInfo(Long attrId);

    /**
     * 修改
     * @param attr
     */
    void updateAttr(AttrVo attr);

    /**
    * @Description: 获取属性分组id关联的所有基本属性
    * @Param: [attrgroupId]
    * @return: java.util.List<com.tech.gulimall.product.entity.po.AttrEntity>
    * @Author: phil
    * @Date: 2021/11/21 23:48
    */
    List<AttrEntity> getRelationAttr(Long attrgroupId);

    /**
    * @Description: 获取属性分组没有关联的其他属性
    * @Param: [attrgroupId, params]
    * @return: com.tech.gulimall.common.utils.PageUtils
    * @Author: phil
    * @Date: 2021/11/22 12:23
    */
    PageUtils getNoRelationAttr(Long attrgroupId, Map<String, Object> params);

    /**
    * @description: 根据属性id查询属性名
    * @param: [attrId]
    * @return: java.util.Map<java.lang.Long,java.lang.String>
    * @author: phil
    * @date: 2022/4/7 1:53
    */
    Map<Long, String> getAttrNameById(List<Long> attrId);

    /*** 
    * @description: 过滤出可被检索的属性id集合
    * @param: [attrIds] 
    * @return: java.util.List<java.lang.Long> 
    * @author: phil 
    * @date: 2022/4/30 22:16
    */
    List<Long> selectSearchAttrIds(List<Long> attrIds);
}

