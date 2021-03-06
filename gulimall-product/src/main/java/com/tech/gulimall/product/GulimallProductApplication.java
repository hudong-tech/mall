package com.tech.gulimall.product;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
/**
 * 1、整合MyBatis-Plus
 *      1）、导入依赖
 *      <dependency>
 *             <groupId>com.baomidou</groupId>
 *             <artifactId>mybatis-plus-boot-starter</artifactId>
 *             <version>3.2.0</version>
 *      </dependency>
 *      2）、配置
 *          1、配置数据源；
 *              1）、导入数据库的驱动。https://dev.mysql.com/doc/connector-j/8.0/en/connector-j-versions.html
 *              2）、在application.yml配置数据源相关信息
 *          2、配置MyBatis-Plus；
 *              1）、使用@MapperScan
 *              2）、告诉MyBatis-Plus，sql映射文件位置
 *
 * 2、逻辑删除
 *  1）、配置全局的逻辑删除规则（省略）
 *  2）、配置逻辑删除的组件Bean（省略）
 *  3）、给Bean加上逻辑删除注解@TableLogic
 *
 * 3、JSR303
 *   1）、给Bean添加校验注解:javax.validation.constraints，并定义自己的message提示
 *   2)、开启校验功能@Valid
 *      效果：校验错误以后会有默认的响应；
 *   3）、给校验的bean后紧跟一个BindingResult，就可以获取到校验的结果
 *   4）、分组校验（多场景的复杂校验）
 *         1)、	@NotBlank(message = "品牌名必须提交",groups = {AddGroup.class,UpdateGroup.class})
 *          给校验注解标注什么情况需要进行校验
 *         2）、@Validated({AddGroup.class})
 *         3)、默认没有指定分组的校验注解@NotBlank，在分组校验情况@Validated({AddGroup.class})下不生效，只会在@Validated生效；
 *
 *   5）、自定义校验
 *      1）、编写一个自定义的校验注解
 *      2）、编写一个自定义的校验器 ConstraintValidator
 *      3）、关联自定义的校验器和自定义的校验注解
 *      @Documented
 * @Constraint(validatedBy = { ListValueConstraintValidator.class【可以指定多个不同的校验器，适配不同类型的校验】 })
 * @Target({ METHOD, FIELD, ANNOTATION_TYPE, CONSTRUCTOR, PARAMETER, TYPE_USE })
 * @Retention(RUNTIME)
 * public @interface ListValue {
 *
 * 4、统一的异常处理
 * @ControllerAdvice
 *  1）、编写异常处理类，使用@ControllerAdvice。
 *  2）、使用@ExceptionHandler标注方法可以处理的异常。
 *
 *  5、引入模板引擎
 *  1）、thymeleaf-starter：关闭缓存
 *  2）、静态资源都放在static文件夹下，就可以按照路径直接访问
 *  3）、页面放在templates下，也可直接访问
 *      springboot,访问项目时，默认会找index
 *  4）、页面修改不重启服务器情况下实时更新
 *      4.1）、引入dev-tools
 *      4.2）、修改完页面 ctrl+f9 重新编译页面  或 ctrl+shift+f9 重新编译当前页面， 如果代码配置，还是推荐 重启服务，以避免系统bug.
 *      4.3）、网页重新刷新即可看到修改后的页面
 *
 *  6、整合redis
 *  1）、引入 spring-boot-starter-redis
 *  2）、简单配置redis的host信息
 *  3）、使用Springboot自动配置好的StringRedisTemplate来操作redis
 *
 *  7、整合redisson作为分布式锁等功能框架    官方文档： https://github.com/redisson/redisson/wiki/Table-of-Content
 *  1）、引入依赖
 *  2）、配置redisson
 *
 *  8、整合SpringCache 简化缓存开发          https://docs.spring.io/spring-framework/docs/current/reference/html/integration.html#cache
 *      1）、引入依赖
 *             spring-boot-starter-cache    spring-boot-starter-data-redis
 *      2）、写配置
 *          （1）、自动配置了哪些
 *              CacheAutoConfiguration 会导入 RedisCacheConfiguration
 *              自动配好了缓存管理器 RedisCacheManager
 *         （2）、配置使用redis作为缓存
 *         （3）、测试使用缓存
 *              @Cacheable: Triggers cache population.  触发将数据保存到缓存的操作
 *              @CacheEvict: Triggers cache eviction.   触发将数据从缓存中删除的操作
 *              @CachePut: Updates the cache without interfering with the method execution.     不影响方法执行更新缓存
 *              @Caching: Regroups multiple cache operations to be applied on a method.         组合以上多个操作
 *              @CacheConfig: Shares some common cache-related settings at class-level.         在类级别共享缓存的相同配置
 *              a. 开启缓存功能   @EnableCaching
 *              b. 只需要使用注解就能完成缓存操作
 *         （4）、原理
 *              CacheAutoConfiguration  --> RedisCacheConfiguration  --> 自动配置了 RedisCacheManager  --> 初始化所有的缓存（默认配置 RedisCacheConfiguration.determineConfiguration()）
 *              --> 每个缓存决定使用什么配置    --> 如果 RedisCacheConfiguration 有就用已有的，没有就用默认配置 （RedisCacheConfiguration.determineConfiguration()方法中）
 *              --> 想改缓存的配置，只需要给容器中放一个 redisCacheConfiguration即可  --> 就会应用到当前缓存管理器（RedisCacheManager） 管理的所有缓存分区中。
 *      3）、Spring-Cache的不足：
 *          1）、读模式：
 *              缓存穿透：查询一个null数据。
 *                  解决：缓存空数据 配置文件中写入 --> spring.cache.redis.cache-null-values=true
 *              缓存击穿：大量并发进来同时查询一个正好过期的数据
 *                  解决：加锁(默认是无加锁的)      sync = true 加锁解决击穿问题    如     @Cacheable(value = {"category"}, key = "#root.method.name", sync = true)
 *              缓存雪崩：大量的key同时过期，超大型的系统可能会发生。在正常的系统，只要不是正好10+w个key同时过期，同时正好10w+的请求进来，就不用考虑。
 *                  解决：加随机时间，加上过期时间 spring.cache.redis.time-to-live=3600000
 *          2）、写模式：（缓存与数据库一致）
 *              1）、读写加锁。    适用于读多写少的系统
 *              2）、引入中间件Canal,感知到mysql的更新去更新数据库
 *              3）、读多写多，直接去数据库查询就行
 *         总结：
 *              常规数据（读多写少，即时性， 一致性要求不高的数据）：完全可以使用Spring Cache，写模式（只要缓存的数据有过期时间就足够了）
 *              特殊数据：特殊设计
 *
 *     原理：  CacheManager（RedisCacheManager） --> Cache（RedisCache）  --> Cache负责缓存的读写
 */
@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients(basePackages = "com.tech.gulimall.product.feign")
@MapperScan("com.tech.gulimall.product.dao")
public class GulimallProductApplication {

    public static void main(String[] args) {
        SpringApplication.run(GulimallProductApplication.class, args);
    }

}
