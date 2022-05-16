package com.tech.gulimall.search.controller;

import com.tech.gulimall.search.service.ProductSaveService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
*  
*
* @author phil 
* @email hudong.tech@gmail.com 
* @date 2022-04-17 22:52:51
**/
@RestController
@Slf4j
@RequestMapping("/search/save")
public class ElasticSaveController {

    @Autowired
    private ProductSaveService productSaveService;
}
