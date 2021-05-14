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
	String deleteNo = request.getParameter("deleteNo");
	//int deleteNo = Integer.parseInt(request.getParameter("deleteNo"));
%>
<%
	String url = "jdbc:mysql://localhost/testsql?characterEncoding=UTF-8&serverTimezone=UTC";
	String user = "root";
	String passwd = "1234";
	String sql = "delete from oneline where no=" + deleteNo; // 여기서 no값을 바로 합치면
	PreparedStatement pstmt = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con = DriverManager.getConnection(url, user, passwd);
	
	pstmt = con.prepareStatement(sql);
	//pstmt.setInt(1, deleteNo);		// 여기서 안해도 됨
	pstmt.executeUpdate();
	
	pstmt.close();
	con.close();
	response.sendRedirect("memo01.jsp");
%>
</body>
</html>