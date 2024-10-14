package com.bug_check_background.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bug_check_background.common.exception.CommonException;
import com.bug_check_background.mapper.BugMapper;
import com.bug_check_background.pojo.dto.BugDto;
import com.bug_check_background.pojo.entity.BugInfo;
import com.bug_check_background.pojo.entity.Num;
import com.bug_check_background.common.result.PageResult;
import com.bug_check_background.pojo.vo.ConditionVo;
import com.bug_check_background.service.BugService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BugServiceImpl implements BugService {
    @Autowired
    private BugMapper bugMapper;

    @Override
    public PageResult selectBug(BugDto bugDto) {
        LambdaQueryWrapper<BugInfo> lambdaQueryWrapper = new LambdaQueryWrapper<>();

        //按照id查询
        Long id = bugDto.getId();
        if (id != null) {
            List<Long> allBugId= bugMapper.selectAllBugId();
            if (!allBugId.contains(id)) {
                throw new CommonException("id不存在");
            }
            lambdaQueryWrapper.eq(BugInfo::getId, id);
        }

        //按照类型查询
        List<String> typeList = bugDto.getTypeList();
        if (typeList != null && typeList.size() > 0) {
            lambdaQueryWrapper.in(BugInfo::getType, typeList);
        }

        //按照扫描工具查询
        List<Integer> scannerList = bugDto.getScannerList();
        if (scannerList != null && scannerList.size() > 0) {
            lambdaQueryWrapper.in(BugInfo::getScanner, scannerList);
        }

        //按照级别查询
        List<Integer> levelList = bugDto.getLevelList();
        if (levelList != null && levelList.size() > 0) {
            lambdaQueryWrapper.in(BugInfo::getLevel, levelList);
        }

        //按照生态系统查询
        List<String> ecosystemList = bugDto.getEcosystemList();
        if (ecosystemList != null && ecosystemList.size() > 0) {
            lambdaQueryWrapper.in(BugInfo::getEcosystem, ecosystemList);
        }

        //按照全局搜索查询
        String globalParam = bugDto.getGlobalParam();
        if (globalParam != null) {
            lambdaQueryWrapper.like(BugInfo::getTitle, globalParam)
                    .or().like(BugInfo::getProject, globalParam)
                    .or().like(BugInfo::getCve, globalParam)
                    .or().like(BugInfo::getType, globalParam)
                    .or().like(BugInfo::getEcosystem, globalParam)
                    .or().like(BugInfo::getCwe, globalParam)
                    .or().like(BugInfo::getCredit, globalParam);
        }

        //MyBatis分页查询
        Integer pageNum = bugDto.getPageNum();
        Integer pageSize = bugDto.getPageSize();
        //创建分页对象
        Page<BugInfo> page = new Page<>(pageNum, pageSize);
        //按照id降序排序
        lambdaQueryWrapper.orderByDesc(BugInfo::getId);
        bugMapper.selectPage(page, lambdaQueryWrapper);
        long total = page.getTotal();
        List<BugInfo> records = page.getRecords();
        return new PageResult(total, records);
    }

    @Override
    public ConditionVo selectCondition() {
        List<String> typeList = bugMapper.selectType();
        List<Integer> scannerList = bugMapper.selectScanner();
        List<Integer> levelList = bugMapper.selectLevel();
        List<String> ecosystemList = bugMapper.selectEcosystem();
        return ConditionVo.builder()
                .typeList(typeList)
                .scannerList(scannerList)
                .levelList(levelList)
                .ecosystemList(ecosystemList)
                .build();
    }

    @Override
    public Num selectNum() {
        Num num=bugMapper.selectNum();
        return num;
    }
}
