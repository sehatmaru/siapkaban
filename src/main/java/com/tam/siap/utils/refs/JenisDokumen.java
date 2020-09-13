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

    int UNDANGAN_PEMAPARAN = 303;
    int NOTA_DINAS_UNDANGAN_PEMAPARAN = 304;
    int BA_PEMAPARAN = 305;
    int SKEP_PEMERIKSA_DOKUMEN = 306;
    int SURAT_PENOLAKAN_PEMERIKSA_DOKUMEN = 307;
    int TELAAH = 308;
    int NOTA_DINAS_PEMERIKSA_DOKUMEN = 309;
    int NOTA_DINAS_PEMERIKSA_PKC = 310;
    int SKEP_PEMERIKSA_PKC = 311;
    int SURAT_PENOLAKAN_PEMERIKSA_PKC = 307;

}

