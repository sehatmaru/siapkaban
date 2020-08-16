package com.tam.siap.repos;

import com.tam.siap.models.JDokumen;
import com.tam.siap.models.JPerusahaan;
import com.tam.siap.models.SJLayanan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JDokumenRepository extends JpaRepository<JDokumen, String>{

    List<JDokumen> findAll();

    JDokumen findById(int id);
    
    List<JDokumen> findBySubLayanan(SJLayanan subLayanan);
}
