<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>어라운드 무비</title>
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/tInfo.css">
<%@ include file="/sub/temp/bootStrap.jspf"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	$("#del").click(function() {
		location.href = "./tInfoDelete.tInfo?num=${tInfo.num}";
	});
	
	$("#returnMap").click(function() {
		location.href = "${pageContext.request.contextPath}/tInfo/tInfoMap.jsp";
	});
	
	$("#returnList").click(function() {
		location.href = "${pageContext.request.contextPath}/tInfo/tInfoList.tInfo";
	});
});
</script>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf"%>
	
	<div class="hightop">
		<img class="headImg" alt="" src="/Semi_Project_1/resources/img/tInfo/vImg/${tInfo.vimg}">
	</div>
	
	<div class="side"></div>
	
	<section>
		
		<div class="topBox">
			<table class="nation"><tr>
			<td><img class="flag" alt="국기" src="../resources/img/tInfo/nImg/${tInfo.nimg}"></td>
			<td class="name">${tInfo.nation}</td>
			</tr></table>
		</div>
		
		<div class="midBox">
			<img class="img leftImg" alt="" src="../resources/img/tInfo/vImg2/${tInfo.vimg2}">
			<table class="write"><tr><td class="text story">${tInfo.video}</td></tr>
			<tr><td class="content right">${tInfo.vinfo}</td></tr></table>
		</div>
		
		<div class="midBox">
			<img class="img rightImg" alt="" src="../resources/img/tInfo/tImg/${tInfo.timg}">
			<table class="write"><tr><td class="text story">${tInfo.tname}</td></tr>
			<tr><td class="content left">${tInfo.tinfo}</td></tr></table>
		</div>
		
		<div>
			<table class="sub">
				<colgroup>
					<col width="33%">
					<col width="33%">
					<col width="33%">
				</colgroup>
				<tr>
					<td><img class="subImg" alt="지역사진2" src="../resources/img/tInfo/tImg2/${tInfo.timg2}"></td>
					<td><img class="subImg" alt="지역사진3" src="../resources/img/tInfo/vImg3/${tInfo.vimg3}"></td>
					<td><img class="subImg" alt="지역사진4" src="../resources/img/tInfo/tImg3/${tInfo.timg3}"></td>
				</tr>
				
				<tr>
					<td class="button" colspan="3">
						<input type="button" class="btn btn-primary" value="세계지도 GO" id="returnMap">
						<input type="button" class="btn btn-warning" value="리스트 GO" id="returnList">
					</td>
				</tr>
			</table>
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf"%>
</body>
</html>