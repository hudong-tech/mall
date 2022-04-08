package com.tech.gulimall.product.entity.po;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tech.gulimall.common.entity.CommonObject;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * spu信息
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
@Data
@TableName("pms_spu_info")
public class SpuInfoEntity  extends CommonObject implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 商品id
	 */
	@TableId
	private Long id;
	/**
	 * 商品名称
	 */
	@NotBlank(message = "商品名称不能为空")
	private String spuName;
	/**
	 * 商品描述
	 */
	private String spuDescription;
	/**
	 * 所属分类id
	 */
	@NotBlank(message = "所属分类不能为空")
	private Long catalogId;
	/**
	 * 品牌id
	 */
	@NotBlank(message = "所属品牌不能为空")
	private Long brandId;
	/**
	 * 重量
	 */
	@NotNull(message = "重量不能为空")
	private BigDecimal weight;
	/**
	 * 上架状态[0 - 下架，1 - 上架]
	 */
	private Integer publishStatus;

}
