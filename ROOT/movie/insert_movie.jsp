<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert movie</title>
</head>
<body>
       <%

              String DB_URL = "jdbc:mysql://192.168.0.96:13303/test";
              String DB_USER = "root";
              String DB_PASSWORD = "admin1234";
              Connection conn = null;
              PreparedStatement ps = null;
              
	      String sql = "insert ignore into MOVIES(movie_title, movie_dir, movie_genre, movie_actors ,movie_grade ) values(?, ?, ?, ?, ?)";
 	      int n = 0;

	      request.setCharacterEncoding("utf-8");
	      String movie_title = request.getParameter("movie_title");
	      String movie_dir = request.getParameter("movie_dir");
	      Double movie_grade = Double.parseDouble(request.getParameter("movie_grade"));	
	      String movie_genre = request.getParameter("movie_genre");
	      String movie_actors = request.getParameter("movie_actors");	
		
             
              try {
                     Class.forName("com.mysql.jdbc.Driver");
                     conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                     ps = conn.prepareStatement(sql);

                     ps.setString(1,movie_title);
                     ps.setString(2,movie_dir);
                     ps.setString(3,movie_genre);
		     ps.setString(4,movie_actors);
		     ps.setDouble(5,movie_grade);	


                     n = ps.executeUpdate();

              }catch(SQLException se){
                     System.out.println(se.getMessage());
              }finally{
                     try{
                        if(ps != null) ps.close();
                        if(conn != null) conn.close();
                     }catch(SQLException se){
                        System.out.println(se.getMessage());
                     }
              }

       
       %>
     
<script type="text/javascript">
	if(<%=n%> > 0){
		alert("영화 정보가 추가되었습니다.")
		location.href="./movie_list.jsp"
	}else {
		alert("영화 정보 추가 실패!");
		history.go(-1);
	}
</script>

</body>
</html>
