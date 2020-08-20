package com.tam.siap.repos;

import com.tam.siap.models.Account;
import com.tam.siap.models.Dokumen;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DokumenRepository extends JpaRepository<Dokumen, String>{
	Dokumen findByNamaDokumen(String namaDokumen);

	Dokumen findByNamaDokumenAndStatus(String namaDokumen, int status);

	Dokumen findByIdAndStatus(int id, int status);

	List<Dokumen> findByPemohon(Account pemohon);

	List<Dokumen> findByPemohonAndStatus(Account account, int status);
}
