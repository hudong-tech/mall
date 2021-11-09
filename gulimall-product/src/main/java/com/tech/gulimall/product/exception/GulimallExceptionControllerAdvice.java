package com.tech.gulimall.product.exception;

import com.tech.gulimall.common.exception.BizException;
import com.tech.gulimall.common.exception.enums.BizCodeEnum;
import com.tech.gulimall.common.utils.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;

/***
* @Description: 统一异常处理类
* @Author: phil
* @Date: 2021/11/5 12:15
*/
@Slf4j
@RestControllerAdvice(basePackages = "com.tech.gulimall.product.controller")
public class GulimallExceptionControllerAdvice {

    /**
    * @Description: 业务处理异常
    * @Param: [e]
    * @return: com.tech.gulimall.common.utils.R
    * @Author: phil
    * @Date: 2021/11/8 19:22
    */
    @ExceptionHandler(value = BizException.class)
    public R handleValidException (BizException e) {
        log.error("业务处理异常{}，异常类型：{}", e.getMessage(), e.getClass());
        return R.error(BizCodeEnum.BIZ_EXCEPTION.getCode(), BizCodeEnum.BIZ_EXCEPTION.getMsg()).put("data", e.getMessage());
    }

    /** 
    * @Description: 数据校验异常 
    * @Param: [e] 
    * @return: com.tech.gulimall.common.utils.R 
    * @Author: phil 
    * @Date: 2021/11/5 12:27
    */
    @ExceptionHandler(value = MethodArgumentNotValidException.class)
    public R handleValidException (MethodArgumentNotValidException e) {
        log.error("数据校验出现问题{}，异常类型：{}", e.getMessage(), e.getClass());
        BindingResult bindingResult = e.getBindingResult();
        HashMap<String, String> errorMap = new HashMap<>(10);
        for (FieldError fieldError : bindingResult.getFieldErrors()) {
            errorMap.put(fieldError.getField(), fieldError.getDefaultMessage());
        }
        return R.error(BizCodeEnum.VALID_EXCEPTION.getCode(), BizCodeEnum.VALID_EXCEPTION.getMsg()).put("data", errorMap);
    }
    
    /** 
    * @Description: 默认异常处理
    * @Param: [e] 
    * @return: com.tech.gulimall.common.utils.R 
    * @Author: phil 
    * @Date: 2021/11/5 12:29
    */
    @ExceptionHandler(value = Throwable.class)
    public R handleException(Throwable e) {
        log.error("未知异常{}，异常类型{}", e.getMessage(), e.getClass());
        return R.error(BizCodeEnum.UNKNOWN_EXCEPTION.getCode(), BizCodeEnum.UNKNOWN_EXCEPTION.getMsg());
    }
}
