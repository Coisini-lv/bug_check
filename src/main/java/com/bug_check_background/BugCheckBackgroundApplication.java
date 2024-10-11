package com.bug_check_background;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication()
@MapperScan("com.bug_check_background.mapper")
public class BugCheckBackgroundApplication {

    public static void main(String[] args) {
        SpringApplication.run(BugCheckBackgroundApplication.class, args);
    }

}
