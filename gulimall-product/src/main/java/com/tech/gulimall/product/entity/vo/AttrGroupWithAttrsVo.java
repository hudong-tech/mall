package com.tech.gulimall.product.entity.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.tech.gulimall.product.entity.po.AttrEntity;
import lombok.Data;

import java.util.List;

/**
 * @className: AttrGroupWithAttrsVo
 * @description: 属性分组及其下的所有属性信息
 * @author: phil
 * @date: 2021/11/22
 **/
@Data
public class AttrGroupWithAttrsVo{

    /**
     * 分组id
     */
    @TableId
    private Long attrGroupId;
    /**
     * 组名
     */
    private String attrGroupName;
    /**
     * 排序
     */
    private Integer sort;
    /**
     * 描述
     */
    private String descript;
    /**
     * 组图标
     */
    private String icon;
    /**
     * 所属分类id
     */
    private Long catelogId;

    /**
     * 三级分类路径
     */
    @TableField(exist = false)
    private Long[] catelogPath;

    /**
     * 分组下的所有属性
     */
    private List<AttrEntity> attrs;
}
