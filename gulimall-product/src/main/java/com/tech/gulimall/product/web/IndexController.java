package com.tech.gulimall.product.web;

import com.tech.gulimall.product.entity.po.CategoryEntity;
import com.tech.gulimall.product.entity.vo.Catalog2Vo;
import com.tech.gulimall.product.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RLock;
import org.redisson.api.RReadWriteLock;
import org.redisson.api.RSemaphore;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * 首页controller
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2022-05-17 02:24:54
 **/
@Controller
@Slf4j
public class IndexController {

    private static final String LOCK_UUID = "lock-uuid";

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private RedissonClient redisson;

    @Autowired
    private StringRedisTemplate redisTemplate;


    @GetMapping({"/", "/index.html"})
    public String indexPage(Model model) {
        List<CategoryEntity> categoryEntities = categoryService.getLevel1Category();

        // 视图解析器进行接串 : thymeleaf前缀 + 返回值 + thymeleaf后缀 在application.yml中配置
        // classpath:/templates/ + 返回值 + .html
        model.addAttribute("categorys", categoryEntities);
        return "index";
    }

    @GetMapping("/index/json/catalog.json")
    @ResponseBody   //以json数据返回值
    public Map<String, List<Catalog2Vo>> getCategoryMap() {
        return categoryService.getCatalogJsonDbWithRedisLock();
//        return categoryService.getCatalogJsonDBWithSpringCache();
    }

    /**
     * @description: 读写锁（ReadWriteLock）测试
     * @param: []
     * @return: java.lang.String
     * @author: phil
     * @date: 2022/5/25 17:20
     */
    @GetMapping("read")
    @ResponseBody
    public String readValue() {
        RReadWriteLock lock = redisson.getReadWriteLock("ReadWrite-Lock");
        RLock rLock = lock.readLock();
        String uuid = "";
        try {
            rLock.lock();
            System.out.println("读锁加锁..." + Thread.currentThread().getId());
            Thread.sleep(10000);
            uuid = redisTemplate.opsForValue().get(LOCK_UUID);
        } catch (InterruptedException e) {
            log.error(e.getLocalizedMessage());
        } finally {
            rLock.unlock();
            return "读取完成： " + uuid;
        }
    }

    /** 
    * @description: 读写锁（ReadWriteLock）测试
     *  保证一定能读到最新的数据，修改期间，写锁是一个排他锁（互斥锁，独享锁）。读是一个共享锁
     *  写锁没释放读就必须等待
     *  写 + 读 ： 等待写锁释放
     *  写 + 写： 阻塞方式
     *  读 + 读： 相当于无锁，并发读，只会在redis中记录好，所有当前的读锁，他们都会同时加锁成功
     *  读 + 写：有读锁，写也要等待
     *  只要有写的存在，都必须等待
    * @param: [] 
    * @return: java.lang.String 
    * @author: phil 
    * @date: 2022/5/25 17:20
    */
    
    @GetMapping("/write")
    @ResponseBody
    public String writeValue() {
        RReadWriteLock lock = redisson.getReadWriteLock("ReadWrite-Lock");
        RLock wLock = lock.writeLock();
        String uuid = UUID.randomUUID().toString();
        try {
            wLock.lock();
            System.out.println("写锁加锁..." + Thread.currentThread().getId());
            Thread.sleep(10000);
            redisTemplate.opsForValue().set(LOCK_UUID, uuid);

        } catch (InterruptedException e) {
            log.error(e.getLocalizedMessage());
        } finally {
            wLock.unlock();
            return "写入成功：" + uuid;
        }
    }
    
    /** 
    * @description: Redis的Redisson的分布式信号量（Semaphore）测试 以停车以例
    * @param: [] 
    * @return: java.lang.String 
    * @author: phil 
    * @date: 2022/5/25 21:05
    */
    @GetMapping("/park")
    @ResponseBody
    public String park() {
        RSemaphore park = redisson.getSemaphore("park");
        System.out.println("线程正在停车：" + Thread.currentThread().getId());
//        try {
//            // 获取一个信号，获取一个值，占一个车位
//           park.acquire();
//           park.acquire(2);
//
//        } catch (InterruptedException e) {
//            log.error(e.getLocalizedMessage());
//        }

        // 尝试获取信号值，如果获取不到，则返回false，且不会阻塞。
        // 可以作为分布式限流业务
        boolean b = park.tryAcquire();
        if (b) {
            // 执行业务
        } else {
            return "error";
        }

        return Thread.currentThread().getId() + "停车" + (b ? "成功" : "失败");
    }

    @GetMapping("go")
    @ResponseBody
    public String go() {
        RSemaphore park = redisson.getSemaphore("park");
        // 释放一个车位
        System.out.println("线程正在开走：" + Thread.currentThread().getId());
        park.release();
//        park.release(2);
        return Thread.currentThread().getId() +  "开走";
    }


    /***
    * @description: 可重入锁测试
    * @param: []
    * @return: java.lang.String
    * @author: phil
    * @date: 2022/5/25 17:21
    */
    @ResponseBody
    @GetMapping("/hello")
    public String hello() {
        // 官方文档     https://github.com/redisson/redisson/wiki/Table-of-Content
        // 1. 获取一把锁，只要锁名一致，就是同一把锁
        RLock lock = redisson.getLock("hello");

        // 2. 加锁
        // 阻塞式等待，默认加的锁过期时间都是30s
        //        lock.lock();
        // 1）、锁的自动续期，如果业务超长，运行期间自动给锁续上新的30s。不用担心业务时间长，锁自动过期被删掉
        // 2）、加锁的业务只要运行完成，就不会给当前锁续期，即使不手动解锁，锁默认在30s后也会自动删除。


        // 10秒后自动解锁。
        // 注意： 自动解锁时间一定要大于业务执行时间，在锁时间到了以后，不会自动续期，锁会被自动清除
        lock.lock(10, TimeUnit.SECONDS);
        // 问题： Lock.lock(10, TimeUnit.SECONDS); 在锁时间到了以后，不会自动续期
        // a. 如果我们传递了锁的超时时间，就发送给redis执行脚本，进行占锁，默认超时就是我们指定的时间
        // b. 如果我们未指定锁的超时时间，就使用默认的 this.commandExecutor.getConnectionManager().getCfg().getLockWatchdogTimeout()
        // lockWatchdogTimeout = 30000L【lockWatchdogTimeout 看门狗默认时间】。
        // 只要占锁成功，就会启动一个定时任务【重新给锁设置过期时间，新的过期时间就是 lockWatchdogTimeout 看门狗默认时间】，每隔10s就会自动再次续期，续期成满时间30s
        // internalLockLeaseTime【看门狗时间】 / 3        所以会10s后时间后续期。

        // 最佳实战
        // 1）、lock.lock(30, TimeUnit.SECONDS);      省掉了整个续期操作，手动解锁
        try {
            System.out.println("加锁成功，执行业务。。。。" + Thread.currentThread().getId());
            Thread.sleep(30000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        } finally {
            // 3. 解锁 如果解锁代码没有运行，redisson也不会出现死锁
            System.out.println("释放锁。。。" + Thread.currentThread().getId());
            lock.unlock();
        }

        return "hello";
    }
}
