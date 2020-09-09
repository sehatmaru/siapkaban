package com.tam.siap.utils.refs;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Documented
@Retention(RetentionPolicy.SOURCE)
public @interface Role {
    int PEMOHON = 1;
    int ADMIN = 2;
    int PENERIMA_DOKUMEN = 3;
    int PEMERIKSA_P2 = 4;
    int PEMERIKSA_PERBEND = 5;
    int PEMERIKSA_PKC = 6;
    int KEPALA_SEKSI_P2 = 7;
    int KEPALA_SEKSI_PERBEND = 8;
    int KEPALA_SEKSI_PKC = 9;
    int KEPALA_SUB_SEKSI_P2 = 10;
    int KEPALA_SUB_SEKSI_PERBEND = 11;
    int KEPALA_SUB_SEKSI_PKC = 12;
    int KEPALA_KANTOR = 13;
    int KANWIL_PENERIMA_DOKUMEN = 14;
    int KANWIL_PEMERIKSA_P2 = 15;
    int KANWIL_KEPALA_SEKSI_INTELIJEN = 16;
    int KANWIL_KEPALA_BIDANG_P2 = 17;
    int KANWIL_KEPALA_KANTOR = 18;
    int KANWIL_KEPALA_BIDANG_FASILITAS = 19;
    int KANWIL_KEPALA_SEKSI_PF = 20;
    int KANWIL_PEMERIKSA_DOKUMEN = 21;
    int KANWIL_KEPALA_BIDANG_PKC = 22;
    int KANWIL_KEPALA_SEKSI_PKC = 23;
    int KANWIL_PEMERIKSA_PKC = 24;
}

