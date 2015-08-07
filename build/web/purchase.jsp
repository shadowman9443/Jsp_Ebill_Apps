
<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8"  %>
<%@page language="java" %>
<%@page  import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html>
    <head>
       
        <title>Ebill Apps</title>
    </head>
     <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
     <meta http-equiv="pragma" content="no-cache">
    <body vlink=#AC14B1 link=#F10DF9  bgcolor="#440646">
             <h1 align="center">Purchase item</h1>
             <p align="center">&nbsp;</p>
        <form method="post" action="item_purchase.jsp">
        <table border="2" align="center" cellpading="7" cellspacing="7">
             <tr>
                <td><strong>Item name</strong></td>
                        <td width="280">
                            <select name="cat">
                                <option value="" selected>--Select--</option>
                                  <%
                                      try {
                                        String connectionURL = "jdbc:mysql://localhost:3306/ebill" ;
                                        Connection connection = null; 
                                        Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                        connection = DriverManager.getConnection(connectionURL, "root","");
                                        Statement st=connection.createStatement();
                                        PreparedStatement ps=null;
                                        ResultSet rs=st.executeQuery("Select * from  category_tab");
                                        while(rs.next()){
                                %>
                                <option value="<% String catg12=rs.getString(2); out.print(catg12);%>"><% out.print(catg12);%></option>
                                <%
                                        }
                                  out.print("<Select>");
                                      }
                                      catch(Exception e){
                                          out.println("data is not inserted");
                                      }
                                %>
                                <input type="submit" value="SEARCH"></td>
              </tr>
        </table>
    </form>
    </body>
</html>
