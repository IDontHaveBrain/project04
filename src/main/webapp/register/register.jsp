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
String agree = request.getParameter("agree");
if(inputCheck.isEmpty(agree) || !agree.equals("Y"))
	response.sendRedirect("terms.html");

String path = request.getContextPath();

%>
<script type="text/javascript" src="<%=path%>/util/check.js"></script>
<script type="text/javascript" src="<%=path%>/util/cookie.js"></script>
<link href="/project04/css/layout.css" rel="stylesheet"/>
<link href="/project04/css/layout2.css" rel="stylesheet"/>
<link href="/project04/css/common.css" rel="stylesheet"/>

</head>
<body>
	<header>
		<h2 class="sub-page__title">회원가입</h2>
	</header>
	<div>
		<ul class="join-process">
			<li>
				<p>01. 약관동의</p>
			</li>
			<li>
				<p class="active">02. 정보입력</p>
			</li>
			<li>
				<p>03. 가입완료</p>
			</li>
		</ul>
	</div>
	
	<div class="join-wrap mt50">
	<div class="board-write__title">
		<p class="sub-title mb15">정보입력</p>
		<p class="required-txt">표시된 항목은 필수입력사항입니다.</p>
	</div>
	<form name="joinForm" id="joinForm">
		<input type="hidden" id="menuNo" name="menuNo" value="200218" />
		<input type="hidden" id="joinTy" name="joinTy" value="" />
		<input type="hidden" id="snsType" name="snsType" value="" />
		<input type="hidden" id="duptId" name="duptId" value="MC0GCCqGSIb3DQIJAyEAESRiOOppDxYVi0HOI6HnVl2uRmeZoXER3jfT7H3sGp8=" />
		<input type="hidden" id="userParentDi" name="userParentDi" value="" />
		<input type="hidden" id="crtfcSeCd" name="crtfcSeCd" value="MP" />
		<input type="hidden" id="mailingYn" name="mailingYn" value="Y" />
		<input type="hidden" id="userEmail" name="userEmail" value="" />
		<input type="hidden" id="userZip" name="userZip" value="" />

		<ul class="board-write__item">
			<li>
				<p class="title required">이름</p>
				<div class="write-item">
					<input type="text" name="userNm" id="userNm" value="" title="이름">
				</div>
			</li>
			<li>
				<p class="title required">아이디</p>
				<div class="write-item">
					<input type="text" name="userId" id="userId" onchange="recheckId(this)" value="" title="아아디"/>
					<input type="hidden" name="idChkYn" id="idChkYn" value="N"/>
					<button type="button" name="chkUserId" onclick="checkId(this)" class="btn-write chkUserId ml5" title="ID 중복확인">ID 중복확인</button>
					<span name="chkMessage"></span>
					<p class="txt">※ ID 영문과 숫자 조합ID는 영문과 숫자 조합 7~15 자리</p>
				</div>

			</li>
			<li>
				<p class="title required">비밀번호 입력</p>
				<div class="write-item">
					<input type="password" id="userScrt" name="userScrt" title="비밀번호"/>
					<p class="txt">※PW 첫 문자는 영문자를 사용하고, 9자 이상 영문 대,소문자, 숫자, 특수문자 사용</p>
				</div>

			</li>
			<li>
				<p class="title required">비밀번호 확인</p>
				<div class="write-item">
					<input type="password" id="reUserScrt" name="reUserScrt" title="비밀번호확인"/>
				</div>
			</li>
			<li>
				<p class="title required">생년월일</p>
				<div class="write-item">
					<input type="text" name="userBirth" id="userBirth" value="" title="생년월일"/>
				</div>
			</li>
			<li>
				<p class="title required">휴대 전화</p>
				<div class="write-item phone">
					<input type="text" name="userCp1" id="userCp1" value="" title="휴대전화 앞자리"/>
					<span>-</span>
					<input type="text" name="userCp2" id="userCp2" value="" title="휴대전화 가운데자리"/>
					<span>-</span>
					<input type="text" name="userCp3" id="userCp3" value="" title="휴대전화 끝자리"/>
				</div>
			</li>
			<li>
				<p class="title">일반 전화</p>
				<div class="write-item phone">
					<input type="text" name="userTel1" id="userTel1" value="" title="전화 앞자리"/>
					<span>-</span>
					<input type="text" name="userTel2" id="userTel2" value="" title="전화 가운데자리"/>
					<span>-</span>
					<input type="text" name="userTel3" id="userTel3" value="" title="전화 끝자리"/>
				</div>
			</li>
			<li>
				<p class="title required">이메일</p>
				<div class="write-item email">
					<input type="text" name="email1" id="email1" value="" title="이메일 계정 아이디" />
					<span>@</span>
					<input type="text" name="email2" id="email2" value="" class="emailDomainForm" title="이메일 도메인 입력"/>
					<select class="email-select select_email_js" title="이메일 선택">
						<option value="">직접 입력</option>
						
							<option value="empas.com">empas.com</option>
						
							<option value="gmail.com">gmail.com</option>
						
							<option value="hanmail.net">hanmail.net</option>
						
							<option value="hotmail.com">hotmail.com</option>
						
							<option value="korea.com">korea.com</option>
						
							<option value="nate.com">nate.com</option>
						
							<option value="naver.com">naver.com</option>
						
							<option value="param.com">param.com</option>
						
							<option value="yahoo.com">yahoo.com</option>
						
					</select>
					<script>
						$('select.select_email_js').change(function() {
							if ($(this).val()== '') {
								$('.emailDomainForm:text[name=email2]').val('');
								$('.emailDomainForm').attr('readonly',false).focus();
							}else{
								$('.emailDomainForm:text[name=email2]').val($(this).val());
								$('.emailDomainForm:text[name=email2]').val(jQuery(this).val());
								$('.emailDomainForm').attr('readonly',true)
							}
						});
					</script>
				</div>
			</li>
			<li>
				<p class="title required">주소</p>
				<div class="write-item address">
					<input type="text" name="userAddr1" id="userAddr1" value="" class="postcodify_address" title="주소(상세주소)"/>
				</div>
			</li>

		</ul>
	</form>
	<div class="board-btn">
		<a href="#" class="board-btn__item write" onclick="javascript:joinCheck();return false;" title="가입">가입</a>
		<a href="#" class="board-btn__item cancel" onclick="location.href='/nie/main/main.do';return false;" title="취소">취소</a>
	</div>
</div>
</body>
<script type="text/javascript">
	function recheckId(obj){
		var idChkYn = document.querySelector("[name=idChkYn]");
		idChkYn.value = "N";
	}
	function canUseId(){
		var idChkYn = document.querySelector("[name=idChkYn]");
		var msg = document.querySelector("[name=chkMessage]");
		idChkYn.value = "Y";
		msg.innerText = "사용 가능한 ID입니다.";
		alert(msg.innerText);
	}
	function cantUseId(){
		var idChkYn = document.querySelector("[name=idChkYn]");
		var msg = document.querySelector("[name=chkMessage]");
		idChkYn.value = "N";
		msg.innerText = "사용 불가능한 ID입니다.";
		alert(msg.innerText);
	}
	
	function checkId(){
		var id = document.querySelector("#userId")
		if(isEmpty(id.value)) {
			alert("[아이디] 반드시 입력하셔야 하는 사항입니다.");
			id.focus();
			return;
		}

		if(!id.value.match('^[a-zA-Z0-9]{7,15}$')) {
			alert('아이디는 영문과 숫자조합 7~15자입니다.');
			id.focus();
			return;
		}
		
		window.open("idcheck.jsp?id="+id.value);
	}
	
</script>
</html>