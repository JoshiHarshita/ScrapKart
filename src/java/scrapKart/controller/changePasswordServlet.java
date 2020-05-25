
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

@WebServlet(name = "changePasswordServlet", urlPatterns = {"/changePasswordServlet"})
public class changePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out= response.getWriter() ;
        String new_password=request.getParameter("new_password");
        String prev_password=request.getParameter("password");
        HttpSession session=request.getSession();
        String user=session.getAttribute("user_mail").toString();
        String dbPassword="";
        try
        {
            Connection conn=DBConnection.getConnection();
            PreparedStatement ps=conn.prepareStatement("select password from customers where customer_id="+"'"+user+"'");
            ResultSet rs=ps.executeQuery();  
            while(rs.next())
            {
                 dbPassword=rs.getString("password");
            } 
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        if(!dbPassword.equals(prev_password))
            response.sendRedirect("Error.jsp?password_match=false");
        else
        {
           
            try {
                boolean result=scrapKartModel.changePassword(new_password,user);
                if(result==true)
                {
                    response.sendRedirect("editProfile.jsp");
                }
                else
                {
                    response.sendRedirect("requestForm.jsp");
                }

            } 
            catch (SQLException ex)
            {
                ex.printStackTrace();
                Logger.getLogger(changePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }

    
}
