package com.bug_check_background.pojo.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;
import org.springframework.validation.annotation.Validated;

import java.time.LocalDate;
import java.util.List;

@Builder
@Data
@Validated
public class BugDto {

    @ApiModelProperty(value = "页码")
    private Integer pageNum;

    @ApiModelProperty(value = "每页数量")
    private Integer pageSize;

    @ApiModelProperty(value = "id")
    private Long id;

    @ApiModelProperty(value = "类型列表")
    private List<String> typeList;

    @ApiModelProperty(value = "扫描工具列表")
    private List<Integer> scannerList;

    @ApiModelProperty(value = "级别列表")
    private List<Integer> levelList;

    @ApiModelProperty(value = "生态系统列表")
    private List<String> ecosystemList;

    @ApiModelProperty(value = "全局搜索参数")
    private String globalParam;
}
