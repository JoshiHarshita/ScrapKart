<%-- 
    Document   : Error
    Created on : 13 Mar, 2020, 6:49:17 PM
    Author     : HARSHITA JMA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <div id="Error_Description">Error Appears here</div>
    </body>
     <%
        String status = request.getParameter("Password_match");
        if ( status.equals("false")) {
    %>
    <script>
             document.getElementById("Error_Description").innerHTML = "Please Retype Password didnt matched!";
            
    </script>
</html>
