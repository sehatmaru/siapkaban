package com.tam.siap.services;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPerusahaan;
import com.tam.siap.services.master.AccountService;
import com.tam.siap.services.master.DataPerusahaanService;
import com.tam.siap.services.master.DataPribadiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static com.tam.siap.utils.refs.Status.*;

@Service
public class AdminService {

    @Autowired
    AccountService accountService;

    @Autowired
    DataPerusahaanService dataPerusahaanService;

    @Autowired
    DataPribadiService dataPribadiService;

    public List<Account> getUnverifiedAccountList(){
        return Stream.of(getPendingAccountList(), getRejectedAccountList())
                .flatMap(Collection::stream)
                .collect(Collectors.toList());
    }

    public int respondAccount(String username, int status) {
        int result = FAILED;

        if (accountService.isAccountExist(username)) {
            Account account = accountService.findByUsername(username);

            switch (status){
                case 1 :
                    if (dataPerusahaanService.isDataPerusahaanExist(account.getPerusahaan().getId())) {
                        DPerusahaan perusahaan = dataPerusahaanService.findDataPerusahaanById(account.getPerusahaan().getId());
                        perusahaan.setStatus(ACTIVE);
                        account.setStatus(ACTIVE);

                        accountService.save(account);
                        dataPerusahaanService.save(perusahaan);

                        if (accountService.isAccountActive(username) &&
                            dataPerusahaanService.isDataPerusahaanActive(account.getPerusahaan().getNpwp())) result = SUCCESS;
                    }
                    break;
                case 2 :
                    if (dataPerusahaanService.isDataPerusahaanExist(account.getPerusahaan().getId())) {
                        DPerusahaan perusahaan = dataPerusahaanService.findDataPerusahaanById(account.getPerusahaan().getId());
                        perusahaan.setStatus(PENDING);
                        account.setStatus(PENDING);

                        accountService.save(account);
                        dataPerusahaanService.save(perusahaan);

                        if (accountService.isAccountPending(username) &&
                                dataPerusahaanService.isDataPerusahaanPending(account.getPerusahaan().getNpwp())) result = SUCCESS;
                    }
                    break;

                case 3 :
                    if (dataPerusahaanService.isDataPerusahaanExist(account.getPerusahaan().getId())) {
                        DPerusahaan perusahaan = dataPerusahaanService.findDataPerusahaanById(account.getPerusahaan().getId());
                        perusahaan.setStatus(INACTIVE);
                        account.setStatus(INACTIVE);

                        accountService.save(account);
                        dataPerusahaanService.save(perusahaan);

                        if (accountService.isAccountInactive(username) &&
                                dataPerusahaanService.isDataPerusahaanInactive(account.getPerusahaan().getNpwp())) result = SUCCESS;
                    }
                    break;
                case 4 :
                    if (dataPerusahaanService.isDataPerusahaanExist(account.getPerusahaan().getId())) {
                        DPerusahaan perusahaan = dataPerusahaanService.findDataPerusahaanById(account.getPerusahaan().getId());
                        perusahaan.setStatus(REJECTED);
                        account.setStatus(REJECTED);

                        accountService.save(account);
                        dataPerusahaanService.save(perusahaan);

                        if (accountService.isAccountRejected(username) &&
                                dataPerusahaanService.isDataPerusahaanRejected(account.getPerusahaan().getNpwp())) result = SUCCESS;
                    }
                    break;
            }
        }

        return result;
    }

    private List<Account> getPendingAccountList(){
        return accountService.findByStatus(PENDING);
    }

    private List<Account> getRejectedAccountList(){
        return accountService.findByStatus(REJECTED);
    }
}
