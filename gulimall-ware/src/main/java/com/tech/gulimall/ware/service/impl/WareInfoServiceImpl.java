package com.tech.gulimall.ware.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.common.utils.StringUtils;
import com.tech.gulimall.ware.dao.WareInfoDao;
import com.tech.gulimall.ware.entity.WareInfoEntity;
import com.tech.gulimall.ware.service.WareInfoService;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service("wareInfoService")
public class WareInfoServiceImpl extends ServiceImpl<WareInfoDao, WareInfoEntity> implements WareInfoService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        LambdaQueryWrapper<WareInfoEntity> queryWrapper = new LambdaQueryWrapper<>();

        String key = (String) params.get("key");
        if (StringUtils.isNotEmpty(key)) {
            // 仓库编号、仓库名字、仓库地址、区域编号
            queryWrapper.eq(WareInfoEntity::getId, key).or()
                    .like(WareInfoEntity::getName, key).or()
                    .like(WareInfoEntity::getAddress, key).or()
                    .like(WareInfoEntity::getAreacode, key);
        }
        // 执行
        IPage<WareInfoEntity> page = this.page(
                new Query<WareInfoEntity>().getPage(params),
                queryWrapper
        );

        return new PageUtils(page);
    }

}