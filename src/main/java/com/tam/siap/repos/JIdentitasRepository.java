package com.tam.siap.repos;

import com.tam.siap.models.JIdentitas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface JIdentitasRepository extends JpaRepository<JIdentitas, String>{
	
}
