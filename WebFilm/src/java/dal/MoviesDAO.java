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
import models.Movies;

/**
 *
 * @author admin
 */
public class MoviesDAO {
    Connection conn = null;        // keets noois sql
    PreparedStatement ps = null;  // nems cau lenh query
    ResultSet rs = null;    // keet qua tra ve

    public List<Movies> getAll() {
        List<Movies> list = new ArrayList<>();
        String sql = "select* from Movies order by [view] desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Movies p = new Movies();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImg(rs.getString("img"));
                p.setCaID(rs.getInt("caID"));
                p.setDescription(rs.getString("description"));
                p.setView(rs.getInt("view"));
                p.setYear(rs.getInt("year"));
                p.setDirector(rs.getString("director"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Movies> getProductByCategory(int id) {
        List<Movies> list = new ArrayList<>();
        String sql = "select * from Movies where caID=?";
        try {
            conn = new DBContext().getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                Movies p = new Movies();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImg(rs.getString("img"));
                p.setCaID(rs.getInt("caID"));
                p.setDescription(rs.getString("description"));
                p.setView(rs.getInt("view"));
                p.setYear(rs.getInt("year"));
                p.setDirector(rs.getString("director"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public int getMaxIndex(int caid) {
        int max = 0;
        Movies p = new Movies();
        String sql;
        if (caid == 0) {
            sql = "select count(id) from Movies";
        } else {
            sql = "select count(id) from Movies where caID=?";
        }

        try {

            conn = new DBContext().getConnection();
            PreparedStatement st = conn.prepareStatement(sql);
            if (caid != 0) {
                st.setInt(1, caid);
            }
            rs = st.executeQuery();
            while (rs.next()) {
                max = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return max;
    }

    public List<Movies> getListByPageNew(int index, int caid) {
        List<Movies> list = new ArrayList<>();
        String sql;
        if (caid == 0) {
            sql = "select * from Movies order by [view] desc OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        } else {
            sql = "select * from Movies where caID = ? order by [view] desc OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            if (caid == 0) {
                ps.setInt(1, (index - 1) * 6);
            } else {
                ps.setInt(1, caid);
                ps.setInt(2, (index - 1) * 6);
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                Movies p = new Movies();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImg(rs.getString("img"));
                p.setCaID(rs.getInt("caID"));
                p.setDescription(rs.getString("description"));
                p.setView(rs.getInt("view"));
                p.setYear(rs.getInt("year"));
                p.setDirector(rs.getString("director"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Movies> search(int index,String key) {
        List<Movies> list = new ArrayList<>();
        String sql = "select * from Movies where 1=1 ";

        
        try {
            if (key != null) {
                sql += "and name like '%" + key + "%' or year like '%" + key + "%' order by id OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
                conn = new DBContext().getConnection();
                ps = conn.prepareStatement(sql);
                 ps.setInt(1, (index - 1) * 6);
                rs = ps.executeQuery();
                while (rs.next()) {
                    Movies p = new Movies();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImg(rs.getString("img"));
                p.setCaID(rs.getInt("caID"));
                p.setDescription(rs.getString("description"));
                p.setView(rs.getInt("view"));
                p.setYear(rs.getInt("year"));
                p.setDirector(rs.getString("director"));
                list.add(p);
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public Movies getMovieByID(String id) {
        String sql = "select * from Movies where id = ?";
        Movies p = new Movies();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImg(rs.getString("img"));
                p.setCaID(rs.getInt("caID"));
                p.setDescription(rs.getString("description"));
                p.setView(rs.getInt("view"));
                p.setYear(rs.getInt("year"));
                p.setDirector(rs.getString("director"));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return p;
    }
    
    
    public void addview(String id) {
         String query = "update Movies set [view] = [view]+1 where id = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void delete(String id) {
        String query = "delete Movies where id = ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void addMovie(String name,String img, String ca,String des, String year, String dir) {
        String query = "INSERT INTO Movies VALUES (?, ?, ?, ?,0,?,?);";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, "img/"+img);
            ps.setString(3, ca);
            ps.setString(4, des);
            ps.setString(5, year);
            ps.setString(6, dir);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public static void main(String[] args) {
        MoviesDAO a = new MoviesDAO();
        List<Movies> list = new ArrayList<>();
       list= a.search(1, "t");
        System.out.println(list);
    }

    public void updateMovie(String id, String name, String img, String ca, String des, String year, String dir) {
        String query = "Update Movies set name = ?, img = ?, caID=?, description=?, [year]=?,director=? where id=?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, "img/"+img);
            ps.setString(3, ca);
            ps.setString(4, des);
            ps.setString(5, year);
            ps.setString(6, dir);
            ps.setString(7, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void updateMovie(String id, String name, String ca, String des, String year, String dir) {
        String query = "Update Movies set name = ?,  caID=?, description=?, [year]=?,director=? where id=?;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, ca);
            ps.setString(3, des);
            ps.setString(4, year);
            ps.setString(5, dir);
            ps.setString(6, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Movies> getByDES(int index, int caid) {
        List<Movies> list = new ArrayList<>();
        String sql;
        if (caid == 0) {
            sql = "select * from Movies order by name desc OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        } else {
            sql = "select * from Movies where caID = ? order by name desc OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            if (caid == 0) {
                ps.setInt(1, (index - 1) * 6);
            } else {
                ps.setInt(1, caid);
                ps.setInt(2, (index - 1) * 6);
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                Movies p = new Movies();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImg(rs.getString("img"));
                p.setCaID(rs.getInt("caID"));
                p.setDescription(rs.getString("description"));
                p.setView(rs.getInt("view"));
                p.setYear(rs.getInt("year"));
                p.setDirector(rs.getString("director"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Movies> getByASC(int index, int caid) {
        List<Movies> list = new ArrayList<>();
        String sql;
        if (caid == 0) {
            sql = "select * from Movies order by name asc OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        } else {
            sql = "select * from Movies where caID = ? order by name asc OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY;";
        }
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            if (caid == 0) {
                ps.setInt(1, (index - 1) * 6);
            } else {
                ps.setInt(1, caid);
                ps.setInt(2, (index - 1) * 6);
            }

            rs = ps.executeQuery();
            while (rs.next()) {
                Movies p = new Movies();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImg(rs.getString("img"));
                p.setCaID(rs.getInt("caID"));
                p.setDescription(rs.getString("description"));
                p.setView(rs.getInt("view"));
                p.setYear(rs.getInt("year"));
                p.setDirector(rs.getString("director"));
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
