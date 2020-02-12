<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DB Connection Test</title>
<style type="text/css">
        #regbox{ width : 200 px; }
        #regbox label{ display : block; width : 100px; float : left;}
</style>
</head>
<body>

<form method="post" action="find_director.jsp">
                <label for="dir_name">  영화 감독 </label>
                <input type="text" name="dir_name">
                <input type="submit" value="검색">
</form>

<%
	request.setCharacterEncoding("utf-8");
	String dir_name = request.getParameter("dir_name");

	if(dir_name != null){
	
	      String DB_URL = "jdbc:mysql://192.168.0.96:13304/test";
              String DB_USER = "root";
              String DB_PASSWORD = "admin1234";
              Connection conn;
              Statement stmt;
              PreparedStatement ps = null;
              ResultSet rs;
			
		

              try {
                     Class.forName("com.mysql.jdbc.Driver");
                     conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);  

		     ps = conn.prepareStatement("SELECT * FROM DIRECTORS where dir_name = ? ;");
                     ps.setString(1,dir_name);

                     rs = ps.executeQuery();

                     if(rs.next()){
                        %>
			 <fieldset id="regbox" style="width:300px;">
                                <legend> 감독 정보 </legend>
                                <label for="dir_name"> 감독 이름 </label>
                                <%=rs.getString(2)%><br/>
                                <label for="movie_title_"> 나이 </label>
                                <%=rs.getInt(3)%><br/>
                                <label for="movie_genre"> 데뷔작 </label>
                                <%=rs.getString(4)%><br/>                               
                        </fieldset>

                        <%
                     }


                     ps = conn.prepareStatement("SELECT * FROM MOVIES where movie_dir = ? ;");
                     ps.setString(1,dir_name);
                     rs = ps.executeQuery();


                     while(rs.next()){
                        %>
                        <fieldset id="regbox" style="width:300px;">
                                <legend> 영화 정보  </legend>
                                <label for="movie_dir"> 영화 감독 </label>
                                <%=rs.getString(2)%><br/>
                                <label for="movie_title_"> 영화 제목 </label>
                                <%=rs.getString(3)%><br/>
                                <label for="movie_genre"> 장르 </label>
                                <%=rs.getString(4)%><br/>
                                <label for="movie_actors"> 주연 배우 </label>
                                <%=rs.getString(5)%><br/>
                                <label for="movie_grade"> 평점 </label>
                                <%=rs.getDouble(6)%><br/>


                        </fieldset>
                        <%
                     }
		     

                     conn.close();

              } catch (Exception e) {
                     out.println(e.getMessage());
              }

	}

%>
<br>
<input type=button value="영화 리스트로 돌아가기" OnClick="window.location='movie_list.jsp'">
</body>
</html>


