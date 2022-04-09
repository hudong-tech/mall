package com.tech.gulimall.search.config;

import org.apache.http.HttpHost;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;
import org.elasticsearch.client.RestHighLevelClient;
import org.springframework.context.annotation.Configuration;

/**
*  es的配置类
 *  1. 导入依赖
 *  2. 编写配置,给容器中注入一个RestHighLevelClient
 *  3. 参照官方api操作 https://www.elastic.co/guide/en/elasticsearch/client/java-rest/7.6/index.html
*
* @author phil 
* @email hudong.tech@gmail.com 
* @date 2022-04-10 02:24:08
**/
@Configuration
public class MallElasticSearchConfig {

//    @Bean
//    public RestHighLevelClient esRestClient() {
//        RestHighLevelClient client = new RestHighLevelClient(
//                RestClient.builder(
//                        new HttpHost("81.68.207.20", 9200, "http")));
//        return client;
//    }

    public RestHighLevelClient esRestClient() {
        RestClientBuilder builder = null;
        // String hostname, int port, String scheme
        RestClient.builder(new HttpHost("81.68.207.20", 9200, "http"));
        RestHighLevelClient client = new RestHighLevelClient(builder);

        return client;

    }

}
