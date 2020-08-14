package com.tam.siap.repos;

import com.tam.siap.models.JPenimbunan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JPenimbunanRepository extends JpaRepository<JPenimbunan, String>{

    List<JPenimbunan> findAll();

    JPenimbunan findById(int id);
}
