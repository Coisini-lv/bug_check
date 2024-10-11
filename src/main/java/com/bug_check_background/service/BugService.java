package com.bug_check_background.service;

import com.bug_check_background.pojo.dto.BugDto;
import com.bug_check_background.pojo.entity.BugInfo;
import com.bug_check_background.pojo.result.PageResult;

import java.util.List;

public interface BugService {

    PageResult selectBug(BugDto bugDto);
}
