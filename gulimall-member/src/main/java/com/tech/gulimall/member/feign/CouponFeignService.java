package com.tech.gulimall.member.feign;

import com.tech.gulimall.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * 声明式的远程调用
 */
@FeignClient("mall-coupon")
public interface CouponFeignService {

    @PostMapping("/coupon/coupon/member/list")
    public R memberCoupons();
}
