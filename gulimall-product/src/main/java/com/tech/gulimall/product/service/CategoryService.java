package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.CategoryEntity;

import java.util.List;
import java.util.Map;

/**
 * 商品三级分类
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:50
 */
public interface CategoryService extends IService<CategoryEntity> {

    PageUtils queryPage(Map<String, Object> params);
    /**
     * @Description:  使用递归查出所有分类及子分类，以树形列表组装起来
     * @Param: []
     * @return: java.util.List<com.tech.gulimall.product.entity.CategoryEntity>
     * @Author: phil
     * @Date: 2021/10/14 22:38
     */
    List<CategoryEntity> queryListTreeByRecursion();

    /**
    * @Description:  使用for循环查出所有分类及子分类，以树形列表组装起来
    * @Param: []
    * @return: java.util.List<com.tech.gulimall.product.entity.CategoryEntity>
    * @Author: phil
    * @Date: 2021/10/18 21:00
    */
    List<CategoryEntity> queryListTreeByFor();

    /**
    * @Description: 菜单逻辑批量删除
    * @Param: [ids]
    * @return: java.lang.String
    * @Author: phil
    * @Date: 2021/10/18 22:46
    */
    String deleteBatch(List<Long> ids);

    /***
    * @Description: 根据catelogId查询分类的完整路径
    * @Param: [catelogId]
    * @return: java.lang.Long[]
    * @Author: phil
    * @Date: 2021/11/6 13:35
    */
    Long[] findCateLogPath(Long catelogId);

    /**
    * @Description: 保存分类数据的全路径
    * @Param: []
    * @return: void
    * @Author: phil
    * @Date: 2021/11/6 20:51
    */
    void saveAllPath();
}

