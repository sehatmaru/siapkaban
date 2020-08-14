package com.tam.siap.repos;

import com.tam.siap.models.JPengelola;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JPengelolaRepository extends JpaRepository<JPengelola, String>{

    List<JPengelola> findAll();

    JPengelola findById(int id);
}
