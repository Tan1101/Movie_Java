/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author admin
 */
public class Comment {
   private String cid, comment,date,name,id;

    public Comment() {
    }

    public Comment(String cid, String comment, String date, String name, String id) {
        this.cid = cid;
        this.comment = comment;
        this.date = date;
        this.name = name;
        this.id = id;
    }

    public Comment(String comment, String date, String name, String id) {
        this.comment = comment;
        this.date = date;
        this.name = name;
        this.id = id;
    }
    
    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

}
