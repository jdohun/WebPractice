<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/write.css">
<link rel="stylesheet" href="css/memoList.css">
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
%>
	<div class="memo"><p>일련번호 <%=no%> : <%=memo%> : <%=wdate%></p>
	<form action="memo_delete.jsp" method="post">
		<input type="hidden" value="<%=no%>" name="deleteNo">
		<input type="submit" class="delete" value="X" class="deleteMemo">
	</form>
	</div>
<%
	}
	result.close();
	pstmt.close();
	con.close();
%>
	<span style="margin:16px;"><b>DB조회 성공</b></span>
	<a href="memo01.html" class="Write">작성</a>
</body>
</html>