<%-- 
    Document   : ViewRequest
    Created on : 2 Mar, 2020, 10:25:01 AM
    Author     : HARSHITA JMA
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="scrapKart.pojo.FilterOptions"%>
<%@page import="java.sql.SQLException"%>
<%@page import="scrapKart.model.scrapKartModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="scrapKart.pojo.ViewRequestM2"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>ScrapKart DashBoard</title>
    <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/ViewRequest.css">
    
</head>
<body style=" background-color: rgba(178, 238, 144, 0.685)" onload="disableAll()">
    
    <div>
        <ul>
            <li id="logo"><img src="images/logo.jpg" alt="ScrapKart" height="60" width="100"></li>
            <li><a href="EmployeeLogin.html">Log out</a></li>
            <li><a href="DashBoard.html">DashBoard</a></li>
            <li><a href="request.html">View Request</a></li>
            <li><a href="request.html">Profile</a></li>    
        </ul>
        
     
            
                    <h3 style="text-align: center;">REQUESTS</h3>
              
            <div class="major">
               <div class="minor1">
                   <form  method="post" action="ViewRequestM2.jsp">
                    <h3>Filters</h3>
                 
                 <a onclick="window.location.href='ViewRequestM2.jsp'" class="resetAnchor" > <p style="color:graytext; font-size: small;float:right" onMouseOver="this.style.color=red" onMouseOut="this.style.color=gray">Reset Filters</p></a>
                   <br>
                    <label>Search by Request Id</label>
                    <a onclick="disable1()"><input type="text" id="ReqId" name="req_id" placeholder="Request Id" ></a>
                    <label >Search by Customer Name </label>
                   <a onclick="disable2()"> <input type="text" id="CustName" name="cust_name" placeholder="Customer Name"><br></a>
                    <label >Search by Date </label><br>
                   <a onclick="disable3()"><input type="text" pattern="\d{1,2}/\d{1,2}/\d{4}" class="datepicker" name="ondate" value="" placeholder="dd/mm/yyyy" id="ondate" /></a>
          
                    
                    <label >Search by Date Range</label><br>
                    <label > From</label><br>
                    <a onclick="disable4()"><input type="text" pattern="\d{1,2}/\d{1,2}/\d{4}" class="datepicker" name="fromdate" value="" placeholder="dd/mm/yyyy" id="fromdate"></a>
                    <label> To</label><br>
                    <a onclick="disable4()"><input type="text" pattern="\d{1,2}/\d{1,2}/\d{4}" class="datepicker" name="todate" value="" placeholder="dd/mm/yyyy" id="todate"></a>
                    
                    
                </form>
                   <input type="submit" value="Search Again" onclick="window.location.href='ViewRequestM2.jsp'">
               </div>
               <%
                     System.out.println("i am here!!!"+request.getParameter("cust_name"));
                    ArrayList<ViewRequestM2> request_List=new ArrayList<ViewRequestM2>();
                    
                     if(!(request.getParameter("req_id")==null))
                    {
                        String requestId=request.getParameter("req_id");
                        try
                        {  
                            request_List=scrapKartModel.FetchReqOnReqId(requestId);
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                        

                    }
                    else if(!(request.getParameter("cust_name")==null))
                    {
                        System.out.println("cusstomerrr");
                        String custName=request.getParameter("cust_name");
                        try
                        {
                            request_List=scrapKartModel.FetchReqOncustName(custName);
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        } 
                        
                    }
                    else if(!(request.getParameter("ondate")==null))
                    {
                       String onDate=request.getParameter("ondate");
                        try
                        {
                            request_List=scrapKartModel.FetchReqOnOndate(onDate);
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        } 
                    }
                    else
                    {
                        String fromdate=request.getParameter("fromdate");
                        String todate=request.getParameter("toDate");
                         try
                        {
                            request_List=scrapKartModel.FetchReqOnFromdate(fromdate,todate);
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        } 
                    }                     
               %>
               <div class="minor2"> 
                
                <button class="refresh">
                    <a onclick="window.location.reload();">  <img src="images/ref.png" height="20" width="20"> </a>
                     <span>Refresh</span>
                 </button>
                 <button class="refresh"  onclick="window.location.href='ViewRequestM2.jsp'">
                    <img src="images/product.png" height="20" width="20">
                    <span>Today's Requests</span>
                 </button>

                <br><br>   
                <table class="table table-hover reqTable" >
                         <thead class="rowhead">
                             <tr>
                                 <th>Id</th>
                                 <th>Requester</th>
                                 <th>Schedule</th>
                                 <th>Request Date</th>
                                 <th>Status</th>
                                 <th>Address</th> 
                                 <th></th>   
                            </tr>
                        </thead>
                        <tbody>

                             <%
                                 System.out.println("SIZE::::"+request_List.size());
                                 
                                for(ViewRequestM2 r:request_List)
                                {
                                    System.out.println("Request id in VIewFilteredREquestM2="+r.getReqId());
                                    String this_reqid=r.getReqId();
                                    String action="";
                             %>
                                        <tr>
                                           <td><%= r.getReqId()%></td> 
                                           <td><%= r.getName()%></td>
                                           <td><%= r.getSchedule()%></td>
                                           <td><%= r.getReq_date()%></td>
                                           <td><%= r.getStatus()%></td>
                                           <td><%= r.getAddress()%></td>
                                           <td>
                                            <div class="dropdown">
                                                <button class="dropbtn">Action</button>
                                                <div class="dropdown-content">
                                                    <% 
                                                     if(r.getStatus().equals("Completed")) 
                                                            action= "View Request";
                                                    else if(r.getStatus().equals("Assigned")) 
                                                            action= "Cancel Request";
                                                    else if(r.getStatus().equals("Pending"))
                                                            action= "Assign Request";
                                                    else 
                                                            action= "No Action";  
                                                    %>
                                                        <a data-id="<%= r.getReqId()%>"  onclick="fetchReqId(this,'<%= action %>');" style="font-size: 12px"><%=action%></a>                                                        
                                                            
                                                </div>
                                              </div>
                                           </td> 
                                         </tr>
                             <% } %>     
                        </tbody>
                        
                </table>
     
               </div>

            </div>  
    </div>
    <script>
    
        function disableAll()
        {
            document.getElementById("ReqId").disabled=true;
            document.getElementById("CustName").disabled=true;
            document.getElementById("ondate").disabled=true;
            document.getElementById("fromdate").disabled=true;
            document.getElementById("todate").disabled=true; 
            document.getElementById("ReqId").placeholder = "Request Id";
            document.getElementById("CustName").placeholder = "Customer Name";
            document.getElementById("ondate").placeholder = "dd-mm-yyyy";
            document.getElementById("fromdate").placeholder = "dd-mm-yyyy";
            document.getElementById("todate").placeholder = "dd-mm-yyyy";
        }
         function fetchReqId(d, action)
           {   
               
              alert(action);
               var req_id=d.getAttribute("data-id");
               if(action=="View Request")
                    window.location.replace("RequestInfoM2.jsp?req_id="+req_id);
               if(action=="Cancel Request")
               {
                   if(confirm("Cancel Request ?"))
                        window.location.replace("CancelReqM2.jsp?req_id="+req_id);
               }
               if(action=="Assign Request")
               {
                    //alert(action);
//                   window.location.replace("AssignRequestM2.jsp?req_id="+req_id);
                     document.getElementById('id01').style.display='block';           
               }

               else
               {
                   document.getElementById('id02').style.display='block';
               }
           }     
</script>
                        
     <!--                                               MODAL 1                                        -->
     
     <div class="w3 container">
           <div id="id01" class="w3-modal">
               <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

                <div class="w3-center"><br>
                    <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>

                    <form  class="w3-container " method="post" action="AssignReqServletM2">
                    <div class="w3-section">
                        <div class="form-group">
                            <label for="sel1" style="font-size:15px" >SELECT PICKUP BOY ID AND DATE:</label><br>
                            <label>Select PickUp Boy </label><br>
                            <select class="form-control" id="sel1" name="pkID"><br>
                                <!--ArrayList to be displayed using for loop-->
                                <option value="PB101" style="font-size:15px">PB101</option>
                                <option value="PB102" style="font-size:15px">PB102</option>
                                <option value="PB103" style="font-size:15px">PB103</option>
                                <option value="PB104" style="font-size:15px">PB104</option>
                                <option value="PB105" style="font-size:15px">PB105</option>
                             </select><br><br>
 
                              <label>Schedule On </label><br>
                              <input type="text" class="datepicker" name="schedulDate"  placeholder="dd-MON-yyyy" id="ondate" /><br>
                              <label>Please confirm Request Id </label><br>
                              <input type="text" name="requestId" placeholder="Enter Request Id here">
                      
                                <!--Add a text to enter date-->
                            <button class="btn btn-success" type="submit">Submit</button>
                          </div>        
                    </div>
                </form>
           </div> 
           </div>
        </div>
       </div>
     
      <!--                                               MODAL 2                                        -->
     
     <div class="w3 container">
           <div id="id02" class="w3-modal">
               <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

                <div class="w3-center"><br>
                    <span onclick="document.getElementById('id02').style.display='none'" class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>

                    <form  class="w3-container " method="post" action="AssignReqServletM2">
                    <div class="w3-section">
                        <div class="form-group">
                            <label for="sel1" style="font-size:15px" >Please confirm RequestId to Cancel Request:</label><br>
                            <label>Select PickUp Boy </label><br>
                            <select class="form-control" id="sel1" name="pkID"><br>
                                <!--ArrayList to be displayed using for loop-->
                                <option value="PB101" style="font-size:15px">PB101</option>
                                <option value="PB102" style="font-size:15px">PB102</option>
                                <option value="PB103" style="font-size:15px">PB103</option>
                                <option value="PB104" style="font-size:15px">PB104</option>
                                <option value="PB105" style="font-size:15px">PB105</option>
                             
                              <label>Schedule On </label><br>
                              <input type="text" class="datepicker" name="schedulDate"  placeholder="dd-MON-yyyy" id="ondate" /><br>
                              <label>Please confirm Request Id </label><br>
                              <input type="text" name="requestId" placeholder="Enter Request Id here">
                      
                            </select><br><br>
                                <!--Add a text to enter date-->
                            <button class="btn btn-success" type="submit">Submit</button>
                          </div>        
                    </div>
                </form>
           </div> 
           </div>
        </div>
       </div>
    
     
</body>


</html>