<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="project04.DAO"
	import="project04.util.*"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
String path = request.getContextPath();
%>
<script type="text/javascript" src="<%=path%>/util/check.js"></script>
<script type="text/javascript" src="<%=path%>/util/cookie.js"></script>
</head>
<body>
<script type="text/javascript">
<%
String id = request.getParameter("id");

if(!inputCheck.isEmpty(id)){
	DAO dao = new DAO();
	if(dao.getAccountId(id) == null){ %>
			opener.parent.canUseId();
			window.close();
<%
	} else { %>
	opener.parent.cantUseId();
	window.close();
	<%}
}else {
%>
opener.parent.cantUseId();
window.close();
<%}%>
</script>
</body>
</html>