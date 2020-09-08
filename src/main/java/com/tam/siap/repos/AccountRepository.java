package com.tam.siap.repos;

import com.tam.siap.models.Role;
import com.tam.siap.models.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AccountRepository extends JpaRepository<Account, String>{
	Account findById(int id);

	Account findByUsername(String username);

	Account findByRoleAndLokasi(Role role, int lokasi);

	List<Account> findAllByRoleAndLokasi(Role role, int lokasi);

	Account findByUsernameAndStatus(String username, int status);

	Account findByUsernameAndRole(String username, Role role);

	Account findByUsernameAndRoleAndStatus(String username, Role role, int status);

	Account findByUsernameAndPassword(String username, String password);

	List<Account> findByStatus(int status);

	List<Account> findByRoleAndLokasiAndStatus(Role role, int lokasi, int status);

	List<Account> findByRoleAndStatus(Role role, int status);
}
