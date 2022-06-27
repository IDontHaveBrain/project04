<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="project04.DAO"
    import="project04.vo.*"
    %>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String pname = request.getParameter("pname");
%> 
<!DOCTYPE html>
<html>
	<link href="<%=path%>\css\progInfo.css" rel="stylesheet">
	<style type="text/css">
	</style>
<head>
	<meta charset="UTF-8">
	<title>프로그램 상세정보</title>
	<style>

	</style>
	
</head>
<%
	DAO dao = new DAO();
	Programs prg = new Programs();
%>
<script type="text/javascript">
	function goRez(){
		location.href="rez_in.jsp";
	}

</script>

<body>
<h1>프로그램 상세 정보</h1>
<div>
  <%for(Programs p:dao.getPrgList(pname)){ %>
  <h2><%=p.getPname()%></h2>
  <h3>접수기간: <%=p.getSpan1()%>~<%=p.getSpan2()%></h3>
  <table>
  		<tr>
  		<th>구분</th>
  		<td><%=p.getCategory()%></td>
  		</tr>
  		<tr>
  		<th>교육대상</th>
  		<td><%=p.getTarget()%></td>
  		</tr>
  		<tr>
  		<th>교육요일</th>
  		<td><%=p.getDays()%></td>
  		</tr><tr>
  		<th>모집정원</th>
  		<td><%=p.getCapacity()%></td>
  		</tr><tr>
  		<th>시간</th>
  		<td><%=p.getPtime()%></td>
  		</tr><tr>
  		<th>모이는 장소</th>
  		<td><%=p.getLoc()%></td>
  		</tr><tr>
  		<th>학습내용</th>
  		<td><%=p.getContents()%></td>
  		</tr>
  </table>
  <%} %>
  <input type="button" class="button" value="예약하기" onclick="goRez()" style="float: right;">
</div>
<div>
	<h3>상세정보/요청사항</h3>
</div>
</body>
</html>