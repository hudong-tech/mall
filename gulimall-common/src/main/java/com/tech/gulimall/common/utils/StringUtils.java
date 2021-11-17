package com.tech.gulimall.common.utils;

import org.springframework.lang.Nullable;

/**
 * @className: StringUtils
 * @description: 字符串工具类
 * @author: niaonao
 * @date: 2021/11/17
 **/
public class StringUtils extends org.springframework.util.StringUtils {

    /**
    * @Description: 判断是否不可空
    * @Param: [str]
    * @return: boolean
    * @Author: phil
    * @Date: 2021/11/17 16:54
    */
    public static boolean isNotEmpty(@Nullable Object str) {
        return !isEmpty(str);
    }
}
