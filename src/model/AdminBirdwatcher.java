package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class AdminBirdwatcher {
    public static void adminMenu(Connection conn) {
        Scanner scanner = new Scanner(System.in);
        boolean adminRunning = true;

        while (adminRunning) {
            System.out.println("\nAdmin Menu:");
            System.out.println("1. Add Bird");
            System.out.println("2. Delete Bird");
            System.out.println("3. View Users");
            System.out.println("4. Exit");
            System.out.print("Choose an option: ");
            int adminChoice = scanner.nextInt();

            try {
                switch (adminChoice) {
                    case 1 -> {
                        System.out.print("Enter bird name: ");
                        scanner.nextLine(); // Consume newline
                        String birdName = scanner.nextLine();
                        addBird(conn, birdName);
                    }
                    case 2 -> {
                        System.out.print("Enter bird ID to delete: ");
                        int birdId = scanner.nextInt();
                        deleteBird(conn, birdId);
                    }
                    case 3 -> viewUsers(conn);
                    case 4 -> adminRunning = false;
                    default -> System.out.println("Invalid option. Try again.");
                }
            } catch (SQLException e) {
                System.out.println("Error: " + e.getMessage());
            }
        }
    }

    public static void addBird(Connection conn, String birdName) throws SQLException {
        String query = "INSERT INTO Birds (name) VALUES (?)";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, birdName);
        stmt.executeUpdate();
        System.out.println("Bird added successfully.");
    }

    public static void deleteBird(Connection conn, int birdId) throws SQLException {
        String query = "DELETE FROM Birds WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, birdId);
        stmt.executeUpdate();
        System.out.println("Bird deleted successfully.");
    }

    public static void viewUsers(Connection conn) throws SQLException {
        String query = "SELECT id, username FROM Users";
        PreparedStatement stmt = conn.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();

        System.out.println("User ID | Username");
        System.out.println("------------------");
        while (rs.next()) {
            System.out.println(rs.getInt("id") + "       | " + rs.getString("username"));
        }
    }
}
