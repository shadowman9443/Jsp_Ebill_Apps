<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8"  %>
<%@page language="java" %>
<%@page  import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
    <head>
        <title>Ebill Application</title>
    </head>
    <body vlink=#AC14B1 link=#F10DF9  bgcolor="#440646">
        <h1 align="center">Purchase report</h1>
        <%
          
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
        ResultSet rs=st.executeQuery("Select * from  item_tab where category='"+category+"' and item_name='"+item+"' ");
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
%>
  <table border="2" align="center" cellpading="7" cellspacing="7">
      <tr>
          <td>
              <strong>Category</strong>
          </td>
          <td><% out.println(category); %></td>
      </tr>
      <tr>
          <td>
              <strong>Item purchase</strong>
          </td>
          <td><%out.println(item);%></td>
      </tr>
       <tr>
          <td>
              <strong>Quantity  purchase</strong>
          </td>
          <td><%out.println(quan);%></td>
      </tr>
       <tr>
          <td>
              <strong>Total cost</strong>
          </td>
          <td><%out.println(resultstr);%></td>
      </tr>
  </table>
    <center><a href="purchase.jsp">Select other category</a></center>
    <%
          Statement stm=connection.createStatement();
          stm.executeUpdate("update item_tab set quan='"+updatequan+"' where category='"+category+"' and item_name='"+item+"'");
           Statement stmnt=connection.createStatement();
           stmnt.executeUpdate("insert into item_details values('"+category+"','"+item+"','"+resultstr+"','"+quan+"','"+sessionuser+"') ");
           
             }
        }
      
      }catch(Exception e){
          out.println("error:"+e);
      }
      %>
    <tr>
        <td align="left" colspan="2"><a href="logout.jsp">Logout</a></td>
    </tr>
    </body>
</html>
