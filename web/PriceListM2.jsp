<%-- 
    Document   : PriceListM2.jsp
    Created on : 10 Mar, 2020, 5:22:45 PM
    Author     : HARSHITA JMA
--%>

<%@page import="scrapKart.model.scrapKartModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>PriceList ManagerSide</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
         <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="css/PriceList.css">
     
    </head>
    <body>
        <%-- <div>
            <ul>
                <li id="logo"><a href="index.html"><img src="images/logo.jpg" alt="ScrapKart" height="60" width="100"></a></li>
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
                <span><a href="www.google.com">Price List</a></span>
                <span><a onclick="alert('Please Login first!');">Request PickUp</a></span>
                <span><a href="login.jsp">Login/Register</a></span>
            </div>
        </div>
        <br>
        <br>
        <!-- <hr> -->
        <div class="container-fluid" >
            <div class="container" style="background-color: white; height: 1100px;">
                    <h4 style="text-align: center;">  Rates of Scrap</h4>
                     
                    <span style="margin-left: 30px;">
                        <span style="font-size: 15px;">  To Edit</span>
                        <img src="images/edit.png" height="30" width="30">
                   
                    </span>

                    <span style="margin-left: 30px;">
                        <span style="font-size: 15px;">  Refresh</span>
                        <a onclick="window.location.reload();"><img src="images/ref2.png" height="30" width="30"></a>
                   
                    </span>
                       
                    <div class="row">
                        <div class=" col-sm-3 scrapbox"   >
                            <img src="images/pricelist/aluminium.png" style="margin-left: 25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Aluminium</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">
                                <%= scrapKartModel.getPrice("Aluminium")%> per kg <a onclick="document.getElementById('id01').style.display='block'" ><img src="images/edit.png" height="20" width="20" ></a>
                            </h4>
                           
                        </div>
                        <div class=" col-sm-3 scrapbox" >

                            <img src="images/pricelist/books.png" style="margin-left: 25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Books</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("Books")%> per kg <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h6>
                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/brass.png" style="margin-left: 25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Brass</h4>
                            <h4 style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("Brass")%> per kg <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h6>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/carton.png" style="margin-left:25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Carton House</h4>
                            <h4 style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("Carton_House")%> per kg <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h6>

                        </div>
                                                                                      
                    </div>
                    <!-- row 1 -->

                    <div class="row">
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/carton.png" style="margin-left: 25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Carton Shop</h4>
                            <h4 style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("Carton_Shop")%> per kg <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h6>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/ewaste.png" style="margin-left: 25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">E-Waste</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("E-Waste")%> per kg <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h6>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/fiber.png" style="margin-left: 25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Fiber</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("Fiber")%> per kg <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h6>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/hardplastic.png" style="margin-left: 25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Hard Plastic</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("Hard Plastic")%> per kg <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h6>

                        </div>

                    </div>
                    <!-- row 2 -->
                    <div class="row">
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/iron.png" style="margin-left: 25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Iron</h4
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("Iron")%> per kg <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h6>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/newspaper.png" style="margin-left: 25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Newspaper</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("Newspapers")%> per kg  <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h6>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/oilcovers.png" style="margin-left: 25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Oil,WaterCovers</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("Water/oilcovers")%> per kg  <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h6>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/paperwaste.png" style="margin-left:25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Paper Waste</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("Paperwaste")%> per kg  <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h6>

                        </div>

                    </div>
                    <!-- row 3 -->
                    <div class="row">
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/polyethene.png" style="margin-left: 25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Polyethene</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("Polyethene")%> per kg  <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h6>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/steel.png" style="margin-left: 25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Steel</h4>
                            <h4 style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("Steel")%> per kg  <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h6>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/tin.png" style="margin-left: 25px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Tin</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("Tin")%> per kg  <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h7>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/tyre.png" style="margin-left: 25px; margin-bottom: 0px;margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Tyre</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;"><%= scrapKartModel.getPrice("Tyre")%> per kg  <a onclick="document.getElementById('id01').style.display='block'"><img src="images/edit.png" height="20" width="20" ></a></h6>

                        </div>

                    </div>
                    <!-- row 4 -->
                    
                    <div id="id01" class="w3-modal">
                        <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:400px">
         
                         <div class="w3-center"><br>
                             <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close">&times;</span>
         
                         <form  class="w3-container " method="post" action="ChangeScrapRateServlet">
                             <div class="w3-section">
                                 <div class="form-group" style="text-align: center">
                                     <label style=" font-weight: bold; font-size: 30px; text-align: center; ">Change Rates</label><br><br>
                                     <label>Please confirm material category:</label><br>
                                     <input type="text" name="material" required><br>
                                     <br>
                                     <label>Enter New Rate:</label><br>
                                     <input type="text" name="newRate" required><br>
                                     <br>
                                     <input  type="submit"  class="btn btn-success"><br><br>
         
                                   </div>        
                             </div>
                             
                         </form>
                    </div> 
         
                    </div>
                 </div>                   
            </div>
        </div>
        <br>
        <div style="height:300px;background-color:rgb(6, 121, 92);"></div>
    </body>
</html>

