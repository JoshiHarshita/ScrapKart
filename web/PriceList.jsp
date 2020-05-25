<%-- 
    Document   : PriceList.jsp
    Created on : 10 Mar, 2020, 5:22:11 PM
    Author     : HARSHITA JMA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>PriceList</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
         <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="css/PriceList.css">
     
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
                <span><a href="www.google.com">Price List</a></span>
                <span><a onclick="alert('Please Login first!');">Request PickUp</a></span>
                <span><a href="login.jsp">Login/Register</a></span>
            </div>
        </div>
        <br>
        <br>
        <!-- <hr> -->
        <div class="container-fluid" >
            <div class="container" style="background-color: white; height: 1200px;">
                    <h3 style="text-align: center;">Rates of Scrap</h3>
                    <div class="row">
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/aluminium.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Aluminium</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>
                        </div>
                        <div class=" col-sm-3 scrapbox" >

                            <img src="images/pricelist/books.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Books</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>
                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/brass.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Brass</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/carton.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Carton House</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>

                        </div>

                    </div>
                    <!-- row 1 -->

                    <div class="row">
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/carton.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Ccarton Shop</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/ewaste.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">E-Waste</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/fiber.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Fiber</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/hardplastic.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Hard Plastic</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>

                        </div>

                    </div>
                    <!-- row 2 -->
                    <div class="row">
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/iron.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Iron</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/newspaper.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Newspaper</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/oilcovers.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h5 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Oil,WaterCovers</h5>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/paperwaste.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Paper Waste</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>

                        </div>

                    </div>
                    <!-- row 3 -->
                    <div class="row">
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/polyethene.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Polyethene</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/steel.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Steel</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/tin.png" style="margin-left: 30px; margin-bottom: 0px; margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Tin</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>

                        </div>
                        <div class=" col-sm-3 scrapbox" >
                            <img src="images/pricelist/tyre.png" style="margin-left: 30px; margin-bottom: 0px;margin-top: 10px;" height="100" width="100">
                            <br>
                            <h4 style="text-align: center; color:green;margin-top: 0px; font-weight: bold;">Tyre</h4>
                            <h4  style="text-align: center; color:black;margin-top: 0px; font-weight: bold;">Rate</h4>

                        </div>

                    </div>
                    <!-- row 4 -->

                    <br><br>
                    <button type="button" class="btn btn-primary" style="margin-left: 35%; font-size: x-large;" > Calculate Estimate Price of your Scrap</button>
            </div>
            


        </div>
        <br>
        <div class="container-fluid" style="height: 300px; background-color:#003F2A;">
    </body>
</html>

