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

    public boolean isUserExist(String username, Role role) {
        return accountRepository.findByUsernameAndRole(username, role) != null;
    }

    public boolean isUserActive(String username, Role role) {
        return accountRepository.findByUsernameAndRoleAndStatus(username, role, 1) != null;
    }

    public void register(Account account, DPribadi dPribadi, DPerusahaan dPerusahaan){
        if (!isUserExist(account.getUsername(), account.getRole())){
            addUser(account);
            addDataPribadi(account.getUsername(), dPribadi);
            addDataPerusahaan(account.getUsername(), dPerusahaan);
        }
    }

    private void addUser(Account account){
        account.setStatus(2);
        accountRepository.save(account);
    }

    private void addDataPribadi(String accountname, DPribadi dPribadi){
        Account account = accountRepository.findByUsername(accountname);
        dPribadi.setUser(account);

        dPribadiRepository.save(dPribadi);
    }

    private void addDataPerusahaan(String accountname, DPerusahaan dPerusahaan){
        Account account = accountRepository.findByUsername(accountname);
        dPerusahaan.setUser(account);

        dPerusahaanRepository.save(dPerusahaan);
    }
}
