<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Memo</title>
<link rel="stylesheet" href="css/memo01.css">
</head>
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
%>
<body>
	<div id="contents">
		<h3 id="title">메모장</h3>
		<form class="memoInputForm" method="post" action="memo_write.jsp">
			<input id="memoInput" type="text" name="memo"><br>
			<input id="memoSubmit" type="submit" value="등록">
		</form>
		<hr>
		
		<table id="memoList">
	<%
	// result 안에 내용이 있으면
	while(result.next()) {
		int no = result.getInt("no");
		String memo = result.getString("memo");
		String wdate = result.getString("wdate");
	%>
		<tr>
			<th class="memoNumber">일련번호 <%=no%></th>
			<td class="memoContents">
				<span><%=memo%></span>
				<form action="memo_delete.jsp" method="post" class="memoDeleteForm">
					<input type="hidden" value="<%=no%>" name="deleteNo">
					<input type="submit" class="delete" value="X" class="deleteMemo">
				</form>
			</td>
			<td class="wdate">(<%=wdate%>)</td>
		</tr>
		<%-- <input class="deleteMemo" type="button" value="X" onClick="location.href='memo_delete.jsp?no="+<%=no%>> --%>
	<%
	}
	result.close();
	pstmt.close();
	con.close();
	%>
		</table>
	</div>
</body>
</html>