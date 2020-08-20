package com.tam.siap.repos;

import com.tam.siap.models.*;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LayananRepository extends JpaRepository<Layanan, String>{

    List<Layanan> findAll();

    Layanan findById(int id);

    Layanan findByPemohononAndSubLayananAndTanggal(Account account, SJLayanan subLayanan, String tanggal);

}
