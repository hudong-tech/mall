package com.tech.gulimall.product.entity.vo;

import lombok.Data;

/**
 * @className: AttrGroupRelationVo
 * @description: 属性和属性分组的关联关系  [{"attrId":1,"attrGroupId":2}]
 * @author: niaonao
 * @date: 2021/11/22
 **/
@Data
public class AttrGroupRelationVo {

    /**
     * 属性id
     */
    private Long attrId;

    /**
     * 属性分组id
     */
    private Long attrGroupId;

}
