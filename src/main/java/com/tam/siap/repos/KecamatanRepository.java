package com.tam.siap.repos;

import com.tam.siap.models.Kabupaten;
import com.tam.siap.models.Kecamatan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface KecamatanRepository extends JpaRepository<Kecamatan, String>{

    List<Kecamatan> findByKabupaten(Kabupaten kabupaten);
}
