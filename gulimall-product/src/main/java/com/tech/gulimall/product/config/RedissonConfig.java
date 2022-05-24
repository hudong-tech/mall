package com.tech.gulimall.product.config;

import org.redisson.Redisson;
import org.redisson.api.RedissonClient;
import org.redisson.config.Config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * redisson配置类
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2022-05-24 21:13:22
 **/

@Configuration
public class RedissonConfig {

    /***
    * @description: 所有对Redisson的使用都是通过 RedissonClient 对象
    * @param: []
    * @return: org.redisson.api.RedissonClient
    * @author: phil
    * @date: 2022/5/24 21:16
    */
    @Bean
    public RedissonClient redissonClient() {
        // 1. 创建配置
        Config config = new Config();
        config.useSingleServer().setAddress("redis://81.68.207.20:6379");
        // 2. 根据 Config 创建出 RedissonClient 实例
        RedissonClient redisson = Redisson.create(config);
        return redisson;
    }
}
