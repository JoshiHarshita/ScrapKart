
package scrapKart.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import scrapKart.dbutil.DBConnection;
import scrapKart.pojo.Customer;
import scrapKart.pojo.FilterOptions;
import scrapKart.pojo.Material;
import scrapKart.pojo.NewRequest;
import scrapKart.pojo.Request;
import scrapKart.pojo.PickUpBoy;
import scrapKart.pojo.ViewRequestM2;

/**
 *
 * @author HARSHITA JMA
 */
public class scrapKartModel {
    public static boolean loginValidate(String email,String pass) throws SQLException
    {
         
            Connection conn=DBConnection.getConnection();
            System.out.println("*****************************");
            PreparedStatement ps=conn.prepareStatement("select password from customers where customer_id=?");
            ps.setString(1,email);
            System.out.println("Inside LoginValidate!!");
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                String password=rs.getString(1);
                if(pass.equals(password))
                {
                    rs.close();
                    return true;
                }
                else
                {
                    rs.close();
                    return false;
                }
            }
            else
            {
                rs.close();
                return false;
            }        
    }
   
    public static String getNewAdd_Id() throws SQLException
    {
        Connection conn=DBConnection.getConnection();
        PreparedStatement ps=conn.prepareStatement("select count(*)from address_book");
        ResultSet rs=ps.executeQuery();
        int id=1001;
        if(rs.next())
        {
            id=id+rs.getInt(1);
        }
        return "A"+id;
    }
    public static String getNewReq_Id() throws SQLException
    {
        Connection conn=DBConnection.getConnection();
        PreparedStatement ps=conn.prepareStatement("select count(*) from request");
        ResultSet rs=ps.executeQuery();
        int id=4001;
        if(rs.next())
        {
            id=id+rs.getInt(1);
        }
        return "R"+id;
    }
    public static String getCurr_Date() throws SQLException
    {
        Date date=new Date();
        SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-YYYY");
        String curr_date=sdf.format(date);
        return curr_date;
        
    }
    public static boolean addNewRequest(NewRequest r) throws SQLException
    {
        Connection conn=DBConnection.getConnection();
        PreparedStatement ps=conn.prepareStatement("insert into request values(?,?,?,?,?,?,?,?)");
        ps.setString(1,r.getReq_id());
        ps.setString(2, r.getReq_date());
        ps.setString(3, r.getContact_no());
        ps.setString(4,r.getCust_no());
        ps.setString(5, r.getAdd_no());
        ps.setString(6,r.getRequest_type());
        ps.setString(7, null);
        ps.setString(8, r.getAdditional_details());
        int rows=ps.executeUpdate();     
        ////////////////////////////////////////////////////////////////////////////////////
        PreparedStatement ps1=conn.prepareStatement("insert into assign values(?,?,?,?,?,?)");
        ps1.setString(1,r.getReq_id());
        ps1.setString(2,"M3001");
        ps1.setString(3,null);
        ps1.setString(4,null);
        ps1.setString(5, "Pending");
        ps1.setString(6, null);
        int rows1=ps1.executeUpdate();
        
        if(rows>0&&rows1>0)
            return true;
        else
            return false;
    }
    public static boolean cancelRequest(String req_id) throws SQLException
    {
        Connection conn=DBConnection.getConnection();
        PreparedStatement ps=conn.prepareStatement("delete from request where req_id="+"'"+req_id+"'");
        int rows1=ps.executeUpdate();
        PreparedStatement ps1=conn.prepareStatement("delete from assign where req_id="+"'"+req_id+"'");
        int rows2=ps.executeUpdate();
        PreparedStatement ps2=conn.prepareStatement("delete from scrap where req_id="+"'"+req_id+"'");
        int rows3=ps.executeUpdate();
        
        if(rows1>0&&rows2>0&&rows3>0)
            return true;
        else
            return false;
    }
    public static boolean registerUser(Customer c) throws SQLException
    {
        Connection conn=DBConnection.getConnection();
        PreparedStatement ps=conn.prepareStatement("insert into customers values(?,?,?,?)");
        ps.setString(1,c.getEmail());
        ps.setString(2,c.getName());
        ps.setString(3,c.getContact());
        ps.setString(4,c.getPassword());
        int rows1=ps.executeUpdate();
        System.out.println("Rows="+rows1);        
        String a_id=scrapKartModel.getNewAdd_Id();
        System.out.println("address_id="+a_id);
        PreparedStatement ps1=conn.prepareStatement("insert into address_book values(?,?,?,?,?,?)");
        ps1.setString(1,a_id);
        ps1.setString(2,c.getEmail());
        ps1.setString(3,c.getAdd_type());
        ps1.setString(4,c.getStreet());
        ps1.setString(5,c.getLandmark());
        ps1.setString(6,c.getHouse_no());
        int rows2=ps1.executeUpdate();
        
       System.out.println("Rows Updated="+rows2);
        if(rows1>0&&rows2>0)
             return true;
        else
            return false;     
    }
    public static boolean editUser(Customer c) throws SQLException
    {
        Connection conn=DBConnection.getConnection();
        PreparedStatement ps1=conn.prepareStatement("update customers set customer_name="+"'"+c.getName()+"'"+", phone_no="+"'"+c.getContact()+"'"+"where customer_id="+"'"+c.getEmail()+"'");
        int row1=ps1.executeUpdate();
        
        PreparedStatement ps2=conn.prepareStatement("update address_book set add_type="+"'"+c.getAdd_type()+"'"+", street="+"'"+c.getStreet()+"'"+", landmark="+"'"+c.getLandmark()+"'"+", house_no="+"'"+c.getHouse_no()+"'"+"where cust_id="+"'"+c.getEmail()+"'");
        int row2=ps2.executeUpdate();
        
        if(row1>0&&row2>0)
            return true;
        else
            return false;
    }
    public static ArrayList<Request> getAllRequests(String user_id) throws SQLException
    {
       Connection conn=DBConnection.getConnection();
       PreparedStatement ps=conn.prepareStatement("select request_date,schedule_date,request_type,street,landmark,house_no,status,req_id from request  inner join address_book  on request.add_no=address_book.add_no inner join assign on assign.req_id=request.req_id inner join customers c on c.customer_id= request.cust_id and c.customer_id ="+"'"+user_id+"'");
       ResultSet rs=ps.executeQuery();
       ArrayList<Request> requestList=new ArrayList<Request>();  
       //System.out.println("*************************");
       while(rs.next())
       {
           Request obj=new Request();
           java.sql.Date d1=rs.getDate("request_date");
           java.sql.Date d2=rs.getDate("schedule_date");
           SimpleDateFormat sdf1=new SimpleDateFormat("dd-MM-YYYY");
           String request_date=sdf1.format(d1);
           if(d2==null)
           {    System.out.println("I am innnnn!");
               obj.setSchd_date("-");
           }
           else
           {
              String schedule_date=sdf1.format(d2); 
              obj.setSchd_date(schedule_date);
           }
           
           obj.setReq_date(request_date);         
           obj.setReq_type(rs.getString("request_type"));
           obj.setAddress(rs.getString("house_no")+","+rs.getString("street")+"   near, "+rs.getString("landmark")+" Bhopal");
           obj.setReq_id(rs.getString("req_id"));
           obj.setStatus(rs.getString("status"));
           System.out.println("**********Request Date:"+request_date);
           requestList.add(obj);
           System.out.println("Request object Added");
       }  
       System.out.println(" statement before return requestList in getallrequest function");
       return requestList;
      
    }    
    public static ArrayList<Customer> getAllCustomer(String user_id) throws SQLException
    {
        Connection conn= DBConnection.getConnection();
        PreparedStatement ps= conn.prepareStatement("select customer_name,phone_no,street,landmark,house_no from customers inner join address_book on customers.customer_id=address_book.cust_id and customer_id="+"'"+user_id+"'");
        ResultSet rs=ps.executeQuery();
        ArrayList<Customer> custList=new ArrayList<Customer>();
        while(rs.next())
        {
            Customer obj=new Customer();
            obj.setName(rs.getString("customer_name"));
            obj.setEmail(user_id);
            obj.setContact(rs.getString("phone_no"));
            obj.setStreet(rs.getString("street"));
            obj.setLandmark(rs.getString("landmark"));
            obj.setCity("Bhopal");
            obj.setHouse_no(rs.getString("house_no"));  
            custList.add(obj);
        }
        return custList;
    }
   public static Request getRequestDetails(String req_id) throws SQLException
   {
       Connection conn=DBConnection.getConnection();
       PreparedStatement ps=conn.prepareStatement("select request_date,schedule_date,request_type,street,landmark,house_no,street from request  inner join address_book on request.cust_id =address_book.cust_id where req_id="+"'"+req_id+"'");
       ResultSet rs=ps.executeQuery();
       Request obj=new Request();
       while(rs.next()){         
           java.sql.Date d1=rs.getDate("request_date");
           java.sql.Date d2=rs.getDate("schedule_date");
           SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-YYYY");
           String request_date=sdf.format(d1);
           String schedule_date=sdf.format(d2);
           obj.setReq_date(request_date);
           obj.setSchd_date(schedule_date);
           obj.setReq_type(rs.getString("request_type"));
           obj.setAddress(rs.getString("house_no")+","+rs.getString("street")+"   near, "+rs.getString("landmark")+" Bhopal");
                        
       }
       System.out.println(obj.getReq_date());
       System.out.println(obj.getSchd_date());
       System.out.println(obj.getReq_type());
       return obj;
   }
   public static PickUpBoy getPickUpBoyDetails(String req_id) throws SQLException
   {
       Connection conn=DBConnection.getConnection();
       PreparedStatement ps= conn.prepareStatement("select name,contact_no from employee inner join assign on assign.pk_id=employee.emp_id where assign.req_id="+"'"+req_id+"'");
       ResultSet rs=ps.executeQuery();
        PickUpBoy obj = new PickUpBoy();
       while(rs.next())
       { 
           obj.setName(rs.getString("name"));
           obj.setContact_no(rs.getString("contact_no"));  
       }
       return obj;
   }
   public static ArrayList<Material> getMaterialDetails(String req_id) throws SQLException
   {
       Connection conn=DBConnection.getConnection();
       PreparedStatement ps= conn.prepareStatement("select material_cost,material_type,total_weight,scrap_cost from material inner join  scrap on scrap.material_id=material.material_id where scrap.req_id="+"'"+req_id+"'");
       ResultSet rs=ps.executeQuery();
       ArrayList<Material> material_list=new ArrayList<Material>();
       while( rs.next())
       {
           Material obj= new Material();
           obj.setScrapItem(rs.getString("material_type"));
           obj.setCost(rs.getFloat("scrap_cost"));
           obj.setRate(rs.getFloat("material_cost"));
           obj.setWeight(rs.getFloat("total_weight"));
           material_list.add(obj);
          
       }
       return material_list;
   }
   
   //////////////////////////////////////////////MODULE-2///////////////////////////////////////////////////
   
   public static ArrayList<ViewRequestM2> getTodaysRequest() throws SQLException
   {
        Connection conn=DBConnection.getConnection();
        String today_date= new SimpleDateFormat("dd/MM/YYYY").format(new Date());
        System.out.println("Today:"+today_date);
        PreparedStatement ps= conn.prepareStatement("select customer_name,customer_id ,req_id,schedule_date,request_date,street,landmark,house_no,status from request  inner join address_book  on request.add_no=address_book.add_no inner join assign on assign.req_id=request.req_id inner join customers c on c.customer_id= request.cust_id and request_date="+"'"+today_date+"'");
        ResultSet rs=ps.executeQuery();
        ArrayList<ViewRequestM2> req_List=new ArrayList<ViewRequestM2>();
        while(rs.next())
        {
            System.out.println("*");
            ViewRequestM2 obj=new ViewRequestM2();
            java.sql.Date d1=rs.getDate("request_date");
            SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-YYYY");
            String request_date=sdf.format(d1);
            
            String scheduled_date=rs.getString("schedule_date");
            if(scheduled_date==null)
                scheduled_date="Not Scheduled";
            else
            {
                java.sql.Date d2=rs.getDate("schedule_date");
                scheduled_date=sdf.format(d2);
            }            
            obj.setCust_id(rs.getString("customer_id"));
            obj.setName(rs.getString("customer_name"));
            obj.setReqId(rs.getString("req_id"));
            obj.setSchedule(scheduled_date);
            obj.setReq_date(request_date);
            obj.setAddress(rs.getString("house_no")+" , "+rs.getString("street")+"   near, "+rs.getString("landmark")+" Bhopal");
            obj.setStatus(rs.getString("status"));
            req_List.add(obj);
        }
        return req_List;
   }
   public static ArrayList<ViewRequestM2> FetchReqOnReqId(String request_id) throws SQLException
   {
       Connection conn=DBConnection.getConnection();
       PreparedStatement ps=conn.prepareStatement("select customer_name,customer_id ,req_id,schedule_date,request_date,street,landmark,house_no,status from request  inner join address_book  on request.add_no=address_book.add_no inner join assign on assign.req_id=request.req_id inner join customers c on c.customer_id= request.cust_id and request.req_id="+"'"+request_id+"'");
       ResultSet rs=ps.executeQuery();
       ArrayList<ViewRequestM2> req_List=new ArrayList<ViewRequestM2>();
       while(rs.next())
       {
           ViewRequestM2 obj=new ViewRequestM2();
            java.sql.Date d1=rs.getDate("request_date");
            SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-YYYY");
            String request_date=sdf.format(d1);
            
            String scheduled_date=rs.getString("schedule_date");
            if(scheduled_date==null)
                scheduled_date="Not Scheduled";
            else
            {
                java.sql.Date d2=rs.getDate("schedule_date");
                scheduled_date=sdf.format(d2);
            }
            obj.setCust_id(rs.getString("customer_id"));
            obj.setName(rs.getString("customer_name"));
            obj.setReqId(rs.getString("req_id"));
            obj.setSchedule(scheduled_date);
            obj.setReq_date(request_date);
            obj.setAddress(rs.getString("house_no")+" , "+rs.getString("street")+"   near, "+rs.getString("landmark")+" Bhopal");
            obj.setStatus(rs.getString("status"));
            req_List.add(obj);
       }           
       return req_List;   
   }
  
   public static ArrayList<ViewRequestM2> FetchReqOncustName(String name) throws SQLException
   {
       Connection conn=DBConnection.getConnection();
       System.out.println("is it Poornima?????"+name);
       PreparedStatement ps=conn.prepareStatement("select customer_name,customer_id ,req_id,schedule_date,request_date,street,landmark,house_no,status from request  inner join address_book  on request.add_no=address_book.add_no inner join assign on assign.req_id=request.req_id inner join customers c on c.customer_id= request.cust_id and c.customer_name="+"'"+name+"'");
       ResultSet rs=ps.executeQuery();
       ArrayList<ViewRequestM2> req_List=new ArrayList<ViewRequestM2>();
       while(rs.next())
       {
            ViewRequestM2 obj=new ViewRequestM2();
            java.sql.Date d1=rs.getDate("request_date");
            SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-YYYY");
            String request_date=sdf.format(d1);
            
            String scheduled_date=rs.getString("schedule_date");
            if(scheduled_date==null)
                scheduled_date="Not Scheduled";
            else
            {
                java.sql.Date d2=rs.getDate("schedule_date");
                scheduled_date=sdf.format(d2);
            }
            obj.setCust_id(rs.getString("customer_id"));
            obj.setName(rs.getString("customer_name"));
            obj.setReqId(rs.getString("req_id"));
            obj.setSchedule(scheduled_date);
            obj.setReq_date(request_date);
            obj.setAddress(rs.getString("house_no")+" , "+rs.getString("street")+"   near, "+rs.getString("landmark")+" Bhopal");
            obj.setStatus(rs.getString("status"));
            req_List.add(obj);
       }
         System.out.println("Inside scrapKartModel="+req_List.size()); 
         return req_List;
       
   }
   public static ArrayList<ViewRequestM2> FetchReqOnOndate(String date) throws SQLException
   { 
   
       
        System.out.println("Ondate="+date);
        
        Connection conn=DBConnection.getConnection();
        PreparedStatement ps= conn.prepareStatement("select customer_name,customer_id ,req_id,schedule_date,request_date,street,landmark,house_no,status from request  inner join address_book  on request.add_no=address_book.add_no inner join assign on assign.req_id=request.req_id inner join customers c on c.customer_id= request.cust_id and request_date="+"'"+date+"'");
        ResultSet rs=ps.executeQuery();
        
        ArrayList<ViewRequestM2> req_List=new ArrayList<ViewRequestM2>();
        while(rs.next())
        {
            ViewRequestM2 obj=new ViewRequestM2();
            java.sql.Date d1=rs.getDate("request_date");
            SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-YYYY");
            String request_date=sdf.format(d1);
            
            String scheduled_date=rs.getString("schedule_date");
            if(scheduled_date==null)
                scheduled_date="Not Scheduled";
            else
            {
                java.sql.Date d2=rs.getDate("schedule_date");
                scheduled_date=sdf.format(d2);
            }
            obj.setCust_id(rs.getString("customer_id"));
            obj.setName(rs.getString("customer_name"));
            obj.setReqId(rs.getString("req_id"));
            obj.setSchedule(scheduled_date);
            obj.setReq_date(request_date);
            obj.setAddress(rs.getString("house_no")+" , "+rs.getString("street")+"   near, "+rs.getString("landmark")+" Bhopal");
            obj.setStatus(rs.getString("status"));
            req_List.add(obj);
        }
        return req_List;
       
   }
   public static ArrayList<ViewRequestM2> FetchReqOnFromdate(String date1,String date2) throws SQLException
   {
      Connection conn=DBConnection.getConnection();
        PreparedStatement ps= conn.prepareStatement("select customer_name,customer_id,req_id,schedule_date,request_date,street,landmark,house_no,status from request  inner join address_book  on request.add_no=address_book.add_no inner join assign on assign.req_id=request.req_id inner join customers c on c.customer_id= request.cust_id and request_date between"+"'"+date1+"'"+"and"+"'"+date2+"'");
        ResultSet rs=ps.executeQuery();
        ArrayList<ViewRequestM2> req_List=new ArrayList<ViewRequestM2>();
        while(rs.next())
        {
            ViewRequestM2 obj=new ViewRequestM2();
            java.sql.Date d1=rs.getDate("request_date");
            SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-YYYY");
            String request_date=sdf.format(d1);
            
            String scheduled_date=rs.getString("schedule_date");
            if(scheduled_date==null)
                scheduled_date="Not Scheduled";
            else
            {
                java.sql.Date d2=rs.getDate("schedule_date");
                scheduled_date=sdf.format(d2);
            }
      
            obj.setName(rs.getString("customer_name"));
            obj.setReqId(rs.getString("req_id"));
            obj.setSchedule(scheduled_date);
            obj.setReq_date(request_date);
            obj.setAddress(rs.getString("house_no")+" , "+rs.getString("street")+"   near, "+rs.getString("landmark")+" Bhopal");
            obj.setStatus(rs.getString("status"));
            req_List.add(obj);
        }
        return req_List;
       
   }
   
   
   public static Float getPrice(String material) 
   {
       Float result_price=0.0f;
       try
       {
       Connection conn= DBConnection.getConnection();
       PreparedStatement ps= conn.prepareStatement("select material_cost from material where material_type="+"'"+material+"'");
       ResultSet rs=ps.executeQuery();
       
       while(rs.next())
       {
           result_price=rs.getFloat(1);
       }
        rs.close();
       
       }
       catch(SQLException e)
       {
           e.printStackTrace();
       }
         return result_price;
         
   }
   public static boolean changeScrapPrice(String material,Float new_price) throws SQLException
   {
       Connection conn=DBConnection.getConnection();
       PreparedStatement ps= conn.prepareStatement("update material set material_cost="+new_price+"where material_type="+"'"+material+"'");
       int row=ps.executeUpdate();
       if(row>0)
           return true;
       else
           return false;  
   }
   public static boolean changePassword(String new_pass,String user)throws SQLException       
   {
       
       Connection conn=DBConnection.getConnection();
       PreparedStatement ps= conn.prepareStatement("update customers set password="+"'"+new_pass+"'"+" where customer_id ="+"'"+user+"'");
       int row=ps.executeUpdate();
       if(row>0)
            return true;
       else
           return false;
   }
   public static boolean assignRequest(String pkId, String scheduleDate,String requestId) throws SQLException
   {
       Connection conn=DBConnection.getConnection();
       PreparedStatement ps1=conn.prepareStatement("update assign set pk_Id="+"'"+pkId+"'"+",status='Assigned' where req_id="+"'"+requestId+"'");
       int row1=ps1.executeUpdate();
       
       java.util.Date myDate = new java.util.Date(scheduleDate);
       java.sql.Date sqlDate = new java.sql.Date(myDate.getDate());
       System.out.println("SQLDate:"+sqlDate);
       PreparedStatement ps2=conn.prepareStatement("update request set schedule_date="+"'"+sqlDate+"'"+"where req_id="+"'"+requestId+"'");
       int row2=ps2.executeUpdate();
       System.out.println("row1="+row1+" row2="+row2);
       
       if(row1>0&&row2>0)
           return true;
       else
           return false;
   }
}
