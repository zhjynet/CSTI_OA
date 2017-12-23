<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2017/10/6
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>科协OA</title>
</head>
<body>
<%
    Object username = session.getAttribute("user");
    if(null == username){
        response.sendRedirect("/login.html");
    }
%>
</body>
</html>
