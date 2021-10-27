package com.tech.gulimall.thirdparty.controller;

import com.tech.gulimall.common.utils.R;
import com.tech.gulimall.thirdparty.service.OssService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
* @Description: 对象存储oss Controller
* @Author: phil
* @Date: 2021/10/27 1:41
*/
@RestController
@RequestMapping("/oss")
public class OssController {

    @Autowired
    private OssService ossService;

    @RequestMapping("/policy")
    public R policy(){
        Map<String, String> policy = ossService.policy();
        return R.ok().put("data",policy);
    }
}
