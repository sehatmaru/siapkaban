package com.tam.siap.repos;

import com.tam.siap.models.Account;
import com.tam.siap.models.Dokumen;
import com.tam.siap.models.JDokumen;
import com.tam.siap.models.Layanan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DokumenRepository extends JpaRepository<Dokumen, String>{
	Dokumen findByNamaDokumen(String namaDokumen);

	Dokumen findByJenisDokumenAndLayanan(JDokumen dokumen, Layanan layanan);

	Dokumen findByNamaDokumenAndStatus(String namaDokumen, int status);

	Dokumen findByIdAndStatus(int id, int status);

	List<Dokumen> findByPemohon(Account pemohon);

	List<Dokumen> findByPemohonAndStatus(Account account, int status);

	List<Dokumen> findByLayanan(Layanan layanan);
}
