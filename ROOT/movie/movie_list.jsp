<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB Connection Test</title>
</head>
<body>
	<table cellspacing=1 width=600 border=1>
		<tr>
			<td width=300><p align=center>감독</p></td>
			<td width=400><p align=center>영화 제목</p></td>
			<td width=200><p align=center>장르</p></td>	
			<td width=300><p align=center>출연 배우</p></td>
			<td width=100><p align=center>평점</p></td>
			<td width=100><p align=center>삭제</p></td>
		</tr>
	

       <%
              String DB_URL = "jdbc:mysql://192.168.0.96:13304/test";
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
			%>
			<tr>
				<td align=center><%=rs.getString(2)%></td>
				<td align=center><%=rs.getString(3)%></td>			
				<td align=center><%=rs.getString(4)%></td>
				<td align=center><%=rs.getString(5)%></td>
				<td align=center><%=rs.getDouble(6)%></td>
				<td align=center><a href="delete_movie.jsp?id=<%=rs.getInt(1)%>">삭제</a></td>
			</tr>
                	<%
                     }

                     conn.close();

              } catch (Exception e) {
                     out.println(e.getMessage());
              }
       %>
	</table>

	<table width=100>
	<tr>
		<td align=center><input type=button value="감독 추가" OnClick="window.location='insert_director.html'"></td>
		<td align=center><input type=button value="영화 추가" OnClick="window.location='insert_movie.html'"></td>
		<td align=center><input type=button value="감독 검색" OnClick="window.location='find_director.jsp'"></td>
		<td align=center><input type=button value="영화 검색" OnClick="window.location='find_movie.jsp'"></td>
	</tr>
</table>
</body>
</html>
