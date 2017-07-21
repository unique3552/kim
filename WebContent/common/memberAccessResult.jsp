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
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>

	<section>
		<div class="position">
			<h2>어라운드 무비 회원만 접근 가능한 페이지입니다.</h2>
			<h3>메인으로 돌아가기 > <a href="../index.jsp">HOME</a></h3>
			<h3>로그인 > <a href="${pageContext.request.contextPath}/user/userLogin.jsp">LOGIN</a></h3>
			<h3>회원가입 > <a href="${pageContext.request.contextPath}/user/member/memberJoinAgree.jsp">JOIN</a></h3>
		</div>
	</section>

	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>