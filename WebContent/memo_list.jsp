<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.Write {
		text-decoration: none;
		box-sizing: border-box;
		min-width : 50px;
		min-height : 50px;
		boder : 1px solid #000000;
		background: #000000;
		color : #ffffff;
		padding : 10px 20px;
		margin : 0 20px;
		position: absolute;
		left : 300px;
	}
	
	.Write:hover{
		background : #444444;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<%
	String url = "jdbc:mysql://localhost/testsql?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root";
	String passwd = "1234";
	String sql = "select * from oneline";
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con = DriverManager.getConnection(url, user, passwd);
	
	pstmt = con.prepareStatement(sql);
	ResultSet result = pstmt.executeQuery(); // select
	
	// result 안에 내용이 있으면
	while(result.next()) {
		int no = result.getInt("no");
		String memo = result.getString("memo");
		String wdate = result.getString("wdate");
		
		out.print("<p>" + "일련번호" + no + " : "  + memo + " : (" + wdate + ")" + "</p>");
	}
	result.close();
	pstmt.close();
	con.close();
	out.print("DB조회 성공");
%>
<a href="memo01.html" class="Write">작성</a>
</body>
</html>