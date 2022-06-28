<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="project04.vo.*"
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
	request.setCharacterEncoding("utf-8");
	DAO dao = new DAO();
	String input = request.getParameter("searchStr");
	if(input==null) input="";
	String range = request.getParameter("range");
	if(range==null) range="all";
	String searchTitle = "";
	String searchContent= "";
	if(!range.equals("all")){
		if(range.equals("title")){
			searchTitle=input;
		}
		if(range.equals("content")){
			searchContent=input;
		}
	}
	String postidS = request.getParameter("postid");
	int postid = 10000000;
	Photog pt = new Photog();
	if(postidS!=null && !postidS.trim().equals("")){
		postid = Integer.parseInt(postidS);
		pt = dao.getPgList_Postid(postid);
	}
%>

	


<script type="text/javascript">
function go(postid){location.href="photoInfo.jsp?postid="+postid;}

}
</script>
<meta charset="UTF-8">
<title>통합검색 | 통합검색 | 국립생태원</title>
<link href="<%=path%>/css/common.css" rel="stylesheet">
<link href="<%=path%>/css/layout.css" rel="stylesheet">
<link href="<%=path%>/css/searchResult.css" rel="stylesheet">
</head>
<script>
	var dateChange = () => {
	var date_input = document.getElementById("date");
	var text_input = document.getElementById("text");
	text_input.value = date_input.value;
	};
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
					<button class="search-btn" type="submit" >검색</button>
					<input type="image" id="search_img" alt="search_img" src="img\search.png">
				</div>
				<button class="board-btn active">상세검색</button>
		<ul class="search-division" style="display;">
            <li>
                <span class="title">기간</span>
                <div class="cont">
                    <div class="board-datepicker">
                        <input type="date" name="startDate" class="datepicker" placeholder="YYYY-MM-DD" value="1970-01-22" title="시작일 입력">
                        <span>~</span>
                        <input type="date" name="endDate" class="datepicker" placeholder="YYYY-MM-DD" value="2030-12-31" title="종료일 입력">
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
	</div>
	<div class="search-tab mt40">
			<a onclick="">전체</a><a onclick="">게시판</a>
			<a onclick="">첨부파일</a><a onclick="">멸종위기종</a><a onclick="">주요동식물</a>
			
	</div>
<div id="mainWrapper">
        <ul>
            <li>
                <ul id ="ulTable">
                    <li>
                        <ul>
                            <li>No</li>
                            <li>제목</li>
                            <li>내용</li>
                            <li>작성자</li>
                            <li>작성일</li>
                        </ul>
                    </li>
                    <!-- 게시물이 출력될 영역 -->
            <%
			if(range.equals("title")){
				for(Search s:dao.searchTitle(searchTitle)){
			%>
                    <li>
                        <ul onclick="go1(<%=s.getPostid()%>)">
                            <li><%=s.getPostid()%></li>
                            <li><%=s.getTitle()%></li>
                            <li class="left"><%=s.getContent() %></li>
                            <li><%=dao.getPgList_Name(postid)%></li>
                            <li><%=s.getUploaddate()%></li>
                        </ul>
                    </li>
			<%
				}
			}else if(range.equals("content")){
				for(Search s:dao.searchContent(searchContent)){
			%>
                    <li>
                        <ul onclick="go1(<%=s.getPostid()%>)">
                            <li><%=s.getPostid()%></li>
                            <li><%=s.getTitle()%></li>                            
                            <li class="left"><%=s.getContent()%></li>
                            <li><%=dao.getPgList_Name(postid)%></li>
                            <li><%=s.getUploaddate()%></li>
                        </ul>
                    </li>			
			
			<%
				}
			%>		
			<%
			}else if(range.equals("all")){
				for(Search s:dao.searchAll(input)){
			%>	
                    <li>
                        <ul onclick="go1(<%=s.getPostid()%>)">
                            <li><%=s.getPostid()%></li>
                            <li><%=s.getTitle()%></li>                            
                            <li class="left"><%=s.getContent()%></li>
                            <li><%=dao.getPgList_Name(postid)%></li>
                            <li><%=s.getUploaddate()%></li>
                        </ul>
                    </li>			
			<%
				}
			}%>						                    
        </ul>
       </li>
      </ul> 
    </div>
</body>
</html>