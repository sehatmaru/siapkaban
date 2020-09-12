package com.tam.siap.repos;

import com.tam.siap.models.DPribadi;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DPribadiRepository extends JpaRepository<DPribadi, String>{

    DPribadi findByNomor(String identitas);

    DPribadi findById(int id);
}
