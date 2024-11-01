package com.bug_check_background.pojo.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class LoginVo {
    @ApiModelProperty(value = "用户id")
    private Long id;

    @ApiModelProperty(value = "账户")
    private String account;

    @ApiModelProperty(value = "token")
    private String token;

    @ApiModelProperty(value = "username")
    private String username;
}
