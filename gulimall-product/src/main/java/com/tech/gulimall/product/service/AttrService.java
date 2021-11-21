package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.po.AttrEntity;
import com.tech.gulimall.product.entity.vo.AttrRespVo;
import com.tech.gulimall.product.entity.vo.AttrVo;

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
    * @Param: [params, catelogId]
    * @return: com.tech.gulimall.common.utils.PageUtils
    * @Author: phil
    * @Date: 2021/11/10 3:01
    */
    PageUtils baseAttrList(Map<String, Object> params, Long catelogId);

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
}

