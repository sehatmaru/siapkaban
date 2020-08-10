package com.tam.siap.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tam.siap.models.SyaratAdministrasi;

@Repository
public interface SyaratAdministrasiRepository extends JpaRepository<SyaratAdministrasi, Long> {

	List<SyaratAdministrasi> findBySubjenislayananidOrderBySeq(@Param("subjenislayananid") long subjenislayananid);
}
