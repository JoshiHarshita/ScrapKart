<%-- 
    Document   : requestForm
    Created on : 23 Dec, 2019, 4:22:28 PM
    Author     : HARSHITA JMA
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="scrapKart.model.scrapKartModel"%>
<%@page import="scrapKart.pojo.Request"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>My Request</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/request.css">
        
        <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
    </head>
    <body>
        <div>
            <ul>
                <li id="logo"><a href="logout.jsp"><img src="images/logo.jpg" alt="ScrapKart" height="60" width="100"></a></li>
                <li><a href="logout.jsp">LogOut</a></li>
                <li><a href="www.google.com">Contact</a></li>
                <li><a   onclick="add_req_fun()">Request PickUp</a></li>
                <li><a href="www.google.com">Price List</a></li>
            
            </ul>
            
        </div>
             <%
            String user=session.getAttribute("user_mail").toString();
            ArrayList<Request> req=new ArrayList<Request>();
           
            try
            {
                System.out.println("Inside try of requestform where function is called before getall request is called!!");
                req=scrapKartModel.getAllRequests(user);
                System.out.println("Inside try of requestform where function is called!!");
            }
            catch(SQLException e)
             {
                 e.printStackTrace();
             }
            int count=0;
            //            Function for canceling request              //
//            System.out.println("Ready to call camcel request!!");
//            String cancel_req=request.getParameter("cancel_Req");
//            System.out.println("cancel request="+cancel_req);
//            String req_id=request.getParameter("req_id");
//            if(cancel_req.equals("true"))
//            {
//                try
//                {
//                     System.out.println(" call camcel request!!");
//                    boolean result=scrapKartModel.cancelRequest(req_id);
//                     System.out.println(" called camcel request!!");
//                }
//                catch(SQLException e)
//                {
//                    e.printStackTrace();
//                }
//            }
            
         %>
         
         <div class="username"><h2>Welcome <%= user%>!</h2></div>
       
       <div class="nav2">
            <a href="viewProfile.jsp">View Profile</a>
            <a href="editProfile.jsp">Edit Profile</a>
        </div>
        <div class="container">
        <div class="row" >  
            <div class="heading"><h2>Request Status</h2></div>  
            <div class="col-sm-12 requestTable">
            
               <table>
                    <tr>
                        <th>Request</th>
                        <th>Requested Date</th>
                        <th>Scheduled Date</th>
                        <th>Address</th>
                        <th>Type</th>
                        <th>Status</th>
                       
                    </tr>
                                                                                                                                                                                                               <%
                        for(Request r:req)
                        { 
                            count++;
                            %>
                            
                    <tr id="<%= r.getReq_id()%>"> 
                        <td><%= count%></td>
                        <td><%= r.getReq_date() %></td>
                        <td><%= r.getSchd_date() %></td>
                        <td><%= r.getAddress() %></td>
                        <td><%= r.getReq_type() %></td>
                        <%if(r.getStatus().equals("Completed")) {%>
                        <td ><a data-id="<%= r.getReq_id()%>"  onclick="fetchReqId(this);"data-toggle="tooltip" title="Click to view Description"><%= r.getStatus() %></a></td>
                         <% }
                        else{  %>
                         <td><a data-id="<%= r.getReq_id()%>" onclick="CancelReq(this);" data-toggle="tooltip" title="Click to Cancel Request"><%= r.getStatus() %> </a></td>
                         <% } %>
                    </tr>
                    <% }
                    %>
                 
               </table>
               <br><br>   
                 
               <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-large myclick">+ Add Request</button>
            </div>
           <div class="w3 container">
           <div id="id01" class="w3-modal">
               <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

                <div class="w3-center"><br>
                    <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>

                    <form  class="w3-container " method="post" action="AddReqServlet">
                    <div class="w3-section">
                        <div class="form-group">
                            <label for="sel1" style="font-size:20px" >Select Request Type:</label>
                            <select class="form-control" id="sel1" name="reqType">
                                <option value="pickup" style="font-size:15px">PickUp</option>
                                <option value="visit" style="font-size:15px">Visit</option>
                            </select><br><br>
                      
                            <label for="comment" style="font-size:20px">Add Description:</label>
                            <textarea class="form-control"rows="5" id="comment" name="desc"></textarea><br><br>
                            <button class="btn btn-success" type="submit">Submit</button>

                          </div>        
                    </div>
                    
                </form>
           </div> 

           </div>
        </div>
       </div>
        
    </body>
      <%
        String status=request.getParameter("addReqisValid");
        if(status!=null&&status.equals("false")){
        
     %>
      <script>
         alert("Something went Wrong! Please Add request Again!");
     </script>
     <%
         }
            else if(status!=null)
        {
      %>
    <script>
         alert("Request Added!!");
     </script>
     <%
         }
      %>
  

      <script>
          function add_req_fun()
          {
              document.getElementById('id01').style.display='block';
          }
      </script>
      <script>
           function fetchReqId(d)
           {   
               alert("PeClicked");
               var req_id=d.getAttribute("data-id");
               window.location.replace("RequestInfo.jsp?req_id="+req_id);
           } 
           function CancelReq(d)
           {
               alert("Pending Clicked");
               var req_id=d.getAttribute("data-id");
               
               alert("req_id");
               
               if(window.XMLHttpRequest)
               {
                   request=new XMLHttpRequest();
               }
               
               
                   request.onreadystatechange=function(){
                   
                        if(this.readyState==4&&this.status==0)
                        {
                            var this_request_id=request.responseText;     
                            document.getElementById("req_id").remove();  
                        }
                   };
                   request.open("GET","CancelReqServlet2?"+req_id,true);
                   request.send();
               
              alert("***");
               
           }
           
//           function getInfo(var req_id)
//           {
//               if(request.readyState==4)
//               {
//                   var this_request_id=request.responseText;     
//                   document.getElementById("req_id").remove();  
//               }
//           }
      </script>
      <%  
        String request_id=request.getParameter("req_id");
        System.out.println(request_id);
       %>
       

</html>

