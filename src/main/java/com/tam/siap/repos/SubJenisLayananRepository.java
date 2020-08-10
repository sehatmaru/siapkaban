package com.tam.siap.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tam.siap.models.SubJenisLayanan;

@Repository
public interface SubJenisLayananRepository extends JpaRepository<SubJenisLayanan, Long>{

	@Query("SELECT sjl FROM SubJenisLayanan sjl WHERE sjl.jenisperusahaanid = :jenisperusahaanid AND sjl.jenislayananid = :jenislayananid")
	List<SubJenisLayanan> findByJenisPerusahaanDanJenisLayanan(@Param("jenisperusahaanid") long jenisperusahaanid, @Param("jenislayananid") long jenislayananid);
}
