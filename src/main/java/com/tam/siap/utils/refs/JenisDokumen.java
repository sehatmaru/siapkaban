package com.tam.siap.utils.refs;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Documented
@Retention(RetentionPolicy.SOURCE)
public @interface JenisDokumen {
    String PERMOHONAN = "Permohonan";
    String PERSYARATAN = "Persyaratan";
    String LAINNYA = "Lainnya";

}

