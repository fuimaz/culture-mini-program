package com.hk.culture.mini.program.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * <p>
 * 标注点表
 * </p>
 *
 * @author 
 * @since 2020-05-12
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("site")
public class Site implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "TID", type = IdType.UUID)
    private String tid;

    /**
     * 标注点名
     */
    private String name;

    /**
     * 详情
     */
    private String detail;

    /**
     * 简介
     */
    private String brief;

    /**
     * 审核状态
     */
    private Boolean auditing;

    /**
     * 经度
     */
    private BigDecimal lng;

    /**
     * 纬度
     */
    private BigDecimal lat;

    /**
     * 审核人
     */
    @TableField("authMan")
    private String authMan;

    /**
     * 类型
     */
    private String type;

    /**
     * 背景图
     */
    private String img;

    /**
     * 是否展示
     */
    @TableField("`show`")
    private String show;

    /**
     * 排序, 竞价搜索
     */
    @TableField("`order`")
    private int order;

    /**
     * 创建时间
     */
    @TableField("createTime")
    private LocalDateTime createTime;

    /**
     * 更新时间
     */
    @TableField("updateTime")
    private LocalDateTime updateTime;


}
