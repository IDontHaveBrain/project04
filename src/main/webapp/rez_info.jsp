<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
import="project04.DAO"
import="project04.vo.*"  
import="login.jsp" 
%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
DAO dao = new DAO();
String curId = null;
if(curId==null){
	String message="로그인을 해주세요";
	response.sendRedirect("login.jsp?message="+message);
}
%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=path%>\css\rez.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>마이페이지</h1>
<h2>내 예약관리</h2>
<br>


<table>
	<tr>
		<th>예약번호</th>
		<th>프로그램</th>
		<th>예약날짜</th>
		<th>예약인원</th>
		<th>예약금액</th>
		<th>예약상태</th>
	</tr>
</table>

</body>
</html>