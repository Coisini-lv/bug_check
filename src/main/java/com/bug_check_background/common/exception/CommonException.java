package com.bug_check_background.common.exception;

import lombok.*;


public class CommonException extends BaseException{


    @Setter
    @Getter
    String msg;

    public CommonException(String msg) {
        super(msg);
        this.msg = msg;
    }
}
