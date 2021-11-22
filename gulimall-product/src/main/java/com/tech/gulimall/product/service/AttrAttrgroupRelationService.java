package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.po.AttrAttrgroupRelationEntity;
import com.tech.gulimall.product.entity.vo.AttrGroupRelationVo;

import java.util.List;
import java.util.Map;

/**
 * 属性&属性分组关联
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
public interface AttrAttrgroupRelationService extends IService<AttrAttrgroupRelationEntity> {

    PageUtils queryPage(Map<String, Object> params);


    /***
     * @Description: 删除属性与分组的关联关系
     * @Param: [vos]
     * @return: void
     * @Author: phil
     * @Date: 2021/11/22 0:10
     */
    void removeRelation(AttrGroupRelationVo[] vos);

    /***
    * @Description: 批量保存 属性分组-属性 的关联关系
    * @Param: [vos]
    * @return: void
    * @Author: phil
    * @Date: 2021/11/22 13:36
    */
    void saveBatch(List<AttrGroupRelationVo> vos);
}

