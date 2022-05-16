package com.tech.gulimall.search.service.impl;

import com.alibaba.fastjson.JSON;
import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.to.SkuEsModel;
import com.tech.gulimall.search.config.MallElasticSearchConfig;
import com.tech.gulimall.search.constant.EsConstant;
import com.tech.gulimall.search.service.ProductSaveService;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.xcontent.XContentType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

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
        BulkResponse bulkResponse = null;
        // 保存到es
        // 1. 在es中建立索引。product。 建立好映射关系
        // 索引文件 gulimall-search/src/main/resources/static/skuEsModel.json

        // 2.给es中保存这些数据
        BulkRequest bulkRequest = new BulkRequest();
        for (SkuEsModel skuEsModel : skuEsModels) {
            IndexRequest indexRequest = new IndexRequest(EsConstant.PRODUCT_INDEX);
            indexRequest.id(skuEsModel.getSkuId().toString());
            String skuEsModelStr = JSON.toJSONString(skuEsModel);
            indexRequest.source(skuEsModelStr, XContentType.JSON);
            bulkRequest.add(indexRequest);
        }

        try {
            bulkResponse = restHighLevelClient.bulk(bulkRequest, MallElasticSearchConfig.COMMON_OPTIONS);
        } catch (Exception e) {
            log.error("商品上架异常!", e.getLocalizedMessage());
            throw new BizException("商品上架异常！");
        }

        boolean hasFailures = bulkResponse.hasFailures();
        // 批量上架错误
        if (hasFailures) {
            List<String> failIds = Arrays.asList(bulkResponse.getItems()).stream()
                    .map(item -> item.getId()).collect(Collectors.toList());

            log.info("商品上架成功，未能成功上架的商品id为：{}", failIds);
        }
        return !hasFailures;
    }
}
