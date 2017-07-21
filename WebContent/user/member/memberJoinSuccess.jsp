<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
<%@ include file="/sub/temp/bootStrap.jspf" %>
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book.css">
<title>어라운드 무비</title>
<style>
	#center{
		text-align: center;
	}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<div class="bBar">
		<div class="position noBMargin">
			<a href="../../index.jsp">HOME</a> > 회원 가입
		</div>
		</div>
		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">회원 가입 완료</p>
		</div>
		</div>
		
		<div class="position formInfo">
			<div id="center">
				<h2 style="color:rgb(0,174,240);">가입 성공 !</h2>
				<p>어라운드 무비의 회원이 되신 것을 환영합니다.</p>
				<a href="../../index.jsp">
					<p style="color: rgb(44,65,98);">홈페이지로 이동하기</p>
					<img src="${pageContext.request.contextPath}/resources/img/membergo.jpg">
				</a>
			</div>
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>