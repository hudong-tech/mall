package com.tech.gulimall.ware.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.tech.gulimall.common.to.SkuHasStackVo;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.common.utils.Query;
import com.tech.gulimall.common.utils.StringUtils;
import com.tech.gulimall.ware.dao.WareSkuDao;
import com.tech.gulimall.ware.entity.WareSkuEntity;
import com.tech.gulimall.ware.service.WareSkuService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service("wareSkuService")
public class WareSkuServiceImpl extends ServiceImpl<WareSkuDao, WareSkuEntity> implements WareSkuService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        /**
         * skuId: 3
         * wareId: 1
         */
        LambdaQueryWrapper<WareSkuEntity> queryWrapper = new LambdaQueryWrapper<>();

        String wareId = (String) params.get("wareId");
        if (StringUtils.isNotEmpty(wareId)) {
            queryWrapper.eq(WareSkuEntity::getWareId, wareId);
        }

        String skuId = (String) params.get("skuId");
        if (StringUtils.isNotEmpty(skuId)) {
            queryWrapper.eq(WareSkuEntity::getSkuId, skuId);
        }

        IPage<WareSkuEntity> page = this.page(
                new Query<WareSkuEntity>().getPage(params),
                queryWrapper
        );
        return new PageUtils(page);
    }

    @Override
    public List<SkuHasStackVo> getSkuHasStack(List<Long> skuIds) {
        List<SkuHasStackVo> skuHasStackVoList = new ArrayList<>();
        List<Map<String, Object>> stackByIds = baseMapper.getStackByIds(skuIds);

        Map<Long, Integer> skuIdStockMap = new HashMap<>(16);
        for (Map<String, Object> stackId : stackByIds) {
            Long skuId = (Long) stackId.get("sku_id");
            Integer stock = Integer.parseInt(stackId.get("stock").toString());
            skuIdStockMap.put(skuId, stock);
        }

        for (Long skuId : skuIds) {
            SkuHasStackVo skuHasStackVo = new SkuHasStackVo();
            skuHasStackVo.setSkuId(skuId);
            Integer stockCount = skuIdStockMap.get(skuId);
            skuHasStackVo.setHasStack(stockCount == null ? false : stockCount > 0);
            skuHasStackVoList.add(skuHasStackVo);
        }

        return skuHasStackVoList;
    }

}