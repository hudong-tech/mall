package com.tech.gulimall.ware.controller;

import com.tech.gulimall.common.utils.BeanUtils;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.R;
import com.tech.gulimall.ware.entity.WareOrderTaskEntity;
import com.tech.gulimall.ware.service.WareOrderTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;



/**
 * 库存工作单
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-12 21:27:21
 */
@RestController
@RequestMapping("ware/wareordertask")
public class WareOrderTaskController {
    @Autowired
    private WareOrderTaskService wareOrderTaskService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    // @RequiresPermissions("ware:wareordertask:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = wareOrderTaskService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    // @RequiresPermissions("ware:wareordertask:info")
    public R info(@PathVariable("id") Long id){
		WareOrderTaskEntity wareOrderTask = wareOrderTaskService.getById(id);

        return R.ok().put("wareOrderTask", wareOrderTask);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    // @RequiresPermissions("ware:wareordertask:save")
    public R save(@RequestBody WareOrderTaskEntity wareOrderTask){
        BeanUtils.updateAuditFields(wareOrderTask,true);
        wareOrderTaskService.save(wareOrderTask);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    // @RequiresPermissions("ware:wareordertask:update")
    public R update(@RequestBody WareOrderTaskEntity wareOrderTask){
        BeanUtils.updateAuditFields(wareOrderTask,false);
		wareOrderTaskService.updateById(wareOrderTask);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    // @RequiresPermissions("ware:wareordertask:delete")
    public R delete(@RequestBody Long[] ids){
		wareOrderTaskService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
