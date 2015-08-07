package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;

public final class purchase_005freport_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Ebill Application</title>\n");
      out.write("    </head>\n");
      out.write("    <body vlink=#AC14B1 link=#F10DF9  bgcolor=\"#440646\">\n");
      out.write("        <h1 align=\"center\">Purchase report</h1>\n");
      out.write("        ");

          
      String sessionuser=request.getParameter("sessionuser"); 
      String category=request.getParameter("category");
      String quan=request.getParameter("quan");
      String item=request.getParameter("item");
      try{
           String connectionURL = "jdbc:mysql://localhost:3306/ebill" ;
            Connection connection = null; 
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            connection = DriverManager.getConnection(connectionURL, "root","");
             Statement st=connection.createStatement();
        PreparedStatement ps=null;
        ResultSet rs=st.prepareStatement("Select * from  item_tab where category='"+category+"' and item_name='"+item+"' ");
        if(rs.next()){
            String costv=rs.getString(4);
             String rquantity=rs.getString(3);
             int rqt=Integer.parseInt(rquantity);
             int ct=Integer.parseInt(costv);
             int qt=Integer.parseInt(quan);
             if(qt>=rqt){
                 out.println("quantity exceed");
             }else{
                 int result=ct*qt;
                 String resultstr=new Integer(result).toString();
                 int subquant=(rqt)-(qt);
                 String updatequan=new Integer(subquant).toString();

      out.write("\n");
      out.write("  <table border=\"2\" align=\"center\" cellpading=\"7\" cellspacing=\"7\">\n");
      out.write("      <tr>\n");
      out.write("          <td>\n");
      out.write("              <strong>Category</strong>\n");
      out.write("          </td>\n");
      out.write("          <td>");
 out.println(category); 
      out.write("</td>\n");
      out.write("      </tr>\n");
      out.write("      <tr>\n");
      out.write("          <td>\n");
      out.write("              <strong>Item purchase</strong>\n");
      out.write("          </td>\n");
      out.write("          <td>");
out.println(item);
      out.write("</td>\n");
      out.write("      </tr>\n");
      out.write("       <tr>\n");
      out.write("          <td>\n");
      out.write("              <strong>Quantity  purchase</strong>\n");
      out.write("          </td>\n");
      out.write("          <td>");
out.println(quan);
      out.write("</td>\n");
      out.write("      </tr>\n");
      out.write("       <tr>\n");
      out.write("          <td>\n");
      out.write("              <strong>Total cost</strong>\n");
      out.write("          </td>\n");
      out.write("          <td>");
out.println(resultstr);
      out.write("</td>\n");
      out.write("      </tr>\n");
      out.write("  </table>\n");
      out.write("    <center><a href=\"purchase.jsp\">Select other category</a></center>\n");
      out.write("    ");

          Statement stm=connection.createStatement();
          stm.executeUpdate("update item_tab set quan='"+updatequan+"' where category='"+category+"' and item_name='"+item+"'");
           Statement stmnt=connection.createStatement();
           stmnt.executeQuery("insert into item_details values('"+category+"','"+item+"','"+resultstr+"','"+quan+"','"+sessionuser+"') ");
           
             }
        }
      
      }catch(Exception e){
          out.println("error:"+e);
      }
      
      out.write("\n");
      out.write("    </body>\n");
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
