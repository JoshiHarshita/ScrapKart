
package scrapKart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import scrapKart.dbutil.DBConnection;
import scrapKart.model.scrapKartModel;
import scrapKart.pojo.Customer;
import scrapKart.pojo.NewRequest;

@WebServlet(name = "EditProfileServlet", urlPatterns = {"/EditProfileServlet"})
public class EditProfileServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException        
    {   
        PrintWriter out = response.getWriter();
        String name=request.getParameter("Name");
        String contact=request.getParameter("Contact");
        String city=request.getParameter("City");
        String street=request.getParameter("Street");
        String landmark=request.getParameter("Landmark");
        String house_no=request.getParameter("House_no");
        String add_type=request.getParameter("Add_type");
        HttpSession session=request.getSession();
        String user=session.getAttribute("user_mail").toString();
        String pass="";
        try
        {
            Connection conn=DBConnection.getConnection();
            PreparedStatement ps=conn.prepareStatement("select password from customers where customer_id="+"'"+user+"'");
            ResultSet rs=ps.executeQuery();
            while(rs.next()){
              pass=rs.getString("password");  
            }
            
        }
        catch(SQLException e)
        {
            e.printStackTrace();        
        }
        Customer c=new Customer();
        c.setName(name);
        c.setEmail(user);
        c.setPassword(pass);
        c.setContact(contact);
        c.setCity(city);
        c.setStreet(street);
        c.setLandmark(landmark);
        c.setHouse_no(house_no);
        c.setAdd_type(add_type);
                try
                {
                    out.println("Register?!");
                    boolean status=scrapKartModel.editUser(c);
                    System.out.println(status);
                    if(status==true)
                    { 
                        out.println(" EditionRegistered!");
                        response.sendRedirect("requestForm.jsp?Editisvalid=true");                        
                    }
                    else
                    {
                        out.println("not Registered!");
                        response.sendRedirect("requestForm.jsp");
                    }
                }
                catch(SQLException ex)
                {
                   response.sendRedirect("requestForm.jsp");
                }               
    }
}
