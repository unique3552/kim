<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style type="text/css">
section {
	margin-left: 0px;
	width: 100%;
}

.position {
	width: 1500px;
	text-align: center;
}

table.menu {
	height: 100px;
	margin: 20px auto;
}

#button {
	cursor: pointer;
}
</style>
<script type="text/javascript">
$(function() {
	$("#button").click(function() {
		location.href = "${pageContext.request.contextPath}/rentCar/rentCarList.rentCar";
	});
});
</script>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<div class="position">
			<img src="${pageContext.request.contextPath}/resources/img/rentCarBanner/rent5_1.jpg">
			<img src="${pageContext.request.contextPath}/resources/img/rentCarBanner/rent5_2.jpg">
			<img id="button" src="${pageContext.request.contextPath}/resources/img/rentCarBanner/rent5_3.jpg">
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>