package com.tech.gulimall.product.entity.po;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.tech.gulimall.common.entity.CommonObject;
import lombok.Data;

import java.io.Serializable;
import java.util.List;

/**
 * 商品三级分类
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:50
 */
@Data
@TableName("pms_category")
public class CategoryEntity extends CommonObject implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 分类id
	 */
	@TableId
	private Long catId;
	/**
	 * 分类名称
	 */
	private String name;
	/**
	 * 父分类id
	 */
	private Long parentCid;
	/**
	 * 层级
	 */
	private Integer catLevel;
	/**
	 * 是否显示[0-不显示，1显示]
	 */
	// @TableLogic 逻辑删除注解
	@TableLogic(value = "1", delval = "0")
	private Integer showStatus;
	/**
	 * 排序
	 */
	private Integer sort;
	/**
	 * 图标地址
	 */
	private String icon;
	/**
	 * 计量单位
	 */
	private String productUnit;
	/**
	 * 商品数量
	 */
	private Integer productCount;

	/**
	 * 路径
	 */
	private String path;

	/**
	 * 所有子节点，@TableField(exist = false) 表示在数据库表里不存在
	 */
	@TableField(exist = false)
	@JsonInclude(JsonInclude.Include.NON_EMPTY)
	private List<CategoryEntity> children;
}
