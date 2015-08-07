 <body vlink=#AC14B1 link=#F10DF9  bgcolor="#440646">
 <%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8"  %>
<%@page language="java" %>
<%@page  import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
 <%
      String cat=request.getParameter("cat"); 
      String item=request.getParameter("item");
      String quan=request.getParameter("quan");
      String cost=request.getParameter("cost"); 
      try{
          String connectionURL = "jdbc:mysql://localhost:3306/ebill" ;
          Connection connection = null; 
          Class.forName("com.mysql.jdbc.Driver").newInstance(); 
          connection = DriverManager.getConnection(connectionURL, "root","");
          Statement st=null;
           Statement st2=connection.createStatement();
          PreparedStatement ps=null;
          ResultSet rs=null;
           Statement st1=connection.createStatement();
           ResultSet rs1=st1.executeQuery(" Select * from item_tab where category ='"+cat+"' and item_name ='"+item+"' ");
           if(rs1.next()){
               out.println("<center><h1>item already exist</h1></center>");
           }else{
               String query2="insert into item_tab values ('"+cat+"','"+item+"','"+quan+"','"+cost+"')";
               out.println("<center><h1>successfully inserted</h1></center>");
               st2.executeUpdate(query2);
           }
      }catch(Exception e){
          out.println("error"+e);
      }
      
 %>