<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
import="project04.DAO"
import="project04.vo.*"  
%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=path %>/css/rez_info.css" rel="stylesheet">
<script type="text/javascript">
</script>
</head>
<body>
<h2>예약 정보 조회</h2>
<%
DAO dao = new DAO();
String date = request.getParameter("date");
String name = request.getParameter("name");
if(date==null) date=""; // 처음에는 전체 값이 출력되게 하고, 값이 없으면 공백으로 처리함
if(name==null) name="";
log("날짜: "+date); // log: console 창에서 데이터 확인
log("이름: "+name); // log: console 창에서 데이터 확인
%>
<div class="container">
  <form>
  <div class="row">
    <div class="col-25">
      <label for="date">예약 날짜</label>
    </div>
    <div class="col-75">
      <input type="text" id="date" name="date" placeholder="YYYY-MM-DD" value="<%=date%>">
    </div>
  </div>
    <div class="row">
    <div class="col-25">
      <label for="name">이름</label>
    </div>
    <div class="col-75">
      <input type="text" id="name" name="name" placeholder="이름 입력.." value="<%=name%>">
    </div>
  </div>
  <div class="row">
    <input type="submit" value="검색">
  </div>
  </form>
</div>

<br>
<table id="customers">
  <tr>
    <th>예약번호</th>
    <th>예약날짜</th>
    <th>프로그램명</th>
    <th>이름</th>
    <th>이메일</th>
    <th>연락처</th>
    <th>결제방법</th>
  </tr>
  <%for(Rez r:dao.getRezList3(date,name)){ %>
  <tr><td><%=r.getRezid()%>"<td><%=r.getDate()%></td><td><%=r.getPname() %></td><td><%=r.getName()%></td><td><%=r.getEmail() %></td>
  <td><%=r.getPhone() %></td><td><%=r.getPay() %></td></tr>
  <%} %>
</table>

</body>
</html>