package com.bug_check_background.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.bug_check_background.pojo.entity.BugInfo;
import com.bug_check_background.pojo.entity.Num;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface BugMapper extends BaseMapper<BugInfo> {

    @Select("select distinct type from bug_check.buginfo")
    List<String> selectType();

    @Select("select distinct scanner from bug_check.buginfo")
    List<Integer> selectScanner();

    @Select("select distinct level from bug_check.buginfo")
    List<Integer> selectLevel();

    @Select("select distinct ecosystem from bug_check.buginfo")
    List<String> selectEcosystem();

    @Select("select * from bug_check.num")
    Num selectNum();
}
