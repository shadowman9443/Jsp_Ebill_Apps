<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8"  %>
<%@page language="java" %>
<%@page  import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<html><head><title>Ebill Apps</title></head>
    <body vlink=#AC14B1 link=#F10DF9  bgcolor="#440646">
        <h1 align="center">Add item</h1>
        <p align="center"></p>
        <form method="post" action="item_add.jsp">
        <table border="2" align="center" cellpading="7" cellspacing="7">
            <tr>
                <td width="310"><strong>Select Category</strong></td>
                        <td width="280"><select name="cat">
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
                        </td>
            </tr>
                <tr>
                    <td><strong>Add Item</strong></td>
                    <td><input type="text" name="item" id="item"/></td>
                </tr>
                 
                <tr>
                    <td><strong>Quantity</strong></td>
                    <td><input type="text" name="quan" id="quan"/></td>
                </tr>
                <tr>
                    <td><strong>Cost/Quantity</strong></td>
                    <td><input type="text" name="cost" id="cost"/></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td><input type="submit" value="ADD">
                <input type="reset" name="Reset" id="button" value="RESET"></td>
                </tr>
        </table>
    </form>
    </body>
</html>