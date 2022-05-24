package com.tech.gulimall.product.web;

import com.tech.gulimall.product.entity.po.CategoryEntity;
import com.tech.gulimall.product.entity.vo.Catalog2Vo;
import com.tech.gulimall.product.service.CategoryService;
import org.redisson.api.RLock;
import org.redisson.api.RedissonClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 首页controller
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2022-05-17 02:24:54
 **/
@Controller
public class IndexController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private RedissonClient redisson;

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


    @ResponseBody
    @GetMapping("/hello")
    public String hello() {
        // 1. 获取一把锁，只要锁名一致，就是同一把锁
        RLock lock = redisson.getLock("hello");

        // 2. 加锁
        // 阻塞式等待，默认加的锁过期时间都是30s
        lock.lock();
        // 1）、锁的自动续期，如果业务超长，运行期间自动给锁续上新的30s。不用担心业务时间长，锁自动过期被删掉
        // 2）、加锁的业务只要运行完成，就不会给当前锁续期，即使不手动解锁，锁默认在30s后也会自动删除。
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
