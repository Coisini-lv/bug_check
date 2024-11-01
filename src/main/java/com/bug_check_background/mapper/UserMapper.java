package com.bug_check_background.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bug_check_background.pojo.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface UserMapper extends BaseMapper<User> {

    @Select("select account from bug_check.user")
    List<String> selectAllAccount();

    @Select("select * from bug_check.user")
    User selectByAccount(String account);

}
