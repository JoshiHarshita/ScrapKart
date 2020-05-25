
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
import scrapKart.pojo.NewRequest;

@WebServlet(name = "AddReqServlet", urlPatterns = {"/AddReqServlet"})
public class AddReqServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
        String req_type=request.getParameter("reqType");
        String description=request.getParameter("desc");
        HttpSession session=request.getSession();   
       
        try 
        {
            NewRequest req= new NewRequest();
            String request_id=scrapKartModel.getNewReq_Id();
            String request_date=scrapKartModel.getCurr_Date();
            String user=session.getAttribute("user_mail").toString();
            Connection conn=DBConnection.getConnection();
            PreparedStatement ps=conn.prepareStatement("select phone_no from customers where customer_id="+"'"+user+"'");
            ResultSet rs=ps.executeQuery(); 
            String contact="",add_no="";
            while(rs.next())
            { contact=rs.getString("phone_no");}
            PreparedStatement ps2=conn.prepareStatement("select add_no from address_book where cust_id="+"'"+user+"'");
            ResultSet rs2=ps2.executeQuery();
            while(rs2.next())
            { add_no=rs2.getString("add_no");}
            System.out.println("Servlet11111111");
            req.setAdd_no(add_no);
            req.setAdditional_details(description);
            req.setContact_no(contact);
            req.setCust_no(user);
            req.setReq_date(request_date);
            req.setReq_id(request_id);
            req.setRequest_type(req_type);
            System.out.println("Servlet22222222");
            boolean status=scrapKartModel.addNewRequest(req);
            if(status==true)
            {
                System.out.println("ServletTRUE");
                response.sendRedirect("requestForm.jsp?addReqisValid=true");
            }
            else
            {
                 System.out.println("ServletFALSE");
                response.sendRedirect("requestForm.jsp?addReqisValid=false");
            }
            
        } catch (SQLException ex) {
           ex.printStackTrace();
        }
        
        
    }
}
