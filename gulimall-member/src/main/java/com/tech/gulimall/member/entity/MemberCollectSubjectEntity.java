package com.tech.gulimall.member.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.tech.gulimall.common.entity.CommonObject;
import lombok.Data;

import java.io.Serializable;

/**
 * 会员收藏的专题活动
 * 
 * @author phil
 * @email hudong.tech@gmail.com
 * @date 2021-10-12 21:08:06
 */
@Data
@TableName("ums_member_collect_subject")
public class MemberCollectSubjectEntity extends CommonObject implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * id
	 */
	@TableId
	private Long id;
	/**
	 * subject_id
	 */
	private Long subjectId;
	/**
	 * subject_name
	 */
	private String subjectName;
	/**
	 * subject_img
	 */
	private String subjectImg;
	/**
	 * 活动url
	 */
	private String subjectUrll;

}
