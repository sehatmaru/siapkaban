package com.tam.siap.repos;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.tam.siap.models.Pic;


@Repository
public interface PicRepository extends JpaRepository<Pic, Long>{
	
	@Query("SELECT p FROM Pic p WHERE p.nipuser = :nipuser ")
	Pic findByNipuser(@Param("nipuser") String nipuser);
	
	
	
	Pic findByUsername(@Param("username") String username);
	
	List<Pic> findByJenispic(@Param("jenispic") String jenispic);
	
	@Query("SELECT p FROM Pic p WHERE p.jabatanid = :jabatanid ")
	List<Pic> findSuperiorByJenisjabatanid(@Param("jabatanid") long jabatanid);

}
