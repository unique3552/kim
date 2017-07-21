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
<title>어라운드 무비</title>
<script type="text/javascript">
	$(function() {
		$("#one").click(function() {
			location.href = "${pageContext.request.contextPath}/tInfo/tInfoList.tInfo";
		});
	});
</script>
<style type="text/css">
section {
	margin-left: 0px;
	width: 100%;
	min-height: 600px;
}

.carousel-inner > .item > img, .carousel-inner > .item > a > img {
	width: 100%;
	height: 800px;
	margin: auto;
}

.center {
	width: 100%;
	height: 1000px;
	margin: 0px auto;
	margin-top: -60px;
	font-weight: bold;
	background-size: 100% 100%;
	background-image: url("${pageContext.request.contextPath}/resources/img/banner/회사소개.jpg");
}

.position {
	width: 800px;
	margin-top: 60px;
	margin-left: 20%;
	font-size: 20px;
	color: black;
	text-shadow: 0 0 2px white;
	font-weight: 800;
	line-height: 150%;
	font-family: impact;
}

.text {
	margin-left: 60%;
	font-size: 40px;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<div class="center">
			<div class="position">영화를 찾아 떠나는 세계 여행, &nbsp;어라운드 무비와 동행하세요.</div>
			<div class="position text">Around Movie<br></div>
		</div>
	</section>

	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>