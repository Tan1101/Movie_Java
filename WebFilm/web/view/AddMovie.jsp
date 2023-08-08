<%-- 
    Document   : AddMovie
    Created on : Jul 14, 2023, 7:09:53 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="../stylesheet/AddBlog.css">
    </head>
    <body>
        <form action="home" method="get" >

            <input type="submit" value="HOME">
        </form>
        <br>
        <br>
        ${mess}
        <form action="addMovie" method="post" >


            <label>Name:    </label>  <input name="name" type="text" value="" required>

            <br>
            Image:       <input name="img" type="file">
            <br>
            Categori:
            <select name="ca">  
                <c:forEach items="${listca}" var="i">
                    <option value="${i.caID}">${i.caName}</option>
                </c:forEach>
            </select><!-- comment -->
            <br>
            <br>
            Description: <textarea name="des" type="text" value="" required></textarea>

            <br>
            Year:        <input name="year" type="number" value="">

            <br>
            Director:    <input name="dir" type="text" value="">

            <br>
            <br>
            <input type="submit" value="ADD MOVIE">
        </form>
    </body>
</html>
