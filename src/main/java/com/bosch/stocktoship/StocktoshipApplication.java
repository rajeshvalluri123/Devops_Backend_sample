package com.bosch.stocktoship;

import java.sql.SQLException;
import java.util.Scanner;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.boot.builder.SpringApplicationBuilder;


import com.bosch.stocktoship.exception.InvalidIntegerException;
import com.bosch.stocktoship.exception.InvalidItemCodeException;



@SpringBootApplication
public class StocktoshipApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(StocktoshipApplication.class, args);
	}

	@Override
    	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        	return application.sources(StocktoshipApplication.class);
    	}

}
