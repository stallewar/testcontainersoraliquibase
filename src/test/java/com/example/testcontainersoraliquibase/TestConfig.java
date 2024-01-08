package com.example.testcontainersoraliquibase;

import javax.sql.DataSource;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
@Configuration
@TestConfiguration
public class TestConfig {

/*    @Bean(name = "oracleDataSource")
    public DataSource oracleDataSource() {
        return DataSourceBuilder
                .create()
                .url(
                        "jdbc:oracle:thin:@//"
                        + "127.0.0.1"
                        + ":"
                        + "1521"
                        + "/XE")
                
                .username("TSPLUS")
                .password("test")
                .driverClassName("oracle.jdbc.OracleDriver")
                .build();

    }*/
@Bean(name = "oracleDataSource")
public DataSource oracleDataSource() {
    DriverManagerDataSource oracleDataSource = new DriverManagerDataSource();
    oracleDataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
    oracleDataSource.setUrl("jdbc:oracle:thin:@localhost:1521");
    oracleDataSource.setUsername("TSPLUS");
    oracleDataSource.setPassword("test");

    return oracleDataSource;

}

    @Bean(name = "oracleJdbcTemplate")
    public JdbcTemplate jdbcTemplate(DataSource dataSource) {
        return new JdbcTemplate(dataSource);
    }
}
