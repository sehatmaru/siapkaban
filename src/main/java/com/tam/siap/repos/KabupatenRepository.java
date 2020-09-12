package com.tam.siap.repos;

import com.tam.siap.models.Kabupaten;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface KabupatenRepository extends JpaRepository<Kabupaten, String>{
}
