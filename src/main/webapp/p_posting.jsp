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
<title>게시글 등록(간행물)</title>
<link href="<%=path %>\css\pg_postingCss.css" rel="stylesheet">
<style>

</style>
<script>
	/*
	//Posting(int postid, int accno, String subtype, String title, String uploaddate_s, String pfile, String content)
	String sql = "INSERT INTO posting values(?,?,?,?,to_date(?,'YYYY-MM-DD'),?,?)";
	*/
	function insPost(){
		if(confirm("등록하시겠습니까?")){
			var titleObj = document.querySelector("[name=title]");
			var subtypeObj = document.querySelector("[name=subtype]");
			var contentObj = document.querySelector("[name=content]");
			var imgurlObj = document.querySelector("[name=pfile]");
			if(titleObj.value.trim()==""){
				alert("제목을 입력하세요");
				titleObj.focus();
				return;
			}
			if(subtypeObj.value.trim()==""){
				alert("분류를 입력하세요");
				subtypeObj.focus();
				return;
			}
			if(contentObj.value.trim()==""){
				alert("내용을 입력하세요");
				contentObj.focus();
				return;
			}
			document.querySelector("form").submit();
		}
	}
</script>
</head>
<body>
<%
	String curId = null;
	if(session.getAttribute("curId") != null) curId = (String)session.getAttribute("curId");
	DAO dao = new DAO();
	String title = request.getParameter("title");
	if(title==null) title="";
	String subtype = request.getParameter("subtype");
	if(subtype==null) subtype="";
	String content = request.getParameter("content");
	if(content==null) content="";
	String pfile = request.getParameter("pfile");
	if(pfile==null) pfile="";
	
	//Account ac = new Account();
	//int postid = 0;
	//int accno = 0;
	//ac = dao.getAccountId(curId);
	//accno = ac.getAccno();
	//postid = dao.getBdList_postid(accno);
	
	if(title!=null && title.trim().equals("")){
		//Posting(int postid, int accno, String subtype, String title, String pfile, String content)
		//Posting p = new Posting(postid, accno, subtype, title, pfile, content);
		//dao.insertPList(pg);
	}
%>
<%-- 
	//Posting(int postid, int accno, String subtype, String title, String pfile, String content)
	String sql = "INSERT INTO posting values(?,?,?,?,sysdate,?,?)";
--%>
<h1 class="page_title">게시글 작성</h1>
<div class="input_area">
	<form class="input_form">
		<table class="input_table" > 
			<tr><th>제목</th><td><input type="text" id=title name=title value="" size="20"></td></tr>
			<tr><th>분류</th><td><input type="text" id=subtype name=subtype value=""></td></tr>
			<tr><th>첨부파일</th><td><input type="text" id=pfile name=pfile value=""></td></tr>
			<tr><th>내용</th><td><textarea id=content name=content></textarea></td></tr>
			
		</table>
		<br>
		<div class="inputBtn_area">
			<input type="button" value="등록" onclick="insPost()">
		</div>
	</form>
</div>


</body>
</html>