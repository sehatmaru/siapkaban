package com.tam.siap.services;

import com.tam.siap.models.Role;
import com.tam.siap.repos.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleService {

    @Autowired
    RoleRepository roleRepository;

    public Role getRole(int id){ return roleRepository.findById(id); }

}
