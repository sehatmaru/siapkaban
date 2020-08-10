package com.tam.siap.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tam.siap.models.JenisLayanan;

@Repository
public interface JenisLayananRepository extends JpaRepository<JenisLayanan, Long>{

}
