package com.edu.roy.wx;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class EduApplication {
	static {
		if (null == System.getProperty("spring.profiles.active")) {
			System.setProperty("spring.profiles.active", "dev");
		}
	}

	public static void main(String[] args) {
		SpringApplication.run(EduApplication.class, args);
	}
}
