package com.tam.siap.services;

import com.tam.siap.models.*;
import com.tam.siap.repos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegisterService {

    @Autowired
    DPribadiRepository dPribadiRepository;

    @Autowired
    DPerusahaanRepository dPerusahaanRepository;

    @Autowired
    AccountRepository accountRepository;

    @Autowired
    JPerusahaanRepository jPerusahaanRepository;

    @Autowired
    JIdentitasRepository jIdentitasRepository;

    @Autowired
    RoleRepository roleRepository;

    public boolean isAccountExist(String username, Role role) {
        return accountRepository.findByUsernameAndRole(username, role) != null;
    }

    public boolean isDataPerusahaanExist(Account account) {
        return dPerusahaanRepository.findByAccount(account) != null;
    }

    public boolean isDataPribadiExist(Account account) {
        return dPribadiRepository.findByAccount(account) != null;
    }

    public boolean isAccountActive(String username, Role role) {
        return accountRepository.findByUsernameAndRoleAndStatus(username, role, 1) != null;
    }

    public int register(Account account, DPribadi dPribadi, DPerusahaan dPerusahaan){
        int result = 1;

        if (!isAccountExist(account.getUsername(), account.getRole())){
            if (addUser(account) == 0){
                if (addDataPribadi(account.getUsername(), dPribadi) == 0){
                    if (addDataPerusahaan(account.getUsername(), dPerusahaan) == 0) result = 0;
                }
            }
        }

        return result;
    }

    private int addUser(Account account){
        account.setStatus(2);

        accountRepository.save(account);

        if (isAccountExist(account.getUsername(), account.getRole())) return 0;
        else return 1;
    }

    private int addDataPribadi(String accountname, DPribadi dPribadi){
        Account account = accountRepository.findByUsername(accountname);
        dPribadi.setUser(account);

        dPribadiRepository.save(dPribadi);

        if (isDataPribadiExist(account)) return 0;
        else return 1;
    }

    private int addDataPerusahaan(String accountname, DPerusahaan dPerusahaan){
        Account account = accountRepository.findByUsername(accountname);
        dPerusahaan.setUser(account);

        dPerusahaanRepository.save(dPerusahaan);

        if (isDataPerusahaanExist(account)) return 0;
        else return 1;
    }
}
