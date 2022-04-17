package com.tech.gulimall.search;

import com.alibaba.fastjson.JSON;
import com.tech.gulimall.search.config.MallElasticSearchConfig;
import lombok.Data;
import lombok.ToString;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.search.SearchRequest;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.common.xcontent.XContentType;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.Aggregations;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.Terms.Bucket;
import org.elasticsearch.search.aggregations.bucket.terms.TermsAggregationBuilder;
import org.elasticsearch.search.aggregations.metrics.Avg;
import org.elasticsearch.search.aggregations.metrics.AvgAggregationBuilder;
import org.elasticsearch.search.builder.SearchSourceBuilder;
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

    @Test
    public void searchData() throws IOException {
        // 1. 创建检索请求
        SearchRequest searchRequest = new SearchRequest();
        // 指定索引
        searchRequest.indices("bank");
        // 指定DSL,检索条件
        // SearchSourceBuilder searchSourceBuilder 封装的条件
        SearchSourceBuilder searchSourceBuilder = new SearchSourceBuilder();
        // 1.1 构造检索条件
        searchSourceBuilder.query(QueryBuilders.matchQuery("address", "mill"));
        // 1.2 按照年龄的值分布进行聚合
        TermsAggregationBuilder ageAgg = AggregationBuilders.terms("ageAgg").field("age");
        searchSourceBuilder.aggregation(ageAgg);
        // 1.3 计算平均薪资
        AvgAggregationBuilder balanceAvg = AggregationBuilders.avg("balanceAvg").field("balance");
        searchSourceBuilder.aggregation(balanceAvg);
        System.out.println("检索条件：" + searchSourceBuilder);
        searchRequest.source(searchSourceBuilder);
        // 2。 执行检索
        SearchResponse searchResponse = client.search(searchRequest, MallElasticSearchConfig.COMMON_OPTIONS);
        // 3. 分析结果，searchResponse
//        System.out.println("结果：" + searchResponse.toString());
//        Map map = JSON.parseObject(searchResponse.toString(), Map.class);
        SearchHits responseHits = searchResponse.getHits();
        SearchHit[] hits = responseHits.getHits();
        for (SearchHit hit : hits) {
            String sourceAsString = hit.getSourceAsString();
//            System.out.println(sourceAsString);
            Account account = JSON.parseObject(sourceAsString, Account.class);
            System.out.println(account);
        }
        TimeValue took = searchResponse.getTook();
        System.out.println(took);
        Aggregations aggregations = searchResponse.getAggregations();
        System.out.println(aggregations);
        Terms ageAggRepo = aggregations.get("ageAgg");
        for (Bucket bucket : ageAggRepo.getBuckets()) {
            String keyAsString = bucket.getKeyAsString();
            System.out.println(keyAsString + "------" + bucket.getDocCount());
        }

        Avg balanceAvg1 = aggregations.get("balanceAvg");
        System.out.println("balanceAvg:" + balanceAvg1.getValue());
    }


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

    @ToString
    @Data
    static class Account {
        private int account_number;
        private int balance;
        private String firstname;
        private String lastname;
        private int age;
        private String gender;
        private String address;
        private String employer;
        private String email;
        private String city;
        private String state;
    }
}
