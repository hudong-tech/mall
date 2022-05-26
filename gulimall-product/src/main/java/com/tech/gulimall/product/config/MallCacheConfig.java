package com.tech.gulimall.product.config;

import com.alibaba.fastjson.support.spring.GenericFastJsonRedisSerializer;
import org.springframework.boot.autoconfigure.cache.CacheProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheConfiguration;
import org.springframework.data.redis.serializer.RedisSerializationContext;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/**
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2022-05-26 19:35:35
 **/

@Configuration
@EnableCaching
// 开启属性配置的绑定功能
@EnableConfigurationProperties(CacheProperties.class)
public class MallCacheConfig {


    /**
    * @description: redis cache 自定义配置
     * 可参考  org.springframework.boot.autoconfigure.cache.RedisCacheConfiguration.determineConfiguration() 方法
     * 配置文件中的东西都没有用上：
     *  1. 原来和配置文件绑定的配置类是这样的， 没有放在容器中
     *      @ConfigurationProperties(prefix = "spring.cache")
     *      public class CacheProperties
     *
     *  2. 要让它生效：
     *      @EnableConfigurationProperties(CacheProperties.class)
    * @param: []
    * @return: org.springframework.data.redis.cache.RedisCacheConfiguration
    * @author: phil
    * @date: 2022/5/26 20:00
    */
    // 使用 CacheProperties 的方式
    // 1. 注入
    //    @Autowired
    //    CacheProperties cacheProperties;
    // 2. 以参数形式传入，它会自动从容器中拿到 CacheProperties
    @Bean
    RedisCacheConfiguration redisCacheConfiguration(CacheProperties cacheProperties) {
        RedisCacheConfiguration config = RedisCacheConfiguration.defaultCacheConfig();


        // key的序列化方式
        config = config.serializeKeysWith(RedisSerializationContext.SerializationPair.fromSerializer(new StringRedisSerializer()));
        // value的序列化方式
        config = config.serializeValuesWith(RedisSerializationContext.SerializationPair.fromSerializer(new GenericFastJsonRedisSerializer()));

        // 将所有默认配置都要进行设置
        CacheProperties.Redis redisProperties = cacheProperties.getRedis();
        if (redisProperties.getTimeToLive() != null) {
            config = config.entryTtl(redisProperties.getTimeToLive());
        }

        if (redisProperties.getKeyPrefix() != null) {
            config = config.prefixKeysWith(redisProperties.getKeyPrefix());
        }

        if (!redisProperties.isCacheNullValues()) {
            config = config.disableCachingNullValues();
        }

        if (!redisProperties.isUseKeyPrefix()) {
            config = config.disableKeyPrefix();
        }

        return config;
    }
}
