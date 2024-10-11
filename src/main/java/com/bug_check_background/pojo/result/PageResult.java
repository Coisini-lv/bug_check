package com.bug_check_background.pojo.result;

import com.bug_check_background.pojo.entity.BugInfo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageResult {
    private long total;
    private List records;
}
