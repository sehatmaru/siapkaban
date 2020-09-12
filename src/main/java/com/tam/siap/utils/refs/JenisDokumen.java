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

    int BA_PEMERIKSAAN_LOKASI = 295;
    int NOTA_DINAS = 296;
    int SURAT_REKOMENDASI = 297;
    int SURAT_PENGEMBALIAN_BERKAS = 298;

}

