/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MusicItem {
      public boolean addMusicItem(
            String title,
            String artist,
            String genre,
            String format,
            double price,
            int quantity,
            int releaseYear,
            String description) {
        String sql = "INSERT INTO music_items "
                + "(title, artist, genre, format, price, stock_quantity, "
                + "release_year, description) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement pst = con.prepareStatement(sql);

            pst.setString(1, title);
            pst.setString(2, artist);
            pst.setString(3, genre);
            pst.setString(4, format);
            pst.setDouble(5, price);
            pst.setInt(6, quantity);
            pst.setInt(7, releaseYear);
            pst.setString(8, description);

            int result = pst.executeUpdate();

            pst.close();
            con.close();

            return result > 0;

        } catch (SQLException e) {
            System.out.println("Error adding music item: " + e.getMessage());
            return false;
        }
    }
}
