package com.bug_check_background.pojo.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@TableName(value = "num")
public class Num {

    @ApiModelProperty(value = "公开安全公告数")
    @TableField(value = "public_security_notice")
    Integer publicSecurityNotice ;

    @TableField(value = "premium_suggestion")
    @ApiModelProperty(value = "Premium建议数")
    Integer premiumSuggestion;

    @TableField(value = "premium_average")
    @ApiModelProperty(value = "Premium平均预警")
    Integer premiumAverage;

    @TableField(value = "last90_days_bug")
    @ApiModelProperty(value = "过去90天Bug数")
    Integer last90DaysBug;

    @TableField(value = "private_bug")
    @ApiModelProperty(value = "未公开Bug数")
    Integer privateBug;

    @TableField(value = "premium_days")
    @ApiModelProperty(value = "Premium抢先体验天数")
    Integer premiumDays;
}
