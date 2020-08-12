package com.tam.siap.repos;

import com.tam.siap.models.Account;
import com.tam.siap.models.DPerusahaan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DPerusahaanRepository extends JpaRepository<DPerusahaan, String>{
    DPerusahaan findByAccount(Account account);
}
