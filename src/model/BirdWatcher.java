package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BirdWatcher {
    public static void addSighting(Connection conn, int userId, int birdId) {
        try {
            String query = "INSERT INTO Sightings (user_id, bird_id) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, userId);
            stmt.setInt(2, birdId);
            stmt.executeUpdate();
            System.out.println("Sighting added successfully.");
        } catch (SQLException e) {
            System.out.println("Error adding sighting: " + e.getMessage());
        }
    }

    public static void viewLeaderboard(Connection conn) {
        try {
            String query = "SELECT Users.username, Rankings.total_sightings, Rankings.unique_species, Rankings.ranking " +
                           "FROM Rankings " +
                           "JOIN Users ON Rankings.user_id = Users.id " +
                           "ORDER BY Rankings.ranking ASC";
            PreparedStatement stmt = conn.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            System.out.println("Rank | Username   | Total Sightings | Unique Species");
            System.out.println("-----------------------------------------------------");
            while (rs.next()) {
                System.out.println(rs.getInt("ranking") + "    | " +
                                   rs.getString("username") + "        | " +
                                   rs.getInt("total_sightings") + "              | " +
                                   rs.getInt("unique_species"));
            }
        } catch (SQLException e) {
            System.out.println("Error fetching leaderboard: " + e.getMessage());
        }
    }
}
