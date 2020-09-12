package com.tam.siap.repos;

import com.tam.siap.models.JPerusahaan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JPerusahaanRepository extends JpaRepository<JPerusahaan, String>{

    List<JPerusahaan> findAll();

    JPerusahaan findById(int id);
}
