    <body vlink=#AC14B1 link=#F10DF9  bgcolor="#440646">
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
        <h1 align="center">Category report</h1>
        <h2 align="center">Category List</h2>

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
             String catg=rs.getString(2);
 %>
             <table border="2" align="center" cellpading="7" cellspacing="7">
      <tr>
          
          <td><% out.println(catg); %></td>
      </tr>
             </table>
<%      
         }
    }catch(Exception e){
        out.println("error"+e);
    }
%>
    </body>
</html>
