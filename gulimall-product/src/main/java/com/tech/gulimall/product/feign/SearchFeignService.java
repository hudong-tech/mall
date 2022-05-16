package com.tech.gulimall.product.feign;

import com.tech.gulimall.common.to.SkuEsModel;
import com.tech.gulimall.common.utils.R;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@FeignClient("mall-search")
public interface SearchFeignService {

    @PostMapping("/search/save/product")
    R saveProductAsIndices(@RequestBody List<SkuEsModel> skuEsModels);
}
