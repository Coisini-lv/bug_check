package com.bug_check_background.pojo.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;
import org.springframework.validation.annotation.Validated;

import java.time.LocalDate;

@Builder
@Data
@Validated
public class BugDto {

    @ApiModelProperty(value = "页码")
    private Integer pageNum;

    @ApiModelProperty(value = "每页数量")
    private Integer pageSize;

    @ApiModelProperty(value = "全局搜索参数")
    private String globalParam;

    @ApiModelProperty(value = "标题")
    private String title;

    @ApiModelProperty(value = "项目")
    private String project;

    @ApiModelProperty(value = "扫描工具")
    private Integer scanner;

    @ApiModelProperty(value = "级别")
    private Integer level;

    @ApiModelProperty(value = "发布日期")
    private LocalDate publishDate;

    @ApiModelProperty(value = "cve")
    private String cve;

    @ApiModelProperty(value = "类型")
    private String type;

    @ApiModelProperty(value = "生态系统")
    private String ecosystem;

    @ApiModelProperty(value = "cwe")
    private String cwe;

    @ApiModelProperty(value = "cvss")
    private String cvss;

    @ApiModelProperty(value = "厂商")
    private String credit;

    @ApiModelProperty(value = "评分")
    private Double grade;

    @ApiModelProperty(value = "描述")
    private String description;

    @ApiModelProperty(value = "推出计划")
    private String introducePlan;

    @ApiModelProperty(value = "威胁概述")
    private String threatOverview;

    @ApiModelProperty(value = "攻击场景")
    private String attackScenario;

    @ApiModelProperty(value = "受影响对象")
    private String affectedObject;

    @ApiModelProperty(value = "技术报告")
    private String techReport;

    @ApiModelProperty(value = "修复步骤")
    private String repairProcedure;

    @ApiModelProperty(value = "补丁详情")
    private String patchDetail;
}
