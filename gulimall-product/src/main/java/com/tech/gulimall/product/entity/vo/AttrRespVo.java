package com.tech.gulimall.product.entity.vo;

import lombok.Data;

/**
* @Description: 属性响应数据
* @Author: phil
* @Date: 2021/11/16 22:15
*/
@Data
public class AttrRespVo extends AttrVo {

    /**
     * 所属分类名字
     */
    private String catelogName;

    /**
     * 所属分组名字
     */
    private String groupName;

    /**
     * 分类路径，以lang[]形式返回
     */
    private Long[] catelogPath;
}
