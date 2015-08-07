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
    <body vlink=#AC14B1 link=#F10DF9  bgcolor="#440646">
        <h1 align="center">Select item</h1>
        <%
             String cat=request.getParameter("cat"); 
        %>
        <form method="post" action="purchase_report.jsp">
            <table border="2" align="center" cellpading="7" cellspacing="7">
                <tr>
                <td width="310"><strong>Select Category</strong></td>
                        <td><select name="item" id="item">
                            <option value="" selected>--Select--</option>
                            <%
                               try {
                                        String connectionURL = "jdbc:mysql://localhost:3306/ebill" ;
                                        Connection connection = null; 
                                        Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                        connection = DriverManager.getConnection(connectionURL, "root","");
                                        Statement st=connection.createStatement();
                                        PreparedStatement ps=null;
                                        ResultSet rs=st.executeQuery("Select * from  item_tab where category='"+cat+"'");
                                        while(rs.next()){
                                            %>
                                <option value="<% String itemv=rs.getString(2); out.print(itemv);%>"><% out.print(itemv);%></option>
                                <%
                                        }
                               }
                               catch(Exception e){
                                   out.println("data not inserted"+e);
                               }
                               %>
                            </select></td>
                </tr>
                <tr>
                    <td><strong>Item quanity</strong></td>
                    <td><input name="quan" type="text" id="quan" size="2"></td>
                </tr>
                <tr>
                    <td colspane="2"><div align="right">
                            <input name="Submit" type="submit" value="Purchase">
                        </div>
                     </td>
                </tr>
                <tr colspane="2" align="center">
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
                               <input type="hidden" value="<% out.print(session.getAttribute("myusername"));%>" name="sessionuser">
                               <input type="hidden" value="<%out.print(cat);%>" name="category">
        </form>
    </body>
</html>

