package com.tech.gulimall.product.entity.vo;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

/**
 * 录入商品 -- 属性信息
 * Auto-generated: 2021-11-23 17:52:33
 *
 * @author bejson.com (i@bejson.com)
 * @website http://www.bejson.com/java2pojo/
 */
@Data
public class Attr {

    /**
     * 属性id
     */
    @TableId
    private Long attrId;
    /**
     * 属性名称
     */
    private String attrName;
    /**
     * 属性值
     */
    private String attrValue;
}