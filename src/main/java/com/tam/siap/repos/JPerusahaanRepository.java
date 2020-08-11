package com.tam.siap.repos;

import com.tam.siap.models.JPerusahaan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JPerusahaanRepository extends JpaRepository<JPerusahaan, String>{
	
}
