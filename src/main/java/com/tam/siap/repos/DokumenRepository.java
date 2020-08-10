package com.tam.siap.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tam.siap.models.Dokumen;

public interface DokumenRepository extends JpaRepository<Dokumen, Long>{


	@Query("SELECT d FROM Dokumen d WHERE d.layananid = :layananid ORDER BY d.seq ASC ")
	List<Dokumen> findDokLayanan(@Param("layananid") long layananid);
	
}
