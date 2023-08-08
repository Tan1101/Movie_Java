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
              <style>
  .custom-file-input {
    position: relative;
    overflow: hidden;
    display: inline-block;
  }
  
  

  .custom-file-input input[type="file"] {
    font-size: 100px;
    position: absolute;
    left: 0;
    top: 0;
    opacity: 0;
    cursor: pointer;
  }

  .custom-file-input::before {
    content: '${img}';
    display: inline-block;
    background: #ccc;
    padding: 8px 20px;
    border-radius: 4px;
    cursor: pointer;
  }

  .custom-file-input.has-file::before {
    content: attr(data-file-name);
    background: #eaeaea;
  }
</style>
    </head>
    <body>
        <form action="home" method="get" >

            <input type="submit" value="HOME">
        </form>
        <br>
        <br>
        ${mess}
        <form action="updateMovie" method="post" >

            <input type="hidden" value="${id}" name="id">
            <label>Name:    </label>  <input name="name" type="text" value="${name}" required>

            <br>
            Image:  
            
      <script>
  document.addEventListener('DOMContentLoaded', function() {
    var fileInput = document.querySelector('.custom-file-input input[type="file"]');
    fileInput.addEventListener('change', function() {
      var fileName = fileInput.value.split('\\').pop();
      var fileLabel = document.querySelector('.custom-file-input');
      if (fileName) {
        fileLabel.classList.add('has-file');
        fileLabel.setAttribute('data-file-name', fileName);
      } else {
        fileLabel.classList.remove('has-file');
        fileLabel.removeAttribute('data-file-name');
      }
    });
  });
</script>

<label class="custom-file-input">
    <input type="file" name="img" value="${img}">
</label>
            <br>
            Categori:
            <select name="ca">  
                <c:forEach items="${listca}" var="i">
                    <c:choose>
                        <c:when test="${i.caID eq ca}">
                            <option selected="" value="${i.caID}">${i.caName}</option>
                        </c:when>

                        <c:otherwise>
                            <option value="${i.caID}">${i.caName}</option>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
            </select><!-- comment -->
            <br>
            <br>
            Description: <input name="des" type="" value="${des}" required>

            <br>
            Year:        <input name="year" type="number" value="${year}">

            <br>
            Director:    <input name="dir" type="text" value="${dir}">

            <br>
            <br>
            <input type="submit" value="UPDATE MOVIE">
        </form>
    </body>
</html>
