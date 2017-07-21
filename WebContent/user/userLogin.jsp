<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>어라운드 무비</title>
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
<%@ include file="/sub/temp/bootStrap.jspf" %>
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book.css">
<script type="text/javascript">
	$(function() {
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		 
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		 
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
		}
		
		var id = getCookie("id");
		$("#id").val(id);
		
		if ($("#id").val() != "") {	// 쿠키에 저장된 아이디가 표시된 상태 (null 이 아님)
			$("#idSave").attr("checked", true);	// id 저장하기 체크
		}
		
		$("#idSave").change(function() {
			if ($("#idSave").is(":checked")) {
				var id = $("#id").val();
				setCookie("id", id, 7)	// 7일동안 쿠키 보관
			} else {
				deleteCookie("id");
			}
		});
		
		// id 저장하기 체크 상태에서 id 입력하는 경우 : 쿠키 저장
		$("#id").keyup(function() {
			if ($("#idSave").is(":checked")) {
				var id = $("#id").val();
				setCookie("id", id, 7);
			}
		});

	});
</script>
<style type="text/css">
	h3{
	margin: 0;
}
.formInfo{
	width: 1020px;
}
.loginBox {
	height: 200px;
}
.loginBox ul {
	position: relative;
	width: 350px;
}
.loginBox li {
	margin-bottom: 10px;
	list-style: none;
}
.loginBox li .in_id, .loginBox li .in_pw {
	width: 80px;
	display: inline-block;
	color: #303030;
	font-size: 16px;
	font-weight: bold;
}
.login_btn {
	position: absolute;
	top: 30px;
	right: -120px;
}
.btnStyle {
	display: inline-block;
	width: 100px;
	height: 100px;
	font-size: 20px;
	border: 1px solid gray;
	text-align: center;
	text-decoration: none;
}
.loginBox div {
	margin-left: 37px;
}
.save {
	vertical-align: text-top;
	font-size: 0.8em;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<div class="bBar">
		<div class="position noBMargin">
			<a href="../../index.jsp">HOME</a> > 로그인
		</div>
		</div>
		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">로그인</p>
		</div>
		</div>
		
		<form action="./userLoginProcess.user" method="post">
			<div class="position formInfo">
			<div class="loginBox">
				<ul>
					<li>
						<label class="in_id">아이디</label>
						<input type="text" name="id" id="id" class="form-control" required>						
					</li>
					<li>
						<label class="in_pw">비밀번호</label>
						<input type="password" name="pw" class="form-control" required>
					</li>
					<li class="login_btn">
						<button class="btnStyle btn btn-primary" id="btn">LOGIN</button>
					</li>
				</ul>
				<label>
					<span class="save">아이디 저장</span>
					<input type="checkbox" id="idSave" name="idSave">
				</label>
			</div>
			</div>
		</form>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>