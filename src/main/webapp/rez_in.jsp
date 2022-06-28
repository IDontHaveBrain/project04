<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
import="project04.DAO"
import="project04.vo.*"  
%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=path%>\css\rez.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String req = request.getParameter("");
DAO dao = new DAO();
Programs prg = new Programs();
%>
<h1>예약하기</h1>


<div>
<h3>프로그램 예약</h3>
<table>
<tr><th>날짜선택</th>
	<td><select name="date" value="날짜선택">
	<option value="">선택하세요</option>
	</select></td></tr>
<tr><th>프로그램명</th>
	<td><input type="text" id="pname"></td></tr>
</table>
</div>

<br><br>

<div>
<h3>정보입력</h3>
<table>
<tr><th>이름</th>
	<td><input type="text" id="name"><br></td></tr>
<tr><th>이메일</th>
	<td><input type="text" id="name"><br></td></tr>
<tr><th>연락처</th>
	<td><input type="text" id="name" placeholder="전화번호만 입력"><br></td></tr>
<tr><th>결제방법</th>
	<td><select name="credit">
		<option value="">선택하세요</option>
		<option value="현장결제">현장결제</option>
	</select></td>

<%--
<tr><label for="credit">결제방법</label>
<select name="credit">
	<option value="">선택하세요</option>
	<option value="현장결제">현장결제</option>	
</select></tr>
--%>
</table>
</div>

<div style="text-align: center; font-size:16px;">
	<button class="button">예약신청</button>
</div>

</body>
</html>