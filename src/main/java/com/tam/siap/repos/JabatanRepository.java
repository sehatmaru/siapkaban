package com.tam.siap.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tam.siap.models.Jabatan;

@Repository
public interface JabatanRepository extends JpaRepository<Jabatan, Long>{
	
}
