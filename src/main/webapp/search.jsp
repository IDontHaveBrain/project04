<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="project04.vo.Photog"
	import="project04.DAO"
	import="project04.util.*"
	%>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<%
	DAO dao = new DAO();
	String input = request.getParameter("searchStr");
	if(input==null) input="";
	String range = request.getParameter("range");
	if(range==null) range="all";
	String input_title = "";
	String input_content= "";
	if(!range.equals("all")){
		if(range.equals("title")){
			input_title=input;
		}
		if(range.equals("content")){
			input_content=input;
		}
	}
%>
<meta charset="UTF-8">
<title>통합검색 | 통합검색 | 국립생태원</title>
<link href="<%=path%>/css/common.css" rel="stylesheet">
<link href="<%=path%>/css/layout.css" rel="stylesheet">
</head>
<script>
	var dateChange = () => {
	var date_input = document.getElementById("date");
	var text_input = document.getElementById("text");
	text_input.value = date_input.value;
	};

	function showhide(){
		var x = document.getElementById("proSearch");
		if(x.style.display === "none"){
			x.style.display = "block";
		}else{
			x.style.display = "none";
		}
	}
</script>
<body>
	<div class="sub-page layout">
		<h2 class="sub-page__title">통합검색</h2>
		<div class="board-search2">
			<form>
				<div class="search-wrap2">
				<select id="range" name="range" class="search-select">
					<option value="all" selected="selected">전체</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
					<input id="searchStr" name="searchStr" class="search" type="text" placeholder="검색어를 입력해주세요">
					<button class="search-btn" type="submit">검색</button>
				</div>
				<button onclick="showhide()" class="board-btn active">상세검색</button>
		<ul class="search-division" style="display: block;">
            <li>
                <span class="title">기간</span>
                <div class="cont">
                    <div class="board-datepicker">
                        <input type="text" name="startDate" class="datepicker" placeholder="YYYY-MM-DD" value="1970-01-22" title="시작일 입력">
                        <span>~</span>
                        <input type="text" name="endDate" class="datepicker" placeholder="YYYY-MM-DD" value="2030-12-31" title="종료일 입력">
                    </div>
                </div>
            </li>
            <li>
                <span class="title">정렬</span>
                <div class="cont">
                    <input type="radio" name="sort" id="chk1" class="" value="RANK" title="정확도순">
                    <label for="chk1">정확도순</label>
                    <input type="radio" name="sort" id="chk2" class="" value="DATE" title="최신순" checked="checked">
                    <label for="chk2">최신순</label>
                </div>
            </li>
        </ul>
			</form>	
		</div>
            	
			

		<div class="search-tab mt40">
			<a onclick="">전체</a><a onclick="">게시판</a>
			<a onclick="">첨부파일</a><a onclick="">멸종위기종</a><a onclick="">주요동식물</a>
		</div>
	</div>
</body>
</html>