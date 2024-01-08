package com.example.testcontainersoraliquibase;

import javax.sql.DataSource;
import liquibase.exception.LiquibaseException;
import liquibase.integration.spring.SpringLiquibase;
import lombok.extern.slf4j.Slf4j;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.ClassRule;
import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.testcontainers.containers.OracleContainer;
@SpringBootTest
@Slf4j
public class OracleDatabaseTestIT {

  private static DataSource oracleDataSource;
  private static JdbcTemplate jdbcTemplate;
  private static SpringLiquibase liquibase;

  @ClassRule
  public static OracleContainer oracle = new OracleContainer("gvenzl/oracle-xe:21-slim-faststart")
      .withUsername("TSPLUS")
      .withPassword("test");

  @BeforeClass
  public static void setUp() {
    oracle.start();
    oracleDataSource = new DriverManagerDataSource(oracle.getJdbcUrl(), oracle.getUsername(), oracle.getPassword());
    jdbcTemplate = new JdbcTemplate(oracleDataSource);
    liquibase = new SpringLiquibase();
    liquibase.setDataSource(oracleDataSource);
    liquibase.setChangeLog("classpath:/db/changelog/db.changelog-master.yaml");
  }

  @Test
  public void testOracleDatabase() throws LiquibaseException {
    liquibase.afterPropertiesSet();

    int tableCount = jdbcTemplate.queryForObject(
        "SELECT count(table_name) FROM all_tables WHERE owner = 'TSPLUS'", Integer.class);

    log.info("TABLE COUNT = " + tableCount);
    Assert.assertEquals(5, tableCount);
  }
}
