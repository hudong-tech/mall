package com.tech.gulimall.product.web;

import com.tech.gulimall.product.entity.po.CategoryEntity;
import com.tech.gulimall.product.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

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

    @GetMapping({"/", "/index.html"})
    public String indexPage(Model model) {
        List<CategoryEntity> categoryEntities = categoryService.getLevel1Category();

        // 视图解析器进行接串 : thymeleaf前缀 + 返回值 + thymeleaf后缀 在application.yml中配置
        // classpath:/templates/ + 返回值 + .html
        model.addAttribute("categorys", categoryEntities);
        return "index";
    }
}
