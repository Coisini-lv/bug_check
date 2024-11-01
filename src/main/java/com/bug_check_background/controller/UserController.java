package com.bug_check_background.controller;

import com.bug_check_background.common.result.Result;
import com.bug_check_background.pojo.dto.LoginDto;
import com.bug_check_background.pojo.dto.RegisterDto;
import com.bug_check_background.pojo.vo.LoginVo;
import com.bug_check_background.pojo.vo.RegisterVo;
import com.bug_check_background.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequestMapping("/user")
@Api(tags = "用户管理")
@Validated
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/login")
    @ApiOperation(value = "用户登录")
    public Result<LoginVo> login(@Validated @RequestBody LoginDto loginDto) {
        return Result.success(userService.login(loginDto));
    }

    @PostMapping("/register")
    @ApiOperation(value = "用户注册")
    public Result<RegisterVo> register(@Validated @RequestBody RegisterDto loginDto) {
        return Result.success(userService.register(loginDto));
    }

}
