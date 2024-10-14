package com.bug_check_background.pojo.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;
import org.springframework.validation.annotation.Validated;

import java.util.List;

@Builder
@Data
@Validated
public class ConditionVo {

    @ApiModelProperty(value = "类型列表")
    private List<String> typeList;

    @ApiModelProperty(value = "扫描工具列表")
    private List<Integer> scannerList;

    @ApiModelProperty(value = "级别列表")
    private List<Integer> levelList;

    @ApiModelProperty(value = "生态系统列表")
    private List<String> ecosystemList;
}
