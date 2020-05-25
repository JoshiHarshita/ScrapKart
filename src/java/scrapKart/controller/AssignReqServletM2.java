/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scrapKart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import scrapKart.dbutil.DBConnection;
import scrapKart.model.scrapKartModel;

/**
 *
 * @author HARSHITA JMA
 */
@WebServlet(name = "AssignReqServletM2", urlPatterns = {"/AssignReqServletM2"})
public class AssignReqServletM2 extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        PrintWriter out = response.getWriter();
        String pkId=request.getParameter("pkID");
        String scheduleDate=request.getParameter("scheduleDate");
        String requestId=request.getParameter("requestId");
        
        try 
        {
            boolean result=scrapKartModel.assignRequest(pkId, scheduleDate, requestId);
            if(result==true)
            {
                response.sendRedirect("ViewRequestM2.jsp?assign=true");
//                out.println("<script type=\"text/javascript\">");  
//                out.println("alert('Request Assigned!');");  
//                out.println("</script>");  
            }
            else
            {
                response.sendRedirect("error.jsp");
//                out.println("<script type=\"text/javascript\">");  
//                out.println("alert('Request Not Assigned.. Something went Wrong!!');");  
//                out.println("</script>"); 
            }
            
        } 
        catch (SQLException ex) 
        {
            ex.printStackTrace();
            Logger.getLogger(AssignReqServletM2.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

}
