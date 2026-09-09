/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String URL =
            "jdbc:sqlserver://localhost:1434;"
            + "databaseName=MelodyBeats;"
            + "encrypt=true;"
            + "trustServerCertificate=true";

    private static final String USER = "Test";
    private static final String PASSWORD = "MelodyBeats@123";

    public static Connection getConnection() {

        try {return DriverManager.getConnection( URL, USER, PASSWORD );

        } catch (SQLException e) {

            System.out.println("Database Connection Failed!");
            e.printStackTrace();

            return null;
        }
    }
}