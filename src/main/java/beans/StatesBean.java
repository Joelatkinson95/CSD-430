package beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/* Joel Atkinson, February 7, 2026, CSD430 Server Side Development Assignment 5&6
The purpose of this assignment is to create a database called CSD430 in SQL, then create a table (I chose U.S. states),
and populate that table with at least 5 data fields. From there create a JavaBean to pull the data from the database
which will be linked to the .jsp files in order to have a selection of a U.S. state and then to display the data of that
state in a table. In addition to this, also create an index.jsp file for this course as the landing page where all of our
assignments will be held. I went ahead and also created .css style sheets for both the index as well as the module 5/6
        .jsp files. */

public class StatesBean {

    // JDBC connection parameters
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/CSD430?useSSL=false&serverTimezone=UTC";
    private static final String JDBC_USER = "student1";
    private static final String JDBC_PASS = "pass";
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

    static {
        // Attempt to load the MySQL driver
        try {
            Class.forName(JDBC_DRIVER);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
    }


    public static class StateOption {
        public final int id;
        public final String name;

        public StateOption(int id, String name) {
            this.id = id;
            this.name = name;
        }
    }

    public static class StateRecord {
        public int id;
        public String stateCode;
        public String stateName;
        public String capital;
        public String region;
        public Long population;
        public Integer yearFounded;
    }

    public List<StateOption> getStateOptions() {
        List<StateOption> options = new ArrayList<>();
        String sql = "SELECT id, state_name FROM Joel_states_data ORDER BY state_name";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("state_name");
                options.add(new StateOption(id, name));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return options;
    }


    public List<Integer> getAllIds() {
        List<Integer> ids = new ArrayList<>();
        String sql = "SELECT id FROM Joel_states_data ORDER BY id";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ids.add(rs.getInt("id"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ids;
    }

    public StateRecord getStateById(int id) {
        String sql = "SELECT id, state_code, state_name, capital, region, population, year_founded " +
                "FROM Joel_states_data WHERE id = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    StateRecord s = new StateRecord();
                    s.id = rs.getInt("id");
                    s.stateCode = rs.getString("state_code");
                    s.stateName = rs.getString("state_name");
                    s.capital = rs.getString("capital");
                    s.region = rs.getString("region");

                    long popVal = rs.getLong("population");
                    if (rs.wasNull()) {
                        s.population = null;
                    } else {
                        s.population = popVal;
                    }

                    int yf = rs.getInt("year_founded");
                    if (rs.wasNull()) {
                        s.yearFounded = null;
                    } else {
                        s.yearFounded = yf;
                    }

                    return s;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


}
