<%-- 
    Document   : registerForm
    Created on : 23 Dec, 2019, 4:21:20 PM
    Author     : HARSHITA JMA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>ScrapKart Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/register.css">
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
    </head>
    <body>
        <div>
            <ul>
                <li id="logo"><a href="index.html"><img src="images/logo.jpg" alt="ScrapKart" height="60" width="100"></a></li>
                <li><a href="www.google.com">Contact</a></li>
                <li><a href="www.google.com">Request PickUp</a></li>
                <li><a href="www.google.com">Price List</a></li>
                <li><a href="login.jsp">Login/Register</a></li>
            </ul>            
        </div>
     
        <div class="container">
        <div class="row"  >
                <div class="col-sm-2"></div>
            <div class="col-sm-8 registerform">
                <h1 class="heading">Register</h1>
                <form method="post" action="RegisterServlet">
                    <label>Name:</label><br>
                    <input type="text" name="Name" required><br>
                    <label>Email:</label><br>
                    <input type="text" name="email" required><br>
                    <label>Password:</label><br>
                 
                    <input type="password" id="pwd" name="password" onkeyup="validatePassword(this.value);" required><br><span id="msg"></span><br>
                    <label>Re-Enter Password:</label><br>
                    <input type="password" name="confirm_password" required><br>
                    <label>Contact:</label><br>
                    <input type="text" name="Contact" required><br>
                    <label>Address:</label><br>
                    <div class="row" style="width:94% ;">
                        <div class="col-sm-6">
                                <input type="text" name="City" placeholder="Enter City" required>
                        </div>
                      
                        <div class="col-sm-6">
                                <input type="text" name="Street" placeholder="Enter Street" required>
                        </div>
                         <div class="col-sm-6">
                                <input type="text" name="Add_type" placeholder="Enter Address Type" required>
                        </div>
                    </div>
                    <br>
                    <input type="text" name="Landmark" placeholder="Enter Landmark" required><br><br>
                    <input type="text" name="House_no" placeholder="Enter Houseno" required><br><br>


                    
                    <input  type="submit" value="Submit"><br><br>
                </form>
                <p class="confirm">Already have an account?<a href="login.jsp" style="color:green ;margin-left:6;">Login</a></p>
                 
            </div>
            <div class="col-sm-2"></div>
        </div>
        </div>
        
               <%
        String status=request.getParameter("RegisValid");
        if(status!=null&&status.equals("false")){   
        %>
        <script>
         alert("This Email_id has already been registered!!");
     </script>
     <%
         }
        else if(status!=null&&status.equals("true"))
            {  
      %>
       <script>
         alert("Successfully Registered! Please login to continue.");
     </script>
     <%}
     %>
     <script>
        function validatePassword(password)
        {
            if(password.length<8)
            {    document.getElementById("msg").innerHTML = "Password must be atleast 8 charaters long!";
                 document.getElementById("msg").style.color = "red";
                return;
            }
            else
            {
                document.getElementById("msg").innerHTML = "";
            }
        }
     </script>
     
      <div class="container-fluid" style="height: 300px; background-color:#003F2A;">
        
    </body>
    

      
</html>

