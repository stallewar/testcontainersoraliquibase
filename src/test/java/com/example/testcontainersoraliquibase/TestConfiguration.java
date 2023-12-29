package com.example.testcontainersoraliquibase;

import javax.sql.DataSource;
import liquibase.integration.spring.SpringLiquibase;
import lombok.extern.slf4j.Slf4j;
import net.bytebuddy.utility.dispatcher.JavaDispatcher.Container;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.boot.testcontainers.service.connection.ServiceConnection;
import org.springframework.context.annotation.Bean;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestPropertySource;
import org.testcontainers.containers.OracleContainer;
import org.testcontainers.containers.wait.strategy.Wait;

@SpringBootConfiguration
@ContextConfiguration
@TestPropertySource("classpath:application.properties")
@org.springframework.boot.test.context.TestConfiguration
@Slf4j
public class TestConfiguration {

  @Value("${spring.datasource.name}")
  private String databaseName;

  @Value("${spring.datasource.username}")
  private String username;

  @Value("${spring.datasource.password}")
  private String password;

  @Value("${spring.liquibase.change-log}")
  private String changelog;

  @Value("${spring.datasource.url}")
  private String dataSourceUrl;

  @Container
  @Bean(name = "oracleContainer") // initMethod = "start", destroyMethod = "stop")
  @ServiceConnection
  public OracleContainer oracleContainer() {

    OracleContainer oracleContainer = new OracleContainer("gvenzl/oracle-xe:21-slim-faststart")


        .withDatabaseName(databaseName)
        .withUsername(username)
        .withPassword(password)
        // .withInitScript("init.sql")
        // .withUrlParam("TC_DAEMON", "true")
        .withReuse(true)
        .waitingFor(Wait.forLogMessage(".*DATABASE IS READY TO USE!.*", 1));
    // oracleContainer.start();

    return oracleContainer;

  }


  @Bean
  public DataSource dataSource() {
    return DataSourceBuilder
        .create()
        .driverClassName("org.testcontainers.jdbc.ContainerDatabaseDriver")
        .url(dataSourceUrl)
        // other properties
        .build();
  }

  @Bean
  public SpringLiquibase springLiquibase() {
    SpringLiquibase springLiquibase = new SpringLiquibase();
    springLiquibase.setDataSource(dataSource());
    springLiquibase.setChangeLog(changelog);
    return springLiquibase;
  }

}