package com.tam.siap.repos;

import com.tam.siap.models.JIdentitas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JIdentitasRepository extends JpaRepository<JIdentitas, String>{

    List<JIdentitas> findAll();

    JIdentitas findById(int id);
}
