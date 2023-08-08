/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Comment;
import models.Movies;

/**
 *
 * @author admin
 */
public class CommentDAO {

    Connection conn = null;        // keets noois sql
    PreparedStatement ps = null;  // nems cau lenh query
    ResultSet rs = null;    // keet qua tra ve

    public List<Comment> getComment(String id) {
        List<Comment> list = new ArrayList<>();
        String sql = "select* from Comment where id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Comment p = new Comment();
                p.setComment(rs.getString("comment"));
                p.setDate(rs.getString("date"));
                p.setName(rs.getString("name"));
                p.setId(rs.getString("id"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void addCMT(String id, String name, String comment, String date) {
        String query = "INSERT INTO [Comment] VALUES (?,?,?,?);";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,comment);
            ps.setString(2, date);
            ps.setString(3, name);
            ps.setString(4, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
}
