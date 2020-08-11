package com.tam.siap.services;

import com.tam.siap.models.DPerusahaan;
import com.tam.siap.models.DPribadi;
import com.tam.siap.models.User;
import com.tam.siap.repos.DPerusahaanRepository;
import com.tam.siap.repos.DPribadiRepository;
import com.tam.siap.repos.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RegisterService {

    @Autowired
    DPribadiRepository dPribadiRepository;

    @Autowired
    DPerusahaanRepository dPerusahaanRepository;

    @Autowired
    UserRepository userRepository;

    public boolean isUserExist(String username, int role) {
        return userRepository.findByUsernameAndRole(username, role) != null;
    }

    public boolean isUserActive(String username, int role) {
        return userRepository.findByUsernameAndRoleAndStatus(username, role, 1) != null;
    }

    public void register(User user, DPribadi dPribadi, DPerusahaan dPerusahaan){
        addUser(user);
        addDataPribadi(dPribadi);
        addDataPerusahaan(dPerusahaan);
    }

    private void addUser(User user){
        userRepository.save(user);
    }

    private void addDataPribadi(DPribadi dPribadi){
        dPribadiRepository.save(dPribadi);
    }

    private void addDataPerusahaan(DPerusahaan dPerusahaan){
        dPerusahaanRepository.save(dPerusahaan);
    }
}
