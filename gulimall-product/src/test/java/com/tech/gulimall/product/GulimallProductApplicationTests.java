package com.tech.gulimall.product;

import com.tech.gulimall.product.entity.po.BrandEntity;
import com.tech.gulimall.product.service.BrandService;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Scanner;
import java.util.UUID;

@SpringBootTest
@RunWith(SpringRunner.class)
@Slf4j
public class GulimallProductApplicationTests {

    @Autowired
    private BrandService brandService;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Test
    public void contextLoads() {
        BrandEntity brandEntity = new BrandEntity();
        brandEntity.setName("戴尔");
        brandService.save(brandEntity);
        System.out.println("保存成功！");
    }

    @Test
    public void compoundInterest() {
        Scanner input = new Scanner(System.in);
        System.out.println("请输入股票：");
        String stock = input.nextLine();
        System.out.println("请输入当前股价：");
        Double sharePrice = input.nextDouble();
        System.out.println("请预测每日涨幅：");
        Double rose = input.nextDouble();
        System.out.println("预测多少天：");
        int days = input.nextInt();

        double result = sharePrice * Math.pow((1 + rose / 100) , days);
        System.out.println(String.format("股票" + stock + "的最终价格为:" + String.format("%.2f", result)));
        System.out.println("涨幅为：" + String.format("%.2f",(Math.pow((1 + rose/100) , days) - 1 ) * 100) + "%.");
    }

    @Test
    public void testStringRedisTemplate() {
        ValueOperations<String, String> ops = stringRedisTemplate.opsForValue();

        ops.set("hello", "world_" + UUID.randomUUID().toString());

        String hello = ops.get("hello");
        System.out.println("hello:" + hello);
    }

}
