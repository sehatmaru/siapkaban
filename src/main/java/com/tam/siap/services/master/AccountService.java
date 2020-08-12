package com.tam.siap.services.master;

import com.tam.siap.models.Account;
import com.tam.siap.models.Role;
import com.tam.siap.repos.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.tam.siap.utils.refs.Status.ACTIVE;

@Service
public class AccountService {

    @Autowired
    AccountRepository accountRepository;

    public boolean isAccountExist(String username, Role role) {
        return accountRepository.findByUsernameAndRole(username, role) != null;
    }

    public boolean isAccountExist(String username, String password){
        return accountRepository.findByUsernameAndPassword(username, password) != null;
    }

    public boolean isAccountActive(String username) {
        return accountRepository.findByUsernameAndStatus(username, ACTIVE) != null;
    }

    public Account findByUsername(String username){
        return accountRepository.findByUsername(username);
    }

    public void save(Account account){
        accountRepository.save(account);
    }
}
