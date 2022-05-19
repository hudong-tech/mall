package com.tech.gulimall.common.utils;

import com.alibaba.fastjson.JSON;
import org.springframework.lang.Nullable;

import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;

/**
 * @className: StringUtils
 * @description: 字符串工具类
 * @author: phil
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

    /**
    * @description: 将字符串转换成字节数组
    * @param: [str, charsetName] charsetName常用参数 : ["utf-8", "gbk"]
    * @return: byte[]
    * @author: phil
    * @date: 2022/5/19 12:41
    */
    public static byte[] strConvertBytes(String str, String charsetName) {
        byte[] bytes = null;
        try {
            bytes = JSON.toJSONString(str).getBytes(charsetName);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return bytes;
    }

    /***
     * @description: 将获取到的字节大小转换
     * @param: [size]
     * @return: String
     * @author: phil
     * @date: 2022/5/19 12:25
     */
    public static String setSize(int size) {
        //获取到的size为：1705230
        int GB = 1024 * 1024 * 1024;//定义GB的计算常量
        int MB = 1024 * 1024;//定义MB的计算常量
        int KB = 1024;//定义KB的计算常量
        DecimalFormat df = new DecimalFormat("0.00");//格式化小数
        String resultSize = "";
        if (size / GB >= 1) {
            //如果当前Byte的值大于等于1GB
            resultSize = df.format(size / (float) GB) + "GB   ";
        } else if (size / MB >= 1) {
            //如果当前Byte的值大于等于1MB
            resultSize = df.format(size / (float) MB) + "MB   ";
        } else if (size / KB >= 1) {
            //如果当前Byte的值大于等于1KB
            resultSize = df.format(size / (float) KB) + "KB   ";
        } else {
            resultSize = size + "B   ";
        }
        return resultSize;
    }
}
