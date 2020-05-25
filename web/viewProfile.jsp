<%-- 
    Document   : viewProfile
    Created on : 23 Dec, 2019, 4:25:40 PM
    Author     : HARSHITA JMA
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="scrapKart.model.scrapKartModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="scrapKart.pojo.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>ViewProfile</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
         <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="css/register.css">
     
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
    </head>
    <body>
        <%-- <div>
            <ul>
                <li id="logo"><img src="images/logo.jpg" alt="ScrapKart" height="60" width="100"></li>
                <li><a href="www.google.com">Contact</a></li>
                <li><a href="request.html">Request PickUp</a></li>
                <li><a href="www.google.com">Price List</a></li>
                <li><a href="www.google.com">Login/Register</a></li>
            </ul>
            
        </div> --%>
         <div class="row myrow" >
            <div class="col-sm-2"><a href="logout.jsp"><img src="images/logo.jpg" class="img-fluid"></a></div>
            <div class="col-sm-10 myheader">
                <span><a href="www.google.com">Contact</a></span>
                <span><a href="www.google.com">Request PickUp</a></span>
                <span><a >Price List</a></span>
                <span><a href="login.jsp">Login/Register</a></span>
            </div>
        </div>
        <%
            String user=session.getAttribute("user_mail").toString();
            ArrayList<Customer> cust =new ArrayList<Customer>();
             try
            {
                cust=scrapKartModel.getAllCustomer(user);
            }
            catch(SQLException e)
             {
                 e.printStackTrace();
             }
        %>
        <div class="container">
        <div class="row"  >
            <div class="col-sm-12 registerform">
                <h1 class="heading">Profile</h1>
                <hr>
                <div class="col-sm-6" style="text-align:center">
                    <label>Name :</label><br>
                    <label>Email :</label><br>
                    <label>Contact :</label><br>
                    <label>Address</label><br>
                    <label>House No:</label><br>
                    <label>Street:</label><br>
                    <label>Landmark:</label><br>
                    <label>City:</label><br>
                    

                </div>

                <div class="col-sm-6"  style="text-align:left">
                    <% for(Customer c :cust)
                    { %>          
                    <label style="color: black;"><%= c.getName()%></label><br>
                    <label style="color: black;"><%= c.getEmail() %></label><br>
                    <label style="color: black;"><%= c.getContact() %></label><br><br><br>
                    <label style="color: black;"><%= c.getHouse_no()%></label><br>
                    <label style="color: black;"><%=  c.getStreet()%></label><br>
                    <label style="color: black;"><%= c.getLandmark()%></label><br>
                    <label style="color: black;"><%= c.getCity()%></label><br><br> 
                    <%}
                    %>

                </div>
                    <a href="editProfile.jsp"><label  class=" btn btn-success myclick" style="background-color: green;margin-left: 20px; color:white; text-align:center;float:right; font-size:20px;font-weight: bold;">Edit Profile</label></a><br>                
                <button type=“button”  class=" btn btn-success myclick" style="background-color: green; color:white; text-align:center;float:right;  font-size:20px;font-weight: bold;"><a href="requestForm.jsp">Back</a></button>

        
                 
            </div>
        </div>
        </div>
        
        <div class="container-fluid" style="height: 300px; background-color:#003F2A;">
    </body>
</html>

