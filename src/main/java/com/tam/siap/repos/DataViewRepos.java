package com.tam.siap.repos;

import com.tam.siap.models.Layanan;
import com.tam.siap.models.responses.LayananResponse;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DataViewRepos extends JpaRepository<Layanan, String> {

}
