package com.tam.siap.repos;

import com.tam.siap.models.DPerusahaan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DPerusahaanRepository extends JpaRepository<DPerusahaan, String>{
    DPerusahaan findByNpwp(String npwp);

    DPerusahaan findByNpwpAndStatus(String npwp, int status);

    DPerusahaan findById(int id);
}
