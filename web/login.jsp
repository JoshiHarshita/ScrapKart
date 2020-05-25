
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ScrapKart Login</title> 
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/login.css">
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
    </head>
    <body>
        <div class="row myrow" >
            <div class="col-sm-2"><a href="logout.jsp"><img src="images/logo.jpg" class="img-fluid"></a></div>
            <div class="col-sm-10 myheader">
                <span><a href="www.google.com">Contact</a></span>
                <span><a href="www.google.com">Price List</a></span>
                <span><a onclick="alert('Please Login first!');">Request PickUp</a></span>
                <span><a href="login.jsp">Login/Register</a></span>
            </div>
        </div>
        <%-- <div>
            <ul>
                <li id="logo"><a href="index.html"><img src="images/logo.jpg" alt="ScrapKart" height="60" width="100"></a></li>
                
                <li><a href="www.google.com">Contact</a></li>
                <li><a onclick="alert('Please Login first!');">Request PickUp</a></li>
                <li><a href="www.google.com">Price List</a></li>
                <li><a href="login.jsp">Login/Register</a></li>
            </ul>

        </div> --%>
        <div class="container">
            <div class="row" >
                <div class="col-sm-3"></div>
                <div class="col-sm-6 loginform" style="background-color: ">
                    <h1 class="heading">Login</h1>
                    <form method="post" action="LoginServlet">
                        <label>Email:</label><br>
                        <input type="text" name="email" required><br><br>
                        <label>Password:</label><br>
                        <input type="password" name="password" required><br><br>

                        <input  type="submit" value="Submit"><br><br>
                    </form>
                    <p class="confirm">Don't have an account?<a href="registerForm.jsp" style="color:green ;margin-left:6%">Register</a></p>

                </div>
                <div class="col-sm-3"></div>
            </div>
        </div>

    </body>
    <%
        String status = request.getParameter("isvalid");
        if (status != null && status.equals("false")) {
    %>
    <script>
        alert("Invalid user_id or password!!");
    </script>
    

   
    <%
        }
    %>
     <%
        String status2 = request.getParameter("Regisvalid");
        if (status2 != null && status2.equals("true")) {
    %>
     <script>
        alert("Registration Successful!Please Login");
    </script>
    <%
       }
        else if(status2!=null&&status2.equals("false"))
        {
     %>
     <script>
        alert("Already registered with this username!");
     </script>
     <% } %>
   

</html>
