<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
if (username != null && password != null){
try{
    ApplicationDB db = new ApplicationDB();
    Connection con = db.getConnection();
    Statement statement = con.createStatement();

    PreparedStatement ps = con.prepareStatement("SELECT * FROM user WHERE username = ? AND password = ?");
    ps.setString(1, username);
    ps.setString(2, password);
    ResultSet result = ps.executeQuery();
    if (!result.next()){
        out.println("<h3>There is no user by that name!</h3>");
    }
    else{
        session.setAttribute("user", username);

        out.println("<h3>User found!</h3>");
    }
    out.flush();

    con.close();
    
}catch(Exception ex){
    out.println(ex);
}
}
%>
</body>
</html>