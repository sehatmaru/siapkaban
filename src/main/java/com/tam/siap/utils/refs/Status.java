package com.tam.siap.utils.refs;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Documented
@Retention(RetentionPolicy.SOURCE)
public @interface Status{
    int ACTIVE = 1;
    int PENDING = 2;
    int INACTIVE = 3;
    int REJECTED = 4;

    int SUCCESS = 0;
    int FAILED = 1;
    int DOC_NOT_FOUND = 2;
}

