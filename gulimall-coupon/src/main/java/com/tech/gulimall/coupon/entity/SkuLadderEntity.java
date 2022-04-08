package com.tech.gulimall.coupon.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tech.gulimall.common.entity.CommonObject;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * 商品阶梯价格
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-12 20:49:42
 */
@Data
@TableName("sms_sku_ladder")
public class SkuLadderEntity extends CommonObject implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Long id;
	/**
	 * spu_id
	 */
	@NotNull(message = "skuId不能为空！")
	private Long skuId;
	/**
	 * 满几件
	 */
	private Integer fullCount;
	/**
	 * 打几折
	 */
	private BigDecimal discount;
	/**
	 * 折后价
	 */
	private BigDecimal price;
	/**
	 * 是否叠加其他优惠[0-不可叠加，1-可叠加]
	 */
	private Integer addOther;

}
