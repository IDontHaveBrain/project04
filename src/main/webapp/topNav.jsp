<%@ page import="project04.vo.Account" %>
<%@ page import="project04.DAO" %><%--
  Created by IntelliJ IDEA.
  User: skawn
  Date: 2022-06-27
  Time: 오전 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        String path = request.getContextPath();
    %>
    <script type="text/javascript" src="<%=path%>/util/check.js"></script>
    <script type="text/javascript" src="<%=path%>/util/cookie.js"></script>
    <link href="<%=path%>/css/topNav.css" rel="stylesheet">
</head>
<body>
<ul>
    <li class="dropdown">
        <a href="javascript:void(0)" class="dropbtn">게시판</a>
        <div class="dropdown-content">
            <a href="postGal.jsp">간행물</a>
            <a href="photoGal.jsp">포토갤러리</a>
        </div>
    </li>
    <%
        String curId = null;
        Account account = null;
        if(session.getAttribute("curId") != null) {
            curId = (String) session.getAttribute("curId");
            DAO dao = new DAO();
            account = dao.getAccountId(curId);
        }
        if(account == null) {
    %>
        <li class="tright"><a href="login.jsp">로그인</a></li>
    <%} else {%>
    <li class="dropdown tright">
        <a href="javascript:void(0)" class="dropbtn"><%=account.getName()%></a>
        <div class="dropdown-content">
            <a href="#logout">로그아웃</a>
        </div>
    </li>
    <%}%>
    <li class="tright"><a href="search.jsp">통합검색</a></li>
</ul>
</body>
</html>
