
import static org.assertj.core.api.Assertions.assertThat;

import org.junit.ClassRule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.junit4.SpringRunner;
import org.testcontainers.containers.OracleContainer;

import liquibase.Liquibase;
import liquibase.exception.LiquibaseException;

@RunWith(SpringRunner.class)
@SpringBootTest
public class OracleDatabaseTest {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private Liquibase liquibase;

    @ClassRule
    public static OracleContainer oracle = new OracleContainer("gvenzl/oracle-xe:21-slim-faststart")
            .withUsername("TSPLUS")
            .withPassword("test");

    /**
     * This method is a JUnit test method that starts the Oracle database
     * container, applies the database migrations, queries the number of tables
     * in the database, and asserts that the count matches the expected value.
     *
     * @throws LiquibaseException if there is an error applying the database
     * migrations
     */
    @Test
    public void testOracleDb() throws LiquibaseException {
        oracle.start();
        liquibase.update("classpath:/db/changelog/db.changelog-master.yaml");
        int tableCount = jdbcTemplate.queryForObject(
                "SELECT count(table_name) FROM all_tables WHERE owner = 'TSPLUS'",
                Integer.class
        );
        assertThat(tableCount).isEqualTo(5);
    }
}
