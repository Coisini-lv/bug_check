package com.bug_check_background.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.bug_check_background.mapper.BugMapper;
import com.bug_check_background.pojo.dto.BugDto;
import com.bug_check_background.pojo.entity.BugInfo;
import com.bug_check_background.pojo.result.PageResult;
import com.bug_check_background.service.BugService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class BugServiceImpl implements BugService {
    @Autowired
    private BugMapper bugMapper;

    @Override
    public PageResult selectBug(BugDto bugDto) {
        LambdaQueryWrapper<BugInfo> lambdaQueryWrapper = new LambdaQueryWrapper<>();

        //按照标题查询
        String title = bugDto.getTitle();
        if (title != null && !title.isEmpty()) {
            lambdaQueryWrapper.like(BugInfo::getTitle, title);
        }

        //按照项目查询
        String project = bugDto.getProject();
        if (project != null && !project.isEmpty()) {
            lambdaQueryWrapper.like(BugInfo::getProject, project);
        }

        //按照扫描工具查询
        Integer scanner = bugDto.getScanner();
        if (scanner != null) {
            lambdaQueryWrapper.eq(BugInfo::getScanner, scanner);
        }

        //按照级别查询
        Integer level = bugDto.getLevel();
        if (level != null) {
            lambdaQueryWrapper.eq(BugInfo::getLevel, level);
        }

        String description = bugDto.getDescription();
        LocalDate publishDate = bugDto.getPublishDate();
        if (publishDate != null) {
            lambdaQueryWrapper.eq(BugInfo::getPublishDate, publishDate);
        }


        String cve = bugDto.getCve();
        if (cve != null && !cve.isEmpty()) {
            lambdaQueryWrapper.like(BugInfo::getCve, cve);
        }

        String type = bugDto.getType();
        if (type != null && !type.isEmpty()) {
            lambdaQueryWrapper.like(BugInfo::getType, type);
        }

        String ecosystem = bugDto.getEcosystem();
        if (ecosystem != null && !ecosystem.isEmpty()) {
            lambdaQueryWrapper.like(BugInfo::getEcosystem, ecosystem);
        }

        String cwe = bugDto.getCwe();
        if (cwe != null && !cwe.isEmpty()) {
            lambdaQueryWrapper.like(BugInfo::getCwe, cwe);
        }

        String cvss = bugDto.getCvss();
        if (cvss != null && !cvss.isEmpty()) {
            lambdaQueryWrapper.like(BugInfo::getCvss, cvss);
        }

        String credit = bugDto.getCredit();
        if (credit != null && !credit.isEmpty()) {
            lambdaQueryWrapper.like(BugInfo::getCredit, credit);
        }

        Double grade = bugDto.getGrade();
        if (grade != null) {
            lambdaQueryWrapper.eq(BugInfo::getGrade, grade);
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
}
