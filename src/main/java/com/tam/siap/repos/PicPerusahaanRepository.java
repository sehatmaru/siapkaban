package com.tam.siap.repos;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tam.siap.models.PicPerusahaan;

@Repository
public interface PicPerusahaanRepository extends JpaRepository<PicPerusahaan, Long>{
	
	@Query("SELECT p FROM PicPerusahaan p WHERE ktp = :ktp")
	PicPerusahaan findByKTP(@Param("ktp") String ktp); 
	
	@Query("SELECT p FROM PicPerusahaan p WHERE id = :id")
	Optional<PicPerusahaan> findByUserid(@Param("id") long userid);
}
