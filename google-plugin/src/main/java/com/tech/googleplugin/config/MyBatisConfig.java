package com.tech.googleplugin.config;

import com.baomidou.mybatisplus.extension.plugins.OptimisticLockerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/***
 * @Description: mybatis 配置类
 * @Author: phil
 * @Date: 2021/11/22 13:53
 */
@Configuration
@EnableTransactionManagement
@MapperScan("com.tech.gulimall.googleplugin.dao")
public class MyBatisConfig {

    /**
     * 引入分页插件
     * @return
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        PaginationInterceptor paginationInterceptor = new PaginationInterceptor();
        // 设置请求的页面大于最大页后操作， true调回到首页，false 继续请求  默认false
        paginationInterceptor.setOverflow(true);
        // 设置最大单页限制数量，默认 500 条，-1 不受限制
        paginationInterceptor.setLimit(1000);
        return paginationInterceptor;
    }

    /***
     * @Description: 添加乐观锁插件配置
     * @Param: []
     * @return: com.baomidou.mybatisplus.extension.plugins.OptimisticLockerInterceptor
     * @Author: phil
     * @Date: 2021/11/21 18:28
     */
    @Bean
    public OptimisticLockerInterceptor optimisticLockerInterceptor() {
        return new OptimisticLockerInterceptor();
    }
}
