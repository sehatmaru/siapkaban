package com.tam.siap.repos;

import com.tam.siap.models.DPerusahaan;
import com.tam.siap.models.JPerusahaan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DPerusahaanRepository extends JpaRepository<DPerusahaan, String>{
    DPerusahaan findByNpwp(String npwp);

    DPerusahaan findByNpwpAndStatus(String npwp, int status);

    List<DPerusahaan> findByJenis(JPerusahaan perusahaan);

    DPerusahaan findById(int id);
}
