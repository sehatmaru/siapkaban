package com.tam.siap.utils.refs;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Documented
@Retention(RetentionPolicy.SOURCE)
public @interface StatusLayanan {
    int ACCEPTED = 1;
    int ON_PROGRESS = 2;
    int REJECTED = 3;
}

