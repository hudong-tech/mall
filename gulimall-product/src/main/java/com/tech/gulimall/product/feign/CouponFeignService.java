package com.tech.gulimall.product.feign;

import com.tech.gulimall.common.to.SkuReductionTo;
import com.tech.gulimall.common.to.SpuBoundTo;
import com.tech.gulimall.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient("mall-coupon")
public interface CouponFeignService {

    /**
     * 保存spu积分信息
     * @param spuBoundTo
     * @return
     */
    @PostMapping("/coupon/spubounds/save")
    R save(@RequestBody SpuBoundTo spuBoundTo);

    /**
     *  保存sku满减信息
     */
    @PostMapping("/coupon/skufullreduction/saveReduction")
    R saveSkuReductionTo(@RequestBody SkuReductionTo skuReductionTo);
    }
