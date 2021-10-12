package com.tech.gulimall.member.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.tech.gulimall.common.utils.PageUtils;
import com.tech.gulimall.member.entity.MemberEntity;

import java.util.Map;

/**
 * 会员
 *
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-12 21:08:06
 */
public interface MemberService extends IService<MemberEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

