package com.bug_check_background.pojo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName(value = "buginfo")
public class BugInfo {
    @ApiModelProperty(value = "id")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "标题")
    @TableField(value = "title")
    private String title;

    @ApiModelProperty(value = "项目")
    @TableField(value = "project")
    private String project;

    @ApiModelProperty(value = "扫描工具")
    @TableField(value = "scanner")
    private Integer scanner;

    @ApiModelProperty(value = "级别")
    @TableField(value = "level")
    private Integer level;

    @ApiModelProperty(value = "发布日期")
    @TableField(value = "publish_date")
    private LocalDate publishDate;

    @ApiModelProperty(value = "cve")
    @TableField(value = "cve")
    private String cve;

    @ApiModelProperty(value = "类型")
    @TableField(value = "type")
    private String type;

    @ApiModelProperty(value = "特性")
    @TableField(value = "characters")
    private String characters;

    @ApiModelProperty(value = "生态系统")
    @TableField(value = "ecosystem")
    private String ecosystem;

    @ApiModelProperty(value = "cwe")
    @TableField(value = "cwe")
    private String cwe;

    @ApiModelProperty(value = "cvss")
    @TableField(value = "cvss")
    private String cvss;

    @ApiModelProperty(value = "厂商")
    @TableField(value = "credit")
    private String credit;

    @ApiModelProperty(value = "评分")
    @TableField(value = "grade")
    private Double grade;

    @ApiModelProperty(value = "扫描链接")
    @TableField(value = "scanner_link")
    private String scannerLink;

    @ApiModelProperty(value = "描述")
    @TableField(value = "description")
    private String description;

    @ApiModelProperty(value = "推出计划")
    @TableField(value = "introduce_plan")
    private String introducePlan;

    @ApiModelProperty(value = "威胁概述")
    @TableField(value = "threat_overview")
    private String threatOverview;

    @ApiModelProperty(value = "攻击场景")
    @TableField(value = "attack_scenario")
    private String attackScenario;

    @ApiModelProperty(value = "受影响对象")
    @TableField(value = "affected_object")
    private String affectedObject;

    @ApiModelProperty(value = "技术报告")
    @TableField(value = "tech_report")
    private Integer techReport;

    @ApiModelProperty(value = "修复步骤")
    @TableField(value = "repair_procedure")
    private String repairProcedure;

    @ApiModelProperty(value = "补丁详情")
    @TableField(value = "patch_detail")
    private String patchDetail;
}
