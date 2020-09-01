package com.tam.siap.services.master;

import com.tam.siap.models.JDokumen;
import com.tam.siap.models.Role;
import com.tam.siap.models.SJLayanan;
import com.tam.siap.repos.JDokumenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JenisDokumenService {

    @Autowired
    JDokumenRepository jDokumenRepository;

    public List<JDokumen> findAllJenisDokumen(){
        return jDokumenRepository.findAll();
    }

    public JDokumen getJenisDokumen(int id){ return jDokumenRepository.findById(id); }

    public List<JDokumen> findJenisDokumen(SJLayanan subLayanan) {
        return jDokumenRepository.findBySubLayanan(subLayanan);
    }

    public List<JDokumen> findJenisDokumenByRoleAndStatus(Role role, int status) {
        return jDokumenRepository.findByRoleAndStatus(role, status);
    }
}
