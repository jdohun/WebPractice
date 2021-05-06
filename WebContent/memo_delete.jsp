<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 삭제</title>
<link rel="stylesheet" href="css/write.css">
<link rel="stylesheet" href="css/showList.css">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	int deleteNo = Integer.parseInt(request.getParameter("deleteNo"));
%>
<%
	String url = "jdbc:mysql://localhost/testsql?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root";
	String passwd = "1234";
	String sql = "delete from oneline where no=?";
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con = DriverManager.getConnection(url, user, passwd);
	
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, deleteNo);
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	out.print("DB삭제 성공");
%>
<a href="memo_list.jsp" class="showList">리스트 보기</a>
<a href="memo01.html" class="Write">작성</a>
</body>
</html>