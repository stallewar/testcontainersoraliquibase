//TODO need to fix java.lang.NullPointerException: Cannot invoke "org.testcontainers.containers.OracleContainer.start()" because "test.oracleContainer" is null

package com.example.testcontainersoraliquibase;

import java.io.IOException;
import java.sql.SQLException;
import liquibase.exception.LiquibaseException;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.testcontainers.containers.OracleContainer;
import org.testcontainers.containers.output.Slf4jLogConsumer;
import org.testcontainers.junit.jupiter.Testcontainers;

@Testcontainers
@SpringBootTest
@ContextConfiguration(classes = TestConfiguration.class)
@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@Slf4j
public class OracleDatabaseTest {

  @Autowired
  @Qualifier("oracleContainer")
  public OracleContainer oracleContainer;
  private final Slf4jLogConsumer logConsumer = new Slf4jLogConsumer(log);

  @BeforeAll
  public void setOracleContainer() {
    oracleContainer.start();
    oracleContainer.followOutput(logConsumer);
    final String logs = oracleContainer.getLogs();
    log.info("Container logs: {}", logs);

  }


  @Test
  public void shouldReturnNumberOfTables()
      throws SQLException, IOException, InterruptedException, LiquibaseException {
    System.out.println("Test STARTED");
    // oracleContainer.execInContainer("sql", "SELECT 1 FROM DUAL");

  }
}
