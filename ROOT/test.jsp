<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB Connection Test</title>
</head>
<body>
       <%
              String DB_URL = "jdbc:mysql://192.168.0.89:13303/test";
              String DB_USER = "root";
              String DB_PASSWORD = "admin1234";
              Connection conn;
              Statement stmt;
              PreparedStatement ps;
              ResultSet rs;

              try {	
                     Class.forName("com.mysql.jdbc.Driver");
		     conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                     stmt = conn.createStatement();
		     ps = conn.prepareStatement("SELECT * FROM MOVIES;");
		     rs = ps.executeQuery();
                     
		     while(rs.next()){
    			out.println(rs.getString(1)+"&nbsp"+rs.getString(2)+"&nbsp"+rs.getString(3)+"<br />");
		     }
                
                     conn.close();
                     out.println("MySQL JDBC Driver Connection Test Success!!!");
		  
              } catch (Exception e) {
                     out.println(e.getMessage());
              }
       %>
</body>
</html>
