<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

video {
	position: fixed;
	top: 0;
	left: 0;
	min-width: 100%;
	min-height: 100%;
	width: auto;
	height: auto;
	z-index: -1;
}

.shadow {
	text-align: center;
	color: #000000;
	text-shadow: #ffffff 0px 0px 10px;
	text-shadow: #ffffff 0px 0px 10px 10px;
}
</style>
<script type="text/javascript">
function goPage() {
	location.href="index.jsp";
}
</script>
</head>
<body>
	<a href="javascript:goPage()">
		<video autoplay loop>
			<source	src="${pageContext.request.contextPath}/resources/movie/ENGLAND.mp4">
		</video>
	</a>
	<h1 class="shadow">Around Movie에 오신것을 환영합니다</h1>
	<p class="shadow">메인 화면으로 이동하기 위해 화면을 클릭해주세요</p>
</body>
</html>