package com.gd774.effic;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.gd774.effic.mapper")
@SpringBootApplication
public class EfficApplication {

	public static void main(String[] args) {
		SpringApplication.run(EfficApplication.class, args);
	}

}
