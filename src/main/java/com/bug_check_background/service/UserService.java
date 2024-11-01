package com.bug_check_background.service;

import com.bug_check_background.common.result.Result;
import com.bug_check_background.pojo.dto.LoginDto;
import com.bug_check_background.pojo.dto.RegisterDto;
import com.bug_check_background.pojo.vo.LoginVo;
import com.bug_check_background.pojo.vo.RegisterVo;

public interface UserService {

    LoginVo login(LoginDto loginDto);

    RegisterVo register(RegisterDto loginDto);
}
