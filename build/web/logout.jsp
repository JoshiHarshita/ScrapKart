<%-- 
    Document   : logout
    Created on : 20 Feb, 2020, 10:22:17 AM
    Author     : HARSHITA JMA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("user_mail");
    session.invalidate();
    response.sendRedirect("index.html");
%>
