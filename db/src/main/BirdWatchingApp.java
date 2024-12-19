package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

public class BirdWatchingApp {
    private static Connection connection;

    public static void main(String[] args) {
        try {
            // Connect to the database
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/birdwatching_db", "root", "password");

            Scanner scanner = new Scanner(System.in);
            boolean running = true;

            System.out.println("Welcome to the Bird Watching App!");
            
            while (running) {
                System.out.println("\nMenu:");
                System.out.println("1. Add Bird Sighting");
                System.out.println("2. View Leaderboard");
                System.out.println("3. Admin Features");
                System.out.println("4. Exit");
                System.out.print("Choose an option: ");
                int choice = scanner.nextInt();

                switch (choice) {
                    case 1 -> {
                        System.out.print("Enter your user ID: ");
                        int userId = scanner.nextInt();
                        System.out.print("Enter bird ID: ");
                        int birdId = scanner.nextInt();
                        BirdWatcher.addSighting(connection, userId, birdId);
                    }
                    case 2 -> BirdWatcher.viewLeaderboard(connection);
                    case 3 -> AdminBirdwatcher.adminMenu(connection);
                    case 4 -> {
                        running = false;
                        System.out.println("Goodbye!");
                    }
                    default -> System.out.println("Invalid option. Try again.");
                }
            }
        } catch (SQLException e) {
            System.out.println("Error connecting to the database: " + e.getMessage());
        } finally {
            try {
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.out.println("Error closing the database: " + e.getMessage());
            }
        }
    }
}
