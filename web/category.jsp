 <body vlink=#AC14B1 link=#F10DF9  bgcolor="#440646">
<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8"  %>
<%@page language="java" %>
<%@page  import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String cat=request.getParameter("cat"); 
   
    try {
            String connectionURL = "jdbc:mysql://localhost:3306/ebill" ;
            Connection connection = null; 
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            connection = DriverManager.getConnection(connectionURL, "root","");
             Statement st=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
      ps=connection.prepareStatement("Select * from  category_tab where category ='"+cat+"'");
    //   ps.setString(1, cat);
      rs=ps.executeQuery();
        if(rs.next()){
            out.println("<center><h1>This category is already exist</h1></center>");
        }
        else{
            String query="INSERT INTO category_tab(category)"+" VALUES ('"+cat+"')";
            // ps.setString(1, cat);
            ps=connection.prepareStatement(query);
            ps.executeUpdate();
            out.println("<center><h1>inserted successfully</h1></center>");
        }
    }catch(Exception e){
        out.println("Error in insering data"+e);
      
    }
%>  
    

