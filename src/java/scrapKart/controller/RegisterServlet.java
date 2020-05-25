 
package scrapKart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import scrapKart.model.scrapKartModel;
import scrapKart.pojo.Customer;


@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out=response.getWriter();
            out.println("Servlet opened!!");
            String name=request.getParameter("Name");
            String email=request.getParameter("email");
            String pass=request.getParameter("password");
            String confirm_pass=request.getParameter("confirm_password");
            String contact=request.getParameter("Contact");
            String city=request.getParameter("City");
            String street=request.getParameter("Street");
            String landmark=request.getParameter("Landmark");
            String house_no=request.getParameter("House_no");
            String add_type=request.getParameter("Add_type");
            HttpSession session=request.getSession();
            if(!pass.equals(confirm_pass))
            {
                //Send Redirect passwords didnt matched!!!
            }
            else{
                Customer cust=new Customer();
                cust.setName(name);
                cust.setCity(city);
                cust.setContact(contact);
                cust.setPassword(pass);
                cust.setEmail(email);
                cust.setLandmark(landmark);
                cust.setStreet(street);
                cust.setHouse_no(house_no);
                cust.setAdd_type(add_type);
                
                try
                {
                    out.println("Register?!");
                    boolean status=scrapKartModel.registerUser(cust);
                    System.out.println(status);
                    if(status==true)
                    { 
                        System.out.println("Registered!");
                        response.sendRedirect("login.jsp?Regisvalid=true");                        
                    }
                    else
                    {
                       System. out.println("not Registered!");
                        response.sendRedirect("login.jsp?Regisvalid=false");
                    }
                }
                catch(SQLException ex)
                {
                    response.sendRedirect("login.jsp?Regisvalid=false");
                   ex.printStackTrace();
                }
            }
            
            
    }

   
}
