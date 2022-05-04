package com.tech.gulimall.search.controller;

import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.exception.enums.BizCodeEnum;
import com.tech.gulimall.common.to.SkuEsModel;
import com.tech.gulimall.common.utils.R;
import com.tech.gulimall.search.service.ProductSaveService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
*  
*
* @author phil 
* @email hudong.tech@gmail.com 
* @date 2022-04-17 22:52:51
**/
@RestController
@Slf4j
public class ElasticSaveController {

    @Autowired
    private ProductSaveService productSaveService;


    @PostMapping("/product")
    public R saveProductAsIndices(@RequestBody List<SkuEsModel> skuEsModels){
        boolean status = false;
        try {
            status = productSaveService.saveProductAsIndices(skuEsModels);
        } catch (BizException e) {
            log.error("远程保存检索失败！");
        }
        return status ? R.ok() : R.error(BizCodeEnum.PRODUCT_UP_EXCEPTION.getCode(), BizCodeEnum.PRODUCT_UP_EXCEPTION.getMsg());
    }
}
