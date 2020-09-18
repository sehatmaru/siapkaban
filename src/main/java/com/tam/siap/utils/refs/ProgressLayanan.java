package com.tam.siap.utils.refs;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Documented
@Retention(RetentionPolicy.SOURCE)
public @interface ProgressLayanan {
    int ON_BATCH_1_KPPBC = 1;
    int ON_BATCH_2_KPPBC = 2;
    int ON_BATCH_1_KANWIL = 3;
    int ON_BATCH_2_KANWIL = 4;
    int ON_BATCH_3_KANWIL = 5;
    int COMPLETE = 6;
}

