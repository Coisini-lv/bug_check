package com.bug_check_background.controller;

import com.bug_check_background.pojo.dto.BugDto;
import com.bug_check_background.pojo.entity.Num;
import com.bug_check_background.common.result.PageResult;
import com.bug_check_background.common.result.Result;
import com.bug_check_background.pojo.vo.ConditionVo;
import com.bug_check_background.service.BugService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@Slf4j
@RequestMapping("/bug")
@Api(tags = "Bug管理")
@Validated
public class BugController {
    @Autowired
    BugService bugService;

    @GetMapping("/selectBug")
    @ApiOperation(value = "查询bug信息")
    public Result<PageResult> selectBug(@Validated BugDto bugDto) {
        PageResult pageResult = bugService.selectBug(bugDto);
        return Result.success(pageResult);
    }

    @GetMapping("selectCondition")
    @ApiOperation(value = "查询条件列表")
    public Result<ConditionVo> selectCondition() {
        return Result.success(bugService.selectCondition());
    }

    @GetMapping("/selectNum")
    @ApiOperation(value = "查询各种数量")
    public Result<Num> selectNum() {
        return Result.success(bugService.selectNum());
    }
}
