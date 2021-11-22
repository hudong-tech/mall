package com.tech.gulimall.product.controller;

import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.R;
import com.tech.gulimall.product.entity.po.AttrEntity;
import com.tech.gulimall.product.entity.po.AttrGroupEntity;
import com.tech.gulimall.product.entity.vo.AttrGroupRelationVo;
import com.tech.gulimall.product.service.AttrAttrgroupRelationService;
import com.tech.gulimall.product.service.AttrGroupService;
import com.tech.gulimall.product.service.AttrService;
import com.tech.gulimall.product.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;




/**
 * 属性分组
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-11 03:35:49
 */
@RestController
@RequestMapping("product/attrgroup")
public class AttrGroupController {
    @Autowired
    private AttrGroupService attrGroupService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private AttrService attrService;

    @Autowired
    private AttrAttrgroupRelationService relationService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    // @RequiresPermissions("product:attrgroup:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = attrGroupService.queryPage(params);

        return R.ok().put("page", page);
    }

    @RequestMapping("/list/{catelogId}")
    public R list(@RequestParam Map<String, Object> params,
                  @PathVariable(value = "catelogId") Long catelogId){
        PageUtils page = attrGroupService.queryPage(params, catelogId);
        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{attrGroupId}")
    // @RequiresPermissions("product:attrgroup:info")
    public R info(@PathVariable("attrGroupId") Long attrGroupId){
		AttrGroupEntity attrGroup = attrGroupService.getById(attrGroupId);
        Long[] paths = categoryService.findCateLogPath(attrGroup.getCatelogId());
        attrGroup.setCatelogPath(paths);
        return R.ok().put("attrGroup", attrGroup);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    // @RequiresPermissions("product:attrgroup:save")
    public R save(@RequestBody AttrGroupEntity attrGroup){
        BeanUtils.updateAuditFields(attrGroup,true);

		attrGroupService.save(attrGroup);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    // @RequiresPermissions("product:attrgroup:update")
    public R update(@RequestBody AttrGroupEntity attrGroup){
        BeanUtils.updateAuditFields(attrGroup,false);
		attrGroupService.updateById(attrGroup);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    // @RequiresPermissions("product:attrgroup:delete")
    public R delete(@RequestBody Long[] attrGroupIds){
		attrGroupService.removeByIds(Arrays.asList(attrGroupIds));

        return R.ok();
    }

    /**
     * 获取属性分组关联的所有属性
     * /product/attrgroup/{attrgroupId}/attr/relation
     */
    @GetMapping("/{attrgroupId}/attr/relation")
    public R attrRelation(@PathVariable("attrgroupId") Long attrgroupId){
        List<AttrEntity> attrEntities = attrService.getRelationAttr(attrgroupId);
        return R.ok().put("data", attrEntities);
    }

    /**
     * 获取属性分组没有关联的其他属性
     * /product/attrgroup/{attrgroupId}/noattr/relation
     */

    @GetMapping("{attrgroupId}/noattr/relation")
    public R attrNoRelation(@PathVariable("attrgroupId") Long attrgroupId,
                            @RequestParam Map<String, Object> params) {
        PageUtils page = attrService.getNoRelationAttr(attrgroupId, params);
        return R.ok().put("page", page);
    }

    /**
     * 删除属性与分组的关联关系
     * /product/attrgroup/attr/relation/delete
     * @return
     */
    @PostMapping("/attr/relation/delete")
    public R removeRelation(@RequestBody AttrGroupRelationVo[] vos){
        relationService.removeRelation(vos);
        return R.ok();
    }


}
