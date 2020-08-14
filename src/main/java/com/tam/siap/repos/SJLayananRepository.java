package com.tam.siap.repos;

import com.tam.siap.models.SJLayanan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SJLayananRepository extends JpaRepository<SJLayanan, String>{

    List<SJLayanan> findAll();

    SJLayanan findById(int id);
}
