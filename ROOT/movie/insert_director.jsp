<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert directors</title>
</head>
<body>
       <%

              String DB_URL = "jdbc:mysql://192.168.0.96:13303/test";
              String DB_USER = "root";
              String DB_PASSWORD = "admin1234";
              Connection conn = null;
              PreparedStatement ps = null;

              String sql = "insert ignore into DIRECTORS (dir_name, dir_age, dir_first_movie) values(?,?,?)";
              int n = 0;

              request.setCharacterEncoding("utf-8");
              String dir_name = request.getParameter("dir_name");
              int dir_age = Integer.parseInt(request.getParameter("dir_age"));
              String dir_first_movie = request.getParameter("dir_first_movie");

              try {
                     Class.forName("com.mysql.jdbc.Driver");
                     conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                     ps = conn.prepareStatement(sql);

                     ps.setString(1,dir_name);
                     ps.setInt(2,dir_age);
                     ps.setString(3,dir_first_movie);


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
                alert("감독 정보가 추가되었습니다.")
                location.href="./movie_list.jsp"
        }else {
                alert("감독 정보 추가 실패!");
                history.go(-1);
        }
</script>
</body>
</html>

