package com.tech.gulimall.common.utils;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import com.tech.gulimall.common.entity.CommonObject;

import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/** 
* @Description: 工具类
* @Author: phil 
* @Date: 2021/11/8 19:02
*/
public class BeanUtils extends BeanUtil {
    public BeanUtils() {
    }

    public static <T extends CommonObject> void updateAuditFields(T obj, boolean isInsert) {
        updateAuditFields(obj, isInsert, "system");
    }

    public static <T extends CommonObject> void updateAuditFields(T obj, boolean isInsert, String userId) {
        Date modDate = new Date();
        if (isInsert) {
            obj.setCreatedTime(modDate);
            obj.setCreatedBy(userId);
            obj.setVersion(1);
        }
        obj.setUpdatedTime(modDate);
        obj.setUpdatedBy(userId);
    }

    public static <T extends CommonObject> void updateAuditFields(List<T> ObjList, boolean isInsert, String userId) {
        ObjList.forEach((obj) -> {
            updateAuditFields(obj, isInsert, userId);
        });
    }

    public static <T> T mapToBean(Map<?, ?> map, Class<T> beanClass, boolean isIgnoreError) {
        return BeanUtil.mapToBean(map, beanClass, isIgnoreError);
    }

    public static void copy(Object target, Object source, String... ignoreProperties) {
        copyProperties(source, target, true, false, ignoreProperties);
    }

    public static void copyWithoutNull(Object target, Object source, String... ignoreProperties) {
        copyProperties(source, target, true, true, ignoreProperties);
    }

    private static void copyProperties(Object source, Object target, boolean ignoreCase, boolean ignoreNullVall, String... ignoreProperties) {
        CopyOptions copyOptions = CopyOptions.create().setIgnoreCase(ignoreCase).setIgnoreNullValue(ignoreNullVall);
        if (ignoreProperties == null) {
            BeanUtil.copyProperties(source, target, copyOptions.setIgnoreProperties(ignoreProperties));
        } else {
            List<String> beforeIgnoreProperties = Arrays.asList(ignoreProperties);
            List<String> finalIgnoreProperties = (List)BeanUtil.getBeanDesc(source.getClass()).getProps().stream().filter((p) -> {
                return beforeIgnoreProperties.stream().anyMatch((s) -> {
                    return s.equalsIgnoreCase(p.getFieldName());
                });
            }).map((p) -> {
                return p.getFieldName();
            }).collect(Collectors.toList());
            BeanUtil.copyProperties(source, target, copyOptions.setIgnoreProperties((String[])finalIgnoreProperties.toArray(new String[0])));
        }
    }
}
