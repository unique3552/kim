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
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book.css">
<%@ include file="/sub/temp/bootStrap.jspf" %>
<title>어라운드 무비</title>
<style type="text/css">
	h3{
	margin: 0;
}
.formInfo{
	width: 1020px;
}
#map {
	width: 100%;
	height: 600px; 
	margin: 20px auto;
}

.map {
	width: 1100px;
}

.list {
	overflow: hidden;
}

.element {
   width: 293px;
   margin: 2%;
   cursor: pointer;
   float: left;
}

.pname{
	font-weight: bold;
	font-size: 17px;
}

.price{
	font-size: 20px;
	color:  rgb(0,174,240);
}
.Lcolor{
	background-color: white;
}
</style>
<script>
	function initMap() {
		var center = { lat :23.880919, lng : 136.717773 };
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 2,
			animation : google.maps.Animation.DROP,
			center : center
		});
		
		var england = new google.maps.Marker({
			position : { lat : 51.505912, lng : -0.127716 },
			map : map });
		england.addListener('click', function() { location.href="tPackageList.tPackage?nation=england"; });
		
		var greece = new google.maps.Marker({
			position : { lat : 37.947086, lng : 23.689287 },
			map : map });
		greece.addListener('click', function() { location.href="tPackageList.tPackage?nation=greece"; });

		var newzealand = new google.maps.Marker({
			position : { lat : -43.559160, lng : 172.646117 },
			map : map });
		newzealand.addListener('click', function() { location.href="tPackageList.tPackage?nation=newzealand"; });

		var taiwan = new google.maps.Marker({
			position : { lat : 23.461229, lng : 121.270270 },
			map : map });
		taiwan.addListener('click', function() { location.href="tPackageList.tPackage?nation=taiwan"; });

		var usa = new google.maps.Marker({
			position : { lat : 39.734195, lng : -101.577699 },
			map : map });
		usa.addListener('click', function() { location.href="tPackageList.tPackage?nation=usa"; });

		var japan = new google.maps.Marker({
			position : { lat : 36.421432, lng : 138.299873 },
			map : map });
		japan.addListener('click', function() { location.href="tPackageList.tPackage?nation=japan"; });

		var china = new google.maps.Marker({
			position : { lat : 36.129542, lng : 103.931456 },
			map : map });
		china.addListener('click', function() { location.href="tPackageList.tPackage?nation=china"; });

		var france = new google.maps.Marker({
			position : { lat : 46.439281, lng : 2.232849 },
			map : map });
		france.addListener('click', function() { location.href="tPackageList.tPackage?nation=france"; });
	}
$(function(){
	
	$(".tPackageView").click(function(){
		var num=$(this).attr("id");
		location.href="./tPackageView.tPackage?num="+num;
	});
	
	$("#insert").click(function(){
		location.href="./tPackageInsert.jsp";
	});
});
	
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCGq_P8ogSYWBlfdbghNaxFAxN074GH888&callback=initMap"></script>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<nav class="col-sm-3" id="myScrollspy">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="tPackageList.tPackage?nation=japan">일본</a></li>
				<li><a href="tPackageList.tPackage?nation=china">중국</a></li>
				<li><a href="tPackageList.tPackage?nation=usa">미국</a></li>
				<li><a href="tPackageList.tPackage?nation=france">프랑스</a></li>
				<li><a href="tPackageList.tPackage?nation=england">영국</a></li>
				<li><a href="tPackageList.tPackage?nation=greece">그리스</a></li>
				<li><a href="tPackageList.tPackage?nation=taiwan">대만</a></li>
				<li><a href="tPackageList.tPackage?nation=newzealand">뉴질랜드</a></li>
			</ul>
		</nav>

		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 패키지여행
			</div>
		</div>
		
		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">패키지여행</p>
			</div>
		</div>
		
		<div class="position formInfo">
			<div id="map"></div>
		</div>

		<div class="list position formInfo">
			<c:forEach items="${tPackage}" var="p">
				<div id="${p.num}"  class="tPackageView">
					<table class="element Lcolor">
						<tr>
							<td colspan="2"><img width="293px" height="250px" src="../tPackageImg/${p.img}"></td>
						</tr>
						<tr>
							<td class="pname">${p.name}</td>
						</tr>
						<tr>
							<td class="price">${p.price}</td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
		
		<c:if test="${sessionScope.admin!=null}">
			<div class="position">
				<input type="button" value="패키지 작성" id="insert" class="btn btn-primary">
			</div>
		</c:if>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>