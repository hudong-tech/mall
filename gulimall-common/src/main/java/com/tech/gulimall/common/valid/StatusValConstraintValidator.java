package com.tech.gulimall.common.valid;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.HashSet;
import java.util.Set;

/**
* @Description: 自定义校验器 ConstraintValidator
* @Author: phil
* @Date: 2021/11/5 14:31
*/
public class StatusValConstraintValidator implements ConstraintValidator<StatusVal, Integer> {

    /**
     * 存储所有可能的值
     */
    private Set<Integer> set =new HashSet<>();
    /***
    * @Description: 初始化方法，拿到StatusVal中的详细信息 如 val={0, 1}, groups = {AddGroup.class, UpdateGroup.class}
    * @Param: [constraintAnnotation]
    * @return: void
    * @Author: phil
    * @Date: 2021/11/5 14:32
    */
    @Override
    public void initialize(StatusVal constraintAnnotation) {
        if (null != constraintAnnotation) {
            // 获取后端写好的限制 // 这个value就是ListValue里的value，我们写的注解是@ListValue(value={0,1})
            for (int val : constraintAnnotation.vals()) {
                set.add(val);
            }
        }
    }

    /**
    * @Description: 判断是否校验成功
    * @Param: [value, context]
    * @return: boolean
    * @Author: phil
    * @Date: 2021/11/5 14:34
    */
    @Override
    public boolean isValid(Integer value, ConstraintValidatorContext context) {
        return set.contains(value);
    }
}
