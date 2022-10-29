import org.flywaydb.core.Flyway;
import org.jetbrains.annotations.NotNull;

public class Example {
    public static final @NotNull String CONNECTION = "jdbc:postgresql://localhost:5432/";
    public static final @NotNull String DB_NAME = "hw4";
    public static final @NotNull String USERNAME = "postgres";
    public static final @NotNull String PASSWORD = "root";

    public static void main(String[] args) {
        final Flyway flyway = Flyway
                .configure()
                .dataSource(CONNECTION + DB_NAME, USERNAME, PASSWORD)
                .locations("db")
                .load();
        flyway.clean();
        flyway.migrate();
        System.out.println("Migrations applied successfully");
    }
}
