package com.tech.gulimall.product.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tech.gulimall.common.entity.CommonObject;
import lombok.Data;

import java.io.Serializable;

/**
 * spu图片
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
@Data
@TableName("pms_spu_images")
public class SpuImagesEntity  extends CommonObject implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Long id;
	/**
	 * spu_id
	 */
	private Long spuId;
	/**
	 * 图片名
	 */
	private String imgName;
	/**
	 * 图片地址
	 */
	private String imgUrl;
	/**
	 * 顺序
	 */
	private Integer imgSort;
	/**
	 * 是否默认图
	 */
	private Integer defaultImg;

}
