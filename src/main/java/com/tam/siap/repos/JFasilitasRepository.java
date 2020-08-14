package com.tam.siap.repos;

import com.tam.siap.models.JFasilitas;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JFasilitasRepository extends JpaRepository<JFasilitas, String>{

    List<JFasilitas> findAll();

    JFasilitas findById(int id);
}
