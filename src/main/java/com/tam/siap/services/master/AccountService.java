package com.tam.siap.services.master;

import com.tam.siap.models.Account;
import com.tam.siap.models.Role;
import com.tam.siap.repos.AccountRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.tam.siap.utils.refs.Status.*;

@Service
public class AccountService {

    @Autowired
    AccountRepository accountRepository;

    public boolean isAccountExist(String username, Role role) {
        return accountRepository.findByUsernameAndRole(username, role) != null;
    }

    public boolean isAccountExist(String username) {
        return accountRepository.findByUsername(username) != null;
    }

    public boolean isAccountExist(String username, String password){
        return accountRepository.findByUsernameAndPassword(username, password) != null;
    }

    public boolean isAccountActive(String username) {
        return accountRepository.findByUsernameAndStatus(username, ACTIVE) != null;
    }

    public boolean isAccountPending(String username) {
        return accountRepository.findByUsernameAndStatus(username, PENDING) != null;
    }

    public boolean isAccountRejected(String username) {
        return accountRepository.findByUsernameAndStatus(username, REJECTED) != null;
    }

    public boolean isAccountInactive(String username) {
        return accountRepository.findByUsernameAndStatus(username, INACTIVE) != null;
    }

    public Account findByUsername(String username){
        return accountRepository.findByUsername(username);
    }

    public Account findByRole(Role role){
        return accountRepository.findByRole(role);
    }

    public Account findByRoleAndLokasi(Role role, int lokasi){
        return accountRepository.findByRoleAndLokasi(role, lokasi);
    }

    public List<Account> findAllByRoleAndLokasi(Role role, int lokasi){
        return accountRepository.findAllByRoleAndLokasi(role, lokasi);
    }

    public List<Account> findAllByRole(Role role){
        return accountRepository.findAllByRole(role);
    }

    public Account findById(String id){
        return accountRepository.findById(Integer.parseInt(id));
    }

    public List<Account> findByStatus(int status){
        return accountRepository.findByStatus(status);
    }

    public List<Account> getAccountList(Role role, int lokasi){
        return accountRepository.findByRoleAndLokasiAndStatus(role, lokasi, ACTIVE);
    }
    public List<Account> getAccountList(Role role){
        return accountRepository.findByRoleAndStatus(role, ACTIVE);
    }

    public void save(Account account){
        accountRepository.save(account);
    }

}
