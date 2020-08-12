package com.tam.siap.repos;

import com.tam.siap.models.Role;
import com.tam.siap.models.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRepository extends JpaRepository<Account, String>{
	Account findByUsername(String username);

	Account findByUsernameAndStatus(String username, int status);

	Account findByUsernameAndRole(String username, Role role);

	Account findByUsernameAndRoleAndStatus(String username, Role role, int status);

	Account findByUsernameAndPassword(String username, String password);
}
