package com.bug_check_background.service;

import com.bug_check_background.pojo.dto.BugDto;
import com.bug_check_background.pojo.entity.BugInfo;
import com.bug_check_background.pojo.entity.Num;
import com.bug_check_background.pojo.result.PageResult;
import com.bug_check_background.pojo.vo.ConditionVo;

import java.util.List;

public interface BugService {

    /**
     * 查询bug信息
     * @param bugDto
     * @return
     */
    PageResult selectBug(BugDto bugDto);

    /**
     * 查询条件
     * @return
     */
    ConditionVo selectCondition();

    /**
     * 查询各种数量
     * @return
     */
    Num selectNum();
}
