package com.tech.gulimall.product.controller;

import com.tech.gulimall.common.utils.R;
import com.tech.gulimall.product.entity.po.CategoryEntity;
import com.tech.gulimall.product.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;



/**
 * 商品三级分类
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:50
 */
@RestController
@RequestMapping("product/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 查出所有分类及子分类，以树形列表组装起来
     * 递归算法
     */
    @RequestMapping("/list/tree/recursion")
    public R listByRecursion(){
        List<CategoryEntity> entities = categoryService.queryListTreeByRecursion();
        return R.ok().put("data", entities);
    }

    /**
     * 查出所有分类及子分类，以树形列表组装起来
     * for算法  -> 推荐
     */
    @RequestMapping("/list/tree/for")
    public R listByFor(){
        List<CategoryEntity> entities = categoryService.queryListTreeByFor();
        return R.ok().put("data", entities);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{catId}")
    public R info(@PathVariable("catId") Long catId){
		CategoryEntity category = categoryService.getById(catId);
        return R.ok().put("data", category);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    // @RequiresPermissions("product:category:save")
    public R save(@RequestBody CategoryEntity category){
        categoryService.saveCategory(category);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional(rollbackFor=Exception.class)
    // @RequiresPermissions("product:category:update")
    public R update(@RequestBody CategoryEntity category){
		categoryService.updateCascade(category);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    // @RequiresPermissions("product:category:delete")
    public R delete(@RequestBody Long[] catIds){
        String result = categoryService.deleteBatch(Arrays.asList(catIds));
        return R.ok().put("result", result);
    }

    @RequestMapping("/saveAllPath")
    public R saveAllPath () {
        categoryService.saveAllPath();
        return R.ok();
    }
}
