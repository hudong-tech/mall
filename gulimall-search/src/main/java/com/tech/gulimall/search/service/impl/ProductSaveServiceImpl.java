package com.tech.gulimall.search.service.impl;

import com.tech.gulimall.common.to.SkuEsModel;
import com.tech.gulimall.search.service.ProductSaveService;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
*  商品上架实现类
*
* @author phil 
* @email hudong.tech@gmail.com 
* @date 2022-04-17 22:55:49
**/
@Service("ProductSaveService")
@Slf4j
public class ProductSaveServiceImpl implements ProductSaveService {

    @Autowired
    private RestHighLevelClient restHighLevelClient;

    @Override
    public boolean saveProductAsIndices(List<SkuEsModel> skuEsModels) {

        return false;
    }
}
