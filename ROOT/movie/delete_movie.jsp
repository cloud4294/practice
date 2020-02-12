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
	request.setCharacterEncoding("utf-8");
	int id = Integer.parseInt(request.getParameter("id"));

	
	
	      String DB_URL = "jdbc:mysql://192.168.0.96:13303/test";
              String DB_USER = "root";
              String DB_PASSWORD = "admin1234";
              Connection conn= null;
              Statement stmt;
              PreparedStatement ps = null;
              int n = 0;
			
		

              try {
                     Class.forName("com.mysql.jdbc.Driver");
                     conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);  

		     ps = conn.prepareStatement("delete from MOVIES where id = ? ");
		     ps.setInt(1,id);
                     
			
		     n = ps.executeUpdate();		

                

              } catch (Exception e) {
                     out.println(e.getMessage());
              } finally{
		     if(ps != null) ps.close();
		     if(conn != null) conn.close();
	      }

	
	response.sendRedirect("movie_list.jsp");
%>
</body>
</html>


