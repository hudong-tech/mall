package com.tech.gulimall.member.dao;

import com.tech.gulimall.member.entity.MemberEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 会员
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-12 21:08:06
 */
@Mapper
public interface MemberDao extends BaseMapper<MemberEntity> {
	
}
