package com.tam.siap.utils.refs;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Documented
@Retention(RetentionPolicy.SOURCE)
public @interface JenisEmail {

    int EMAIL_REGISTRASI = 1;
    int EMAIL_ACCOUNT = 2;
    int EMAIL_PENOLAKAN = 3;

}

