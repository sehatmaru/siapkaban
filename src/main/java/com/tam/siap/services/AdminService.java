package com.tam.siap.services;

import com.tam.siap.models.Account;
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

import static com.tam.siap.utils.refs.Status.PENDING;
import static com.tam.siap.utils.refs.Status.REJECTED;

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

    private List<Account> getPendingAccountList(){
        return accountService.findByStatus(PENDING);
    }

    private List<Account> getRejectedAccountList(){
        return accountService.findByStatus(REJECTED);
    }
}
