package beans;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/* Joel Atkinson, February 20, 2026  CSD430 Server Side Development Assignment Part 3 UPDATED BEAN CODE
The purpose of this assignment is to create a database called CSD430 in SQL, then create a table (I chose U.S. states),
and populate that table with at least 5 data fields. From there create a JavaBean to pull the data from the database
which will be linked to the .jsp files in order to have a selection of a U.S. state and then to display the data of that
state in a table. In addition to this, also create an index.jsp file for this course as the landing page where all of our
assignments will be held. I went ahead and also created .css style sheets for both the index as well as the module 5/6
        .jsp files. */

public class StatesBean {

    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/CSD430?useSSL=false&serverTimezone=UTC";
    private static final String JDBC_USER = "student1";
    private static final String JDBC_PASS = "pass";
    private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";

    static {
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
                options.add(new StateOption(
                        rs.getInt("id"),
                        rs.getString("state_name")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return options;
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
                    s.population = rs.wasNull() ? null : popVal;

                    int yf = rs.getInt("year_founded");
                    s.yearFounded = rs.wasNull() ? null : yf;

                    return s;
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }


    public List<StateRecord> getAllStates() {

        List<StateRecord> states = new ArrayList<>();

        String sql = "SELECT id, state_code, state_name, capital, region, population, year_founded " +
                "FROM Joel_states_data ORDER BY state_name";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                StateRecord s = new StateRecord();

                s.id = rs.getInt("id");
                s.stateCode = rs.getString("state_code");
                s.stateName = rs.getString("state_name");
                s.capital = rs.getString("capital");
                s.region = rs.getString("region");

                long popVal = rs.getLong("population");
                s.population = rs.wasNull() ? null : popVal;

                int yf = rs.getInt("year_founded");
                s.yearFounded = rs.wasNull() ? null : yf;

                states.add(s);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return states;
    }


    public boolean addStateRecord(String stateName,
                                  String stateCode,
                                  String capital,
                                  String region,
                                  Long population,
                                  Integer yearFounded) {

        String sql = "INSERT INTO Joel_states_data " +
                "(state_name, state_code, capital, region, population, year_founded) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, stateName);
            ps.setString(2, stateCode);
            ps.setString(3, capital);
            ps.setString(4, region);

            if (population == null) {
                ps.setNull(5, Types.BIGINT);
            } else {
                ps.setLong(5, population);
            }

            if (yearFounded == null) {
                ps.setNull(6, Types.INTEGER);
            } else {
                ps.setInt(6, yearFounded);
            }

            return ps.executeUpdate() == 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    //Updated portion of Java Bean for Part 3 of assignment
    public boolean updateStateRecord(int id,
                                     String stateName,
                                     String stateCode,
                                     String capital,
                                     String region,
                                     Long population,
                                     Integer yearFounded) {

        String sql = "UPDATE Joel_states_data " +
                "SET state_name = ?, state_code = ?, capital = ?, region = ?, population = ?, year_founded = ? " +
                "WHERE id = ?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, stateName);
            ps.setString(2, stateCode);
            ps.setString(3, capital);
            ps.setString(4, region);

            // population is NOT NULL in your table, so don't allow null
            ps.setLong(5, (population == null ? 0 : population));

            if (yearFounded == null) {
                ps.setNull(6, Types.INTEGER);
            } else {
                ps.setInt(6, yearFounded);
            }

            ps.setInt(7, id);

            return ps.executeUpdate() == 1;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
