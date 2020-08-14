package com.tam.siap.repos;

import com.tam.siap.models.JLayanan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JLayananRepository extends JpaRepository<JLayanan, String>{

    List<JLayanan> findAll();

    JLayanan findById(int id);
}
