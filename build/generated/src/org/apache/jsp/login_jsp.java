package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>ScrapKart Login</title>+ \n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/login.css\">\n");
      out.write("        <!-- <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script> -->\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"row myrow\" >\n");
      out.write("            <div class=\"col-sm-2\"><img src=\"images/logo.jpg\" class=\"img-fluid\"></div>\n");
      out.write("            <div class=\"col-sm-10 myheader\">\n");
      out.write("                <span><a href=\"www.google.com\">Contact</a></span>\n");
      out.write("                <span><a href=\"www.google.com\">Price List</a></span>\n");
      out.write("                <span><a onclick=\"alert('Please Login first!');\">Request PickUp</a></span>\n");
      out.write("                <span><a href=\"login.jsp\">Login/Register</a></span>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\" >\n");
      out.write("                <div class=\"col-sm-3\"></div>\n");
      out.write("                <div class=\"col-sm-6 loginform\" style=\"background-color: \">\n");
      out.write("                    <h1 class=\"heading\">Login</h1>\n");
      out.write("                    <form method=\"post\" action=\"LoginServlet\">\n");
      out.write("                        <label>Email:</label><br>\n");
      out.write("                        <input type=\"text\" name=\"email\" required><br><br>\n");
      out.write("                        <label>Password:</label><br>\n");
      out.write("                        <input type=\"password\" name=\"password\" required><br><br>\n");
      out.write("\n");
      out.write("                        <input  type=\"submit\" value=\"Submit\"><br><br>\n");
      out.write("                    </form>\n");
      out.write("                    <p class=\"confirm\">Don't have an account?<a href=\"registerForm.jsp\" style=\"color:green ;margin-left:6%\">Register</a></p>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-3\"></div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("    ");

        String status = request.getParameter("isvalid");
        if (status != null && status.equals("false")) {
    
      out.write("\n");
      out.write("    <script>\n");
      out.write("        alert(\"Invalid user_id or password!!\");\n");
      out.write("    </script>\n");
      out.write("    \n");
      out.write("\n");
      out.write("   \n");
      out.write("    ");

        }
    
      out.write("\n");
      out.write("     ");

        String status2 = request.getParameter("Regisvalid");
        if (status2 != null && status2.equals("true")) {
    
      out.write("\n");
      out.write("     <script>\n");
      out.write("        alert(\"Registration Successful!Please Login\");\n");
      out.write("    </script>\n");
      out.write("    ");

       }
        else if(status2!=null&&status2.equals("false"))
        {
     
      out.write("\n");
      out.write("     <script>\n");
      out.write("        alert(\"Already registered with this username!\");\n");
      out.write("     </script>\n");
      out.write("     ");
 } 
      out.write("\n");
      out.write("   \n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
