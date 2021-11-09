package com.tech.gulimall.common.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.Version;

import java.io.Serializable;
import java.util.Date;

/**
* @Description:  基础类
* @Param:
* @return:
* @Author: phil
* @Date: 2021/11/8 19:05
*/
public class CommonObject implements Serializable {

    private static final long serialVersionUID = -8976593705955160104L;

    @TableField("created_by")
    protected String createdBy;
    @TableField(
            value = "created_time",
            fill = FieldFill.INSERT
    )
    protected Date createdTime;
    @TableField("updated_by")
    protected String updatedBy;
    @TableField(
            value = "updated_time",
            fill = FieldFill.INSERT_UPDATE
    )
    protected Date updatedTime;
    @Version
    @TableField("version")
    protected Integer version;

    public static final String URID = "URID";
    public static final String CREATEDBY = "CREATEDBY";
    public static final String CREATEDTIME = "CREATEDON";
    public static final String UPDATEDBY = "UPDATEDBY";
    public static final String UPDATEDTIME = "UPDATEDTIME";
    public static final String VERSION = "VERSION";

    public CommonObject() {
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }
}
