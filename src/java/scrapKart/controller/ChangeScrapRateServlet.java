/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scrapKart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import scrapKart.model.scrapKartModel;

/**
 *
 * @author HARSHITA JMA
 */
@WebServlet(name = "ChangeScrapRateServlet", urlPatterns = {"/ChangeScrapRateServlet"})
public class ChangeScrapRateServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {        
        PrintWriter out = response.getWriter();
        String material=request.getParameter("material");
        Float scrap_price=Float.parseFloat(request.getParameter("newRate"));
        try
        {   
            boolean result=scrapKartModel.changeScrapPrice(material, scrap_price);
            if(result==true)
                response.sendRedirect("PriceListM2.jsp");
            
                
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
       
    }

  
   

}
