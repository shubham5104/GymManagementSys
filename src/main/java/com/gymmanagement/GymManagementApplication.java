package com.gymmanagement;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.gymmanagement") 
public class GymManagementApplication {

	public static void main(String[] args) {
		SpringApplication.run(GymManagementApplication.class, args);
	}

}
