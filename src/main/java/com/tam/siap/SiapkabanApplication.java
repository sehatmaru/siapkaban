package com.tam.siap;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
//@ComponentScan({"com.tam.siap","com.tam.siap.security"})
//@EntityScan("com.tam.siap.models")
//@ComponentScan({"com.tam.siap.security"})
//@EnableJpaRepositories("com.tam.siap.repos")
public class SiapkabanApplication {

	public static void main(String[] args) {
		SpringApplication.run(SiapkabanApplication.class, args);
	}

}
