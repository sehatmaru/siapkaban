package com.tam.siap.repos;

import com.tam.siap.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User, String>{
	User findByUsername(String username);

	User findByUsernameAndRole(String username, int role);

	User findByUsernameAndRoleAndStatus(String username, int role, int status);
}
