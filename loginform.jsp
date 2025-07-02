<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
if(session.getAttribute("user") == null){ %>
<div class = "loginform"> 
<h1>Login</h1>
<form action="login.jsp" method="GET">
<label for="username">Username:</label>
<input type="text" id="username" name="username" required><br>
<label for="password">Password:</label>
<input type="password" id="password" name="password" required><br>
<button type="submit" value="Submit" >Submit</button>
</form>
</div>
<%}else{%>
<h2>You're already logged in! Good job :3</h2>
<form action="logout.jsp" method="POST">
    <button type="submit">Logout?</button>
</form><%}%>

<!DOCTYPE html>

<html>
<head><title>Login form</title>
<style>

.loginform{
    background-color: lightgray;
    border-radius:2px;
    padding:16px;
    margin: auto;
    float: center;
}


</style>
</head>
<body>



</body>
</html>