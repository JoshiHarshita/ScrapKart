
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

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {
        PrintWriter out=response.getWriter();
        out.println("Servlet opened!!");
        String email=request.getParameter("email");
        String pass=request.getParameter("password");      
        boolean result;
        try 
        {
            result = scrapKartModel.loginValidate(email,pass);

           // out.println("Fun Run!!");
            if(result==true)
            {
                HttpSession session=request.getSession();
                session.setAttribute("user_mail", email);
                out.println("Successfull!!");
                response.sendRedirect("requestForm.jsp");
            }
            else
            {
                  response.sendRedirect("login.jsp?isvalid=false");
            }
        }
        catch (SQLException ex)
        {
            ex.printStackTrace();
        }
        
    }

}  

