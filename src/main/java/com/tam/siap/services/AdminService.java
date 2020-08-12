package com.tam.siap.services;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPerusahaan;
import com.tam.siap.models.responses.AccountListResponse;
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

    public List<AccountListResponse> getUnverifiedAccountList(){
        List<AccountListResponse> result = new ArrayList<>();
        List<Account> accounts = Stream.of(getPendingAccountList(), getRejectedAccountList())
                .flatMap(Collection::stream)
                .collect(Collectors.toList());

        for (Account account : accounts) {
            AccountListResponse acc = new AccountListResponse();
            acc.setAccount(account);
            acc.setDataPerusahaan(dataPerusahaanService.findDataPerusahaanByAccount(account));
            acc.setDataPribadi(dataPribadiService.findDataPribadiByAccount(account));

            result.add(acc);
        }

        return result;
    }

    public int respondAccount(String username, int status) {
        int result = FAILED;

        if (accountService.isAccountExist(username)) {
            Account account = accountService.findByUsername(username);

            switch (status){
                case 1 :
                    if (dataPerusahaanService.isDataPerusahaanExist(account)) {
                        DPerusahaan dPerusahaan = dataPerusahaanService.findDataPerusahaanByAccount(account);
                        dPerusahaan.setStatus(ACTIVE);

                        dataPerusahaanService.save(dPerusahaan);

                        account.setStatus(ACTIVE);
                        accountService.save(account);

                        if (accountService.isAccountActive(username) &&
                                dataPerusahaanService.isDataPerusahaanActive(account)) result = SUCCESS;
                    }
                    break;
                case 2 :
                    if (dataPerusahaanService.isDataPerusahaanExist(account)) {
                        DPerusahaan dPerusahaan = dataPerusahaanService.findDataPerusahaanByAccount(account);
                        dPerusahaan.setStatus(PENDING);

                        dataPerusahaanService.save(dPerusahaan);

                        account.setStatus(PENDING);
                        accountService.save(account);

                        if (accountService.isAccountPending(username) &&
                                dataPerusahaanService.isDataPerusahaanPending(account)) result = SUCCESS;
                    }
                    break;

                case 3 :
                    if (dataPerusahaanService.isDataPerusahaanExist(account)) {
                        DPerusahaan dPerusahaan = dataPerusahaanService.findDataPerusahaanByAccount(account);
                        dPerusahaan.setStatus(INACTIVE);

                        dataPerusahaanService.save(dPerusahaan);

                        account.setStatus(INACTIVE);
                        accountService.save(account);

                        if (accountService.isAccountInactive(username) &&
                                dataPerusahaanService.isDataPerusahaanInactive(account)) result = SUCCESS;
                    }
                    break;
                case 4 :
                    if (dataPerusahaanService.isDataPerusahaanExist(account)) {
                        DPerusahaan dPerusahaan = dataPerusahaanService.findDataPerusahaanByAccount(account);
                        dPerusahaan.setStatus(REJECTED);

                        dataPerusahaanService.save(dPerusahaan);

                        account.setStatus(REJECTED);
                        accountService.save(account);

                        if (accountService.isAccountRejected(username) &&
                                dataPerusahaanService.isDataPerusahaanRejected(account)) result = SUCCESS;
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
