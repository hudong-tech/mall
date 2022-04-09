package com.tech.gulimall.search;

import com.alibaba.fastjson.JSON;
import com.tech.gulimall.search.config.MallElasticSearchConfig;
import lombok.Data;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.xcontent.XContentType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.IOException;

// springboot 默认测试，指定使用spring跑单元测试
@RunWith(SpringRunner.class)
@SpringBootTest
public class GulimallSearchApplicationTests {

    @Autowired
    private RestHighLevelClient client;

    /**
     * 测试存储es数据
     * 更新也可以
     */
    @Test
    public void indexData() throws IOException {
        IndexRequest indexRequest = new IndexRequest("users");
        indexRequest.id("1");

        //不常用
//        indexRequest.source("userName","zhangsan","age",18,"gender","男");


        User user = new User();
        user.setUserName("zhangsan");
        user.setAge(20);
        user.setGender("男");

        // 常用方法
        String jsonStr = JSON.toJSONString(user);
        // XContentType.JSON 内容类型(json) 一定要传
        indexRequest.source(jsonStr, XContentType.JSON);

        // 同步执行操作
        IndexResponse index = client.index(indexRequest, MallElasticSearchConfig.COMMON_OPTIONS);

        //提取有用的响应数据
        System.out.println(index);
    }

    @Data
    class User {
        private String userName;
        private String gender;
        private Integer age;
    }

    @Test
    public void getClient() {
        System.out.println(client);
    }

}
