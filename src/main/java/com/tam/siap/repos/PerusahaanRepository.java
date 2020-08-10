package com.tam.siap.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tam.siap.models.Perusahaan;

@Repository
public interface PerusahaanRepository extends JpaRepository<Perusahaan, Long>{

}
