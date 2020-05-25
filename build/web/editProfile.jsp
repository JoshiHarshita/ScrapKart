<%-- 
    Document   : editProfile
    Created on : 23 Dec, 2019, 4:24:11 PM
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
        <title>EditProfile</title>
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
        <div>
            <ul>
                <li id="logo"><a href="logout.jsp"><img src="images/logo.jpg" alt="ScrapKart" height="60" width="100"></a></li>
                <li><a href="www.google.com">Contact</a></li>
                <li><a href="request.html">Request PickUp</a></li>
                <li><a href="www.google.com">Price List</a></li>
                <li><a href="www.google.com">Login/Register</a></li>
            </ul>
            
        </div>
     
        <div class="container">
        <div class="row"  >
            <div class="col-sm-12 registerform">
                <h1 class="heading">Edit Profile</h1>
                <hr>
                <form method="post" action="EditProfileServlet">
                    <div class="row" style="width:91% ;">
                        <div class="col-sm-6">
                                <label>Name :</label><br>
                                <input type="text" name="Name" placeholder="Enter Name" required>
                        </div>
       
                    </div><br>
                    <div class="row" style="width:91% ;">
                        <div class="col-sm-6">
                                <label>Contact :</label><br>
                                <input type="text" name="Contact" placeholder="+91" required>
                        </div>
                    </div>
                    <br>
                    <label>Address:</label><br>
                    <div class="row" style="width:91% ;">
                        <div class="col-sm-6">
                                <input type="text" name="City" placeholder="Enter City" required>
                        </div>
                        <div class="col-sm-6">
                                <input type="text" name="Street" placeholder="Enter Street" required>
                        </div>
                    </div>
                    <br>
                    <input type="text" name="Landmark" placeholder="Enter Landmark" required><br><br>
                    <input type="text" name="House_no" placeholder="Enter Houseno" required><br><br>
                    <input type="text" name="Add_type" placeholder="Enter Address Type" required><br><br>
                  
                    <button onclick="document.getElementById('id01').style.display='block'" class="btn btn-success " style="background-color: green;margin-left: 20px; color:white; text-align:center;float:right;  font-size:20px;font-weight: bold;">Change Password</label><br> 
                    <button type=“button”  class="btn btn-success " style="background-color: green; color:white; text-align:center;float:right; font-size:20px; margin-left:20px;font-weight: bold;"><a href="requestForm.jsp">Back</a></button>
                    <input  type="submit" value="Submit"  style="background-color: green; color:white; text-align:center;float:right; font-size:20px; margin-left:20px; padding-top: 6px; padding-bottom: 4px; "><br><br>
                </form>
                
                
                
                
                
                <div id="id01" class="w3-modal">
                    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
     
                     <div class="w3-center"><br>
                         <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
     
                         <form  class="w3-container " method="post" action="changePasswordServlet">
                         <div class="w3-section">
                             <div class="form-group" >
                                 <label style=" font-weight: bold; font-size: 30px; text-align: center; ">Change Password</label><br><br>
                                 <label>Previous Password:</label><br>
                                 <input type="password" name="password" required><br>
                                 <label  >New Password:</label><br>
                                 <input type="password" name="new_password" required><br>
                                 <label>Re-Enter Password:</label><br>
                                 <input type="password" name="new_password" required><br><br>
                                 
                                 <input  type="submit" value="Confirm" style="margin-left:40%"><br><br>
     
                               </div>        
                         </div>
                         
                     </form>
                </div> 
     
                </div>
             </div>
                 
            </div>
        </div>
        </div>
        
          <div class="container-fluid" style="height: 300px; background-color:#003F2A;">
       
    </body>
</html>
