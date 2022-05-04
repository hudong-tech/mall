package com.tech.gulimall.search.service;

import com.tech.gulimall.common.to.SkuEsModel;

import java.util.List;

/**
*  商品上架 接口
*
* @author phil 
* @email hudong.tech@gmail.com 
* @date 2022-04-17 22:55:26
**/
public interface ProductSaveService {
    
    /** 
    * @description: 上架商品到es中，用于检索
    * @param: [skuEsModels] 
    * @return: boolean 
    * @author: phil 
    * @date: 2022/4/17 22:59
    */
    boolean saveProductAsIndices(List<SkuEsModel> skuEsModels);
}
