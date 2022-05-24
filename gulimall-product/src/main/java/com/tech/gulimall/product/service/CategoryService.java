package com.tech.gulimall.product.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.product.entity.po.CategoryEntity;
import com.tech.gulimall.product.entity.vo.Catalog2Vo;
import org.springframework.lang.Nullable;

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

    /**
    * @Description: 级联更新关联表，如品牌-三级分类表
    * @Param: [category]
    * @return: void
    * @Author: phil
    * @Date: 2021/11/8 18:15
    */
    void updateCascade(CategoryEntity category);

    /***
    * @Description: 获取分类id和分类路径名称map
    * @Param: []
    * @return: Map<id, pathName>
    * @Author: phil
    * @Date: 2021/11/17 17:41
    */
    Map<Long, String> getIdPathNameRelation();

    /***
    * @Description: 根据分类id获取分类路径名称map 不传catId查询所有数据
    * @Param: [catId]
    * @return: Map<id, pathName>
    * @Author: phil
    * @Date: 2021/11/17 17:24
    */
    Map<Long, String> getIdPathNameRelation(@Nullable Long catId);

    /**
    * @Description: 保存
    * @Param: [category]
    * @return: void
    * @Author: phil
    * @Date: 2022/4/3 6:59
    */
    void saveCategory(CategoryEntity category);

    /**
    * @description: 获取一级分类
    * @param: []
    * @return: java.util.List<com.tech.gulimall.product.entity.po.CategoryEntity>
    * @author: phil
    * @date: 2022/5/17 2:33
    */
    List<CategoryEntity> getLevel1Category();

    /**
    * @description: 使用spring cache查询二级三级分类数据
    * @param: []
    * @return: java.util.Map<java.lang.String,java.util.List<com.tech.gulimall.product.entity.vo.Catalog2Vo>>
    * @author: phil
    * @date: 2022/5/17 16:34
    */
    Map<String, List<Catalog2Vo>> getCatalogJsonDBWithSpringCache();

    /***
    * @description:  使用redis分布锁查询二级三级分类数据
    * @param: []
    * @return: java.util.Map<java.lang.String,java.util.List<com.tech.gulimall.product.entity.vo.Catalog2Vo>>
    * @author: phil
    * @date: 2022/5/24 20:12
    */
    Map<String, List<Catalog2Vo>> getCatalogJsonDbWithRedisLock();
}

