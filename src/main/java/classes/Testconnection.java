/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

import java.sql.Connection;

public class Testconnection {

    public static void main(String[] args) {

        Connection connection = DBConnection.getConnection();

        if (connection != null) {
            System.out.println("=================================");
            System.out.println("DATABASE CONNECTION SUCCESSFUL!");
            System.out.println("Database: MelodyBeats");
            System.out.println("=================================");

            try {
                connection.close();
                System.out.println("Connection closed.");
            } catch (Exception e) {
                e.printStackTrace();
            }

        } else {
            System.out.println("=================================");
            System.out.println("DATABASE CONNECTION FAILED!");
            System.out.println("=================================");
        }
    }
}