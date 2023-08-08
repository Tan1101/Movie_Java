/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import models.Account;

/**
 *
 * @author admin
 */
public class AccountDAO {
    Connection conn = null;        // keets noois sql
    PreparedStatement ps = null;  // nems cau lenh query
    ResultSet rs = null;    // keet qua tra ve

    public Account login(String gmail, String password) {
        String query = "select * from Account where gmail = ? and password= ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, gmail);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getString(5),
                        rs.getBoolean(6)
                );
            }
        } catch (Exception e) {

        }
        return null;

    }

    public void AddAccount(String gmail, String password, String name, boolean gender, String role, boolean status) {
        String query = "INSERT INTO [dbo].[Account]\n"
                + "           ([gmail]\n"
                + "           ,[password]\n"
                + "           ,[name]\n"
                + "           ,[gender]\n"
                + "           ,[role]\n"
                + "           ,[accStatus])\n"
                + "     VALUES(?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, gmail);
            ps.setString(2, password);
            ps.setString(3, name);
            ps.setBoolean(4, gender);
            ps.setString(5, role);
            ps.setBoolean(6, status);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void setStatusAccount(String gmail, boolean status) {
        String query = "UPDATE [dbo].[Account]\n"
                + "   SET [accStatus] = ?\n"
                + " WHERE gmail = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setBoolean(1, status);
            ps.setString(2, gmail);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void setPasswordAccount(String gmail, String password) {
        String query = "UPDATE [dbo].[Account]\n"
                + "   SET [password] = ?\n"
                + " WHERE gmail = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, gmail);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public Account searchAccByID(String gmail) {
        String query = "select * from Account where gmail = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, gmail);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getBoolean(4),
                        rs.getString(5),
                        rs.getBoolean(6)
                );
            }
        } catch (Exception e) {

        }
        return null;

    }

    
}
