package com.bug_check_background.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bug_check_background.pojo.entity.BugInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BugMapper extends BaseMapper<BugInfo> {

}
