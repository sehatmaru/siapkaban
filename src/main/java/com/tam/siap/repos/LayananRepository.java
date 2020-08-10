package com.tam.siap.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tam.siap.models.Layanan;

@Repository
public interface LayananRepository extends JpaRepository<Layanan, Long>{

	@Query("SELECT l FROM Layanan l WHERE l.perusahaanid = :perusahaanid ORDER BY l.tanggal DESC ")
	List<Layanan> findLayananPerusahaan(@Param("perusahaanid") long perusahaanid);
	
	@Query("SELECT l FROM Layanan l WHERE l.status = :status ORDER BY l.tanggal DESC ")
	List<Layanan> findBCPicInbox(@Param("status") String status);
	
	@Query("SELECT l FROM Layanan l WHERE l.status = :status AND l.picstafid IS NULL ORDER BY l.tanggal DESC ")
	List<Layanan> findPendokInbox(@Param("status") String status);
	
	@Query("SELECT l FROM Layanan l WHERE (l.status = :status AND l.picstafid = :picstafid ) OR l.status = 'baru' ORDER BY l.tanggal DESC ")
	List<Layanan> findBCPicStafInbox(@Param("status") String status, @Param("picstafid") long picstafid);
	
	List<Layanan> findAllByOrderByTanggalDesc();
	
}
