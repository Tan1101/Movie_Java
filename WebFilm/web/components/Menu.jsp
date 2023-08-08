<%-- 
    Document   : Menu.jsp
    Created on : May 20, 2023, 3:29:59 PM
    Author     : dinhd513
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="wel">
    <h6 href=""><strong>Welcome</strong> to filmPRO</h6>

</div>
<!-- Top navigation -->
<div class="topnav">

    <!-- Centered link -->
    <div class="topnav-centered">
        <a href="${pageContext.request.contextPath}/view/home" class="active"
           style="color: black; font-size: 40px; font-family: 'MuseoModerno', cursive;"><strong>filmPRO</strong></a>
    </div>

    <!-- Left-aligned links (default) -->
    <a style="font-family: 'MuseoModerno', cursive;" href="${pageContext.request.contextPath}/view/home">Home</a>
    
    <!-- Right-aligned links -->
    <%
    int size = 0;
Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie cookie : cookies) {
        if (cookie.getName().equals("size")) {
            size = Integer.parseInt(cookie.getValue());
            break;
        }
    }
}
    %>

    <c:if test="${sessionScope.account != null}">
            <a style="padding-left: 20px; font-family: 'MuseoModerno', cursive;"href="${pageContext.request.contextPath}/view/logout">Log out</a>   
        </c:if>

        <c:if test="${sessionScope.account == null}">
            <a  style="padding-left: 20px; margin-right: 20px ;font-family: 'MuseoModerno', cursive;" href="${pageContext.request.contextPath}/view/Login.jsp">Log in</a>   
        </c:if>
</div>
