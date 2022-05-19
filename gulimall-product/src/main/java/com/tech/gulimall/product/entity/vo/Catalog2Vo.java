package com.tech.gulimall.product.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 二级分类vo
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2022-05-17 16:19:43
 **/
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Catalog2Vo {
    /**
     * 父级-一级分类id
     */
    private String catalog1Id;

    /**
     * 二级分类id
     */
    private String id;

    /**
     * 二级分类名称
     */
    private String name;

    /**
     * 当前分类的所有子（三级）分类
     */
    private List<Catalog3List> catalog3List;


    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class Catalog3List{
        /**
         * 父级-二级分类id
         */
        private String catalog2Id;

        /**
         * 三级分类id
         */
        private String id;

        /**
         * 三级分类名称
         */
        private String name;
    }
}
