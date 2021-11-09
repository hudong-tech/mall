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

    @TableField("create_by")
    protected String createdBy;
    @TableField(
            value = "create_on",
            fill = FieldFill.INSERT
    )
    protected Date createdOn;
    @TableField("last_modified_by")
    protected String lasModifiedBy;
    @TableField(
            value = "last_modified_on",
            fill = FieldFill.INSERT_UPDATE
    )
    protected Date lastModifiedOn;
    @Version
    @TableField("version")
    protected Integer version;

    public static final String URID = "URID";
    public static final String CREATEDBY = "CREATEDBY";
    public static final String CREATEDON = "CREATEDON";
    public static final String LASTMODIFIEDBY = "LASTMODIFIEDBY";
    public static final String LASTMODIFIEDON = "LASTMODIFIEDON";
    public static final String ROWVERSION = "ROWVERSION";

    public CommonObject() {
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public String getLasModifiedBy() {
        return lasModifiedBy;
    }

    public void setLasModifiedBy(String lasModifiedBy) {
        this.lasModifiedBy = lasModifiedBy;
    }

    public Date getLastModifiedOn() {
        return lastModifiedOn;
    }

    public void setLastModifiedOn(Date lastModifiedOn) {
        this.lastModifiedOn = lastModifiedOn;
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }
}
