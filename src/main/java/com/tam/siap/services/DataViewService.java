package com.tam.siap.services;

import com.tam.siap.models.Account;
import com.tam.siap.models.Layanan;
import com.tam.siap.models.SJLayanan;
import com.tam.siap.models.responses.LayananResponse;
import com.tam.siap.repos.DataViewRepos;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.LayananService;
import com.tam.siap.services.master.SubJenisLayananService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

import static com.tam.siap.utils.refs.Status.FAILED;
import static com.tam.siap.utils.refs.Status.SUCCESS;

@Service
public class DataViewService {

    @Autowired
    LayananService layananService;

    @Autowired
    SubJenisLayananService subJenisLayananService;

    @Autowired
    AccountService accountService;

    @Autowired
    DataViewRepos dataViewRepos;



    public LayananResponse viewData(LayananResponse layananResponse) {
       /*
        if(accountService.isAccountExist(layananResponse.getAccount().getUsername())) {
            Account account = accountService.findByUsername(layananResponse.getAccount().getUsername());
            if (layananService.isLayananExist(layananResponse.getAccount(), layananResponse.getSjLayanan(), layananResponse.getLayanan().getTanggal())) {
                Layanan layanan2 = layananService.findLayananById(layananResponse.getLayanan().getId());


        */

        LayananResponse layanan = new LayananResponse();
        Layanan layanan1 = new Layanan();
        SJLayanan sjLayanan = new SJLayanan();

                /*

                layanan.getLayanan().getNomor();
                layanan.getSjLayanan().getKeterangan();
                layanan.getLayanan().getTanggal();
                layanan.getLayanan().getPemohonon().getPerusahaan().getNama();
                layanan.getLayanan().getPemohonon().getPerusahaan().getJenis();
                layanan.getLayanan().getPenerima();
                layanan.getLayanan().getPemeriksaP2();
                layanan.getLayanan().getPemeriksaPerbend();
                layanan.getLayanan().getPemeriksaPkc();
                layanan.getLayanan().getKsSeksiPkc();
                layanan.getLayanan().getKsSeksiPerbend();
                layanan.getLayanan().getKsSeksiP2();
                layanan.getLayanan().getkSeksiPkc();
                layanan.getLayanan().getkSeksiPerbend();
                layanan.getLayanan().getkSeksiP2();
                layanan.getLayanan().getkKantor();

                layananResponse.setLayanan(layanan.getLayanan());
                layananResponse.setSjLayanan(layanan.getSjLayanan());

                 */

        layanan1.setId(1);
        layanan.getLayanan().setNomor(layanan1.getNomor());
        layanan.getSjLayanan().setKeterangan(sjLayanan.getKeterangan());
        layanan.getLayanan().setTanggal(layanan1.getTanggal());
        layanan.getLayanan().getPemohonon().getPerusahaan().setNama(layanan1.getPemohonon().getPerusahaan().getNama());
        layanan.getLayanan().getPemohonon().getPerusahaan().setJenis(layanan1.getPemohonon().getPerusahaan().getJenis());
        layanan.getLayanan().setPenerima(layanan1.getPenerima());
        layanan.getLayanan().setTanggal(layanan1.getTanggal());
        layanan.getLayanan().setPemeriksaP2(layanan1.getPemeriksaP2());
        layanan.getLayanan().setPemeriksaPerbend(layanan1.getPemeriksaPerbend());
        layanan.getLayanan().setPemeriksaPkc(layanan1.getPemeriksaPkc());
        layanan.getLayanan().setKsSeksiPkc(layanan1.getKsSeksiPkc());
        layanan.getLayanan().setKsSeksiPerbend(layanan1.getKsSeksiPerbend());
        layanan.getLayanan().setKsSeksiP2(layanan1.getKsSeksiP2());
        layanan.getLayanan().setkSeksiPkc(layanan1.getkSeksiPkc());
        layanan.getLayanan().setkSeksiPerbend(layanan1.getkSeksiPerbend());
        layanan.getLayanan().setkSeksiP2(layanan1.getkSeksiP2());
        layanan.getLayanan().setkKantor(layanan1.getkKantor());

        layananService.findLayananById(1);
        subJenisLayananService.findAllSubJenisLayanan();

        System.out.println(layanan.toString());

                return layanan;

            }

}
