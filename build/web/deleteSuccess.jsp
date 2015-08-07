<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category Deleted</title>
</head>
<%
String id[] = new String[10];
for (int i = 0; i < 10; i++) {
id[i] = request.getParameter("check" + i);
}
%>
<body bgcolor="beige">
<%
try {
Connection conn = null;
Class.forName("com.mysql.jdbc.Driver").newInstance ();
conn = DriverManager.getConnection(
"jdbc:mysql://localhost:3306/ebill","root", "");
ResultSet rs = null;
Statement st = null;
st = conn.createStatement();
for (int a = 0; a < 10; a++) {
st.executeUpdate("delete from category_tab where id='" + id[a]
+ "'");
if(id[a] != null){%>
<h3><font color="blue">Employee ID : <%= id[a]%> Deleted Successfully</font></h3>
<% }}
} catch (SQLException e) {
    out.println(e.getMessage());
}

%>

<a href="control_panel.jsp">Click here to go to Home</a>
</body>

</html>