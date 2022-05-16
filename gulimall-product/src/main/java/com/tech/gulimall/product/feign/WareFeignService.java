package com.tech.gulimall.product.feign;

import com.tech.gulimall.common.to.SkuHasStackVo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@FeignClient("mall-ware")
public interface WareFeignService {

    @RequestMapping("/ware/waresku/getSkuHasStack")
    List<SkuHasStackVo> getSkuHasStack(@RequestParam List<Long> skuIds);
}
