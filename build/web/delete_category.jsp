<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Users</title>
</head>
<%
 String connectionURL = "jdbc:mysql://localhost:3306/ebill" ;
Connection connection = null; 
 connection = DriverManager.getConnection(connectionURL, "root","");
String sql = "SELECT * FROM category_tab";
PreparedStatement ps = connection.prepareStatement(sql);
ResultSet rst = ps.executeQuery();
int i=0;
%>
<body>



<h1>Will be deleting an Existing User</h1>
<h4> List of Category</h4>
<form method=post
action="deleteSuccess.jsp">
<table border="1">
<tr><td>Select</td>
<td>CategoryID</td><td>CategoryName</td>
</tr>
<%
while(rst.next()){ %>
<tr>
<td><input type="checkbox" name="check<%=i%>"
value=<%=rst.getInt(1)%>></td>
<td><%=rst.getInt(1)%></td><td><%=rst.getString(2)%></td><td>
</tr>
<%}%>
</table>
<input type="submit" value="Delete"></form>
</body>
</html>