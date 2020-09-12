package com.tam.siap.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tam.siap.models.Role;

@Repository
public interface RoleRepository extends JpaRepository<Role, String>{
    Role findById(int id);

}
