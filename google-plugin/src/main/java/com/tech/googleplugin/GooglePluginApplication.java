package com.tech.googleplugin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.tech.gulimall.googleplugin.dao")
public class GooglePluginApplication {

	public static void main(String[] args) {
		SpringApplication.run(GooglePluginApplication.class, args);
	}

}
