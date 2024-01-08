package com.example.testcontainersoraliquibase;

import javax.sql.DataSource;
import liquibase.exception.LiquibaseException;
import liquibase.integration.spring.SpringLiquibase;
import lombok.extern.slf4j.Slf4j;
import org.junit.Assert;
import org.junit.ClassRule;
import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.test.context.ContextConfiguration;
import org.testcontainers.containers.OracleContainer;

@SpringBootTest
@ContextConfiguration(classes = TestConfig.class)
@Slf4j
public class OracleDatabaseTestIT {

DataSource oracleDataSource = new DriverManagerDataSource(oracle.getJdbcUrl(),
    oracle.getUsername(),oracle.getPassword());
    JdbcTemplate jdbcTemplate = new JdbcTemplate(oracleDataSource);
  SpringLiquibase liquibase = new SpringLiquibase();
    @ClassRule
    public static OracleContainer oracle = new OracleContainer("gvenzl/oracle-xe:21-slim-faststart")
            .withUsername("TSPLUS")
            .withPassword("test");





    @Test
  public void oracleDatabaseTestIT() throws LiquibaseException {
      oracle.start();

      liquibase.setChangeLog("classpath:/db/changelog/db.changelog-master.yaml");
liquibase.setDataSource(oracleDataSource);
liquibase.afterPropertiesSet();
      int tableCount =
        jdbcTemplate.queryForObject(
            "SELECT count(table_name) FROM all_tables WHERE owner = 'TSPLUS'", Integer.class);
      log.info("TABLE COUNT ="+ tableCount);
    Assert.assertTrue(tableCount == 5);
    }
}
