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
	<meta charset="UTF-8">
	<title>포토갤러리 상세보기</title>
	<link href="<%=path %>\css\photoInfoCss.css" rel="stylesheet">
	<style>

	</style>
	
</head>
<%
	DAO dao = new DAO();
	String postidS = request.getParameter("postid");
	int postid = 10000000;
	if(postidS!=null && !postidS.trim().equals("")){
		postid = Integer.parseInt(postidS);
	}
		
	dao.getPgList_Postid(postid);
%>
<script>
	function backList(){
		if(confirm("목록으로 이동하시겠습니까?")){
			location.href="photoGal.jsp";
		}
	}
</script>
<body>
	<div class="title_area">
		<h1 class="title">포토갤러리</h1>
	</div>
	<div class="main_area">
		<%for(Photog pg:dao.getPgList_Postid(postid)){ %>
		<div class="name_area">
			<span id="type">생태연구</span><span id="name"><%=pg.getTitle() %></span>
		</div>
		<div class="info_area">
			<ul class="info_list">
				<li class="info_head">작성일</li>
				<li class="info_data"><%=pg.getUploaddate() %></li>
				<li class="info_head">작성자</li>
				<li class="info_data"><%=dao.getPgList_Name(postid) %></li>
			</ul>
		</div>
		<br>
		<div class="img_area"> <%-- 0620 17:55 --%>
			<div class="img_box">
				<img class="img" src=<%=pg.getImgurl() %>>
			</div>
		</div>
		<br>
		<div class="content_title_area">
			<span class="content_title">내용</span>
		</div>
		
		
	</div>
	<div class="sub_area">
		<div class="content_area">
			<p class="content"><%=pg.getContent() %></p>
		</div>
		<%} %>
		<div class="source_area">
			<span class="source">출처표시</span>
		</div>
		<br>
		<input class="list_button" type="button" value="목록" onclick="backList()">
		<input class="upt_button" type="button" value="수정" onclick="uptPg()">
		<input class="del_button" type="button" value="삭제" onclick="delPg()">
		<input type="hidden" name="proc"/>
	</div>

	
	
</body>
</html>