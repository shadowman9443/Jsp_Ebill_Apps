

<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8"  %>
<%@page language="java" %>
<%@page  import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String username=request.getParameter("username"); 
    String password=request.getParameter("password"); 
    session.setAttribute("username", username);
    
   try {
            String connectionURL = "jdbc:mysql://localhost:3306/ebill" ;
            Connection connection = null; 
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            connection = DriverManager.getConnection(connectionURL, "root","");
             Statement st=null;
        PreparedStatement ps=null;
        ResultSet rs=null;
        ps=connection.prepareStatement("Select * from  user_info where username=? and password=? ");
        ps.setString(1, username);
        ps.setString(2, password);
        rs=ps.executeQuery();
        if(rs.next()){
            String redirectURL="purchase.jsp";
            response.sendRedirect(redirectURL);
        }
        else{
            out.println("no login");
        }
    }catch(Exception e){
        out.println("data is not inserted");
    }
  %>  
    