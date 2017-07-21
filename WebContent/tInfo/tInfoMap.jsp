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

		var p1 = new google.maps.Marker({
			position : { lat : 35.686135, lng : 139.730218 },
			map : map });
		p1.addListener('click', function() { location.href="./tInfoView.tInfo?num="+1; });

		var p2 = new google.maps.Marker({
			position : { lat : 48.080865, lng : 7.357040 },
			map : map });
		p2.addListener('click', function() { location.href="./tInfoView.tInfo?num="+2; });

		var p3 = new google.maps.Marker({
			position : { lat : 33.850000, lng : 132.783333 },
			map : map });
		p3.addListener('click', function() { location.href="./tInfoView.tInfo?num="+3; });

		var p4 = new google.maps.Marker({
			position : { lat : 25.109236, lng : 121.846263 },
			map : map });
		p4.addListener('click', function() { location.href="./tInfoView.tInfo?num="+4; });

		var p5 = new google.maps.Marker({
			position : { lat : 35.665281, lng : 139.726372 },
			map : map });
		p5.addListener('click', function() { location.href="./tInfoView.tInfo?num="+5; });

		var p6 = new google.maps.Marker({
			position : { lat : 26.871233, lng : 100.231327 },
			map : map });
		p6.addListener('click', function() { location.href="./tInfoView.tInfo?num="+6; });

		var p7 = new google.maps.Marker({
			position : { lat : 39.916332, lng : 116.397142 },
			map : map });
		p7.addListener('click', function() { location.href="./tInfoView.tInfo?num="+7; });

		var p8 = new google.maps.Marker({
			position : { lat : 35.673219, lng : 139.740623 },
			map : map });
		p8.addListener('click', function() { location.href="./tInfoView.tInfo?num="+8; });

		var p9 = new google.maps.Marker({
			position : { lat : 48.858377, lng : 2.294492 },
			map : map });
		p9.addListener('click', function() { location.href="./tInfoView.tInfo?num="+9; });

		var p10 = new google.maps.Marker({
			position : { lat : 5.970093, lng : -62.536220 },
			map : map });
		p10.addListener('click', function() { location.href="./tInfoView.tInfo?num="+10; });

		var p11 = new google.maps.Marker({
			position : { lat : 48.620827, lng : -1.534253 },
			map : map });
		p11.addListener('click', function() { location.href="./tInfoView.tInfo?num="+11; });

		var p12 = new google.maps.Marker({
			position : { lat : 55.855377, lng : -3.160198 },
			map : map });
		p12.addListener('click', function() { location.href="./tInfoView.tInfo?num="+12; });

		var p13 = new google.maps.Marker({
			position : { lat : 35.687487, lng : 139.712819 },
			map : map });
		p13.addListener('click', function() { location.href="./tInfoView.tInfo?num="+13; });

		var p14 = new google.maps.Marker({
			position : { lat : 48.860583, lng : 2.337633 },
			map : map });
		p14.addListener('click', function() { location.href="./tInfoView.tInfo?num="+14; });

		var p15 = new google.maps.Marker({
			position : { lat : 51.752023, lng : -1.257731 },
			map : map });
		p15.addListener('click', function() { location.href="./tInfoView.tInfo?num="+15; });

		var p16 = new google.maps.Marker({
			position : { lat : 36.236600, lng : 137.189872 },
			map : map });
		p16.addListener('click', function() { location.href="./tInfoView.tInfo?num="+16; });

		var p17 = new google.maps.Marker({
			position : { lat : 36.234185, lng : 137.185787 },
			map : map });
		p17.addListener('click', function() { location.href="./tInfoView.tInfo?num="+17; });

		var p18 = new google.maps.Marker({
			position : { lat : 51.753808, lng : -1.253733 },
			map : map });
		p18.addListener('click', function() { location.href="./tInfoView.tInfo?num="+18; });

		var p19 = new google.maps.Marker({
			position : { lat : 57.635590, lng : 18.295758 },
			map : map });
		p19.addListener('click', function() { location.href="./tInfoView.tInfo?num="+19; });

		var p20 = new google.maps.Marker({
			position : { lat : 25.175288, lng : 121.433465 },
			map : map });
		p20.addListener('click', function() { location.href="./tInfoView.tInfo?num="+20; });

		var p21 = new google.maps.Marker({
			position : { lat : -33.856806, lng : 151.215293 },
			map : map });
		p21.addListener('click', function() { location.href="./tInfoView.tInfo?num="+21; });

		var p22 = new google.maps.Marker({
			position : { lat : 57.273896, lng : -5.516159 },
			map : map });
		p22.addListener('click', function() { location.href="./tInfoView.tInfo?num="+22; });

		var p23 = new google.maps.Marker({
			position : { lat : 40.758854, lng : -73.985142 },
			map : map });
		p23.addListener('click', function() { location.href="./tInfoView.tInfo?num="+23; });

		var p24 = new google.maps.Marker({
			position : { lat : 40.711238, lng : -74.007160 },
			map : map });
		p24.addListener('click', function() { location.href="./tInfoView.tInfo?num="+24; });

		var p25 = new google.maps.Marker({
			position : { lat : 40.782885, lng : -73.965384 },
			map : map });
		p25.addListener('click', function() { location.href="./tInfoView.tInfo?num="+25; });

		var p26 = new google.maps.Marker({
			position : { lat : 40.730851, lng : -73.997434 },
			map : map });
		p26.addListener('click', function() { location.href="./tInfoView.tInfo?num="+26; });
		
		var p27 = new google.maps.Marker({
			position : { lat : 44.599571, lng : 2.398537 },
			map : map });
		p27.addListener('click', function() { location.href="./tInfoView.tInfo?num="+27; });
		
		var p28 = new google.maps.Marker({
			position : { lat : 35.254646, lng : -101.643905 },
			map : map });
		p28.addListener('click', function() { location.href="./tInfoView.tInfo?num="+28; });
		
		var p29 = new google.maps.Marker({
			position : { lat : 59.441336, lng : 24.747800 },
			map : map });
		p29.addListener('click', function() { location.href="./tInfoView.tInfo?num="+29; });
		
		var p30 = new google.maps.Marker({
			position : { lat : 52.374068, lng : 4.890617 },
			map : map });
		p30.addListener('click', function() { location.href="./tInfoView.tInfo?num="+30; });
		
		var p31 = new google.maps.Marker({
			position : { lat : 29.953710, lng : -90.076095 },
			map : map });
		p31.addListener('click', function() { location.href="./tInfoView.tInfo?num="+31; });
		
		var p32 = new google.maps.Marker({
			position : { lat : -2.332764, lng : 34.828747 },
			map : map });
		p32.addListener('click', function() { location.href="./tInfoView.tInfo?num="+32; });
		
		var p33 = new google.maps.Marker({
			position : { lat : 22.231723, lng : -159.401951 },
			map : map });
		p33.addListener('click', function() { location.href="./tInfoView.tInfo?num="+33; });
		
		var p34 = new google.maps.Marker({
			position : { lat : 27.175011, lng : 78.042145 },
			map : map });
		p34.addListener('click', function() { location.href="./tInfoView.tInfo?num="+34; });
		
		var p35 = new google.maps.Marker({
			position : { lat : 48.855772, lng : 2.287612 },
			map : map });
		p35.addListener('click', function() { location.href="./tInfoView.tInfo?num="+35; });
		
		var p36 = new google.maps.Marker({
			position : { lat : 48.887917, lng : 2.329574 },
			map : map });
		p36.addListener('click', function() { location.href="./tInfoView.tInfo?num="+36; });
		
		var p37 = new google.maps.Marker({
			position : { lat : 48.886704, lng : 2.343103 },
			map : map });
		p37.addListener('click', function() { location.href="./tInfoView.tInfo?num="+37; });
		
		var p38 = new google.maps.Marker({
			position : { lat : 51.072740, lng : 0.042720 },
			map : map });
		p38.addListener('click', function() { location.href="./tInfoView.tInfo?num="+38; });
		
		var p39 = new google.maps.Marker({
			position : { lat : -13.163141, lng : -72.544965 },
			map : map });
		p39.addListener('click', function() { location.href="./tInfoView.tInfo?num="+39; });
		
		var p40 = new google.maps.Marker({
			position : { lat : 47.557567, lng : 10.749800 },
			map : map });
		p40.addListener('click', function() { location.href="./tInfoView.tInfo?num="+40; });
		
		var p41 = new google.maps.Marker({
			position : { lat : 39.174597, lng : 23.651168 },
			map : map });
		p41.addListener('click', function() { location.href="./tInfoView.tInfo?num="+41; });
		
		var p42 = new google.maps.Marker({
			position : { lat : 39.174773, lng : 23.651499 },
			map : map });
		p42.addListener('click', function() { location.href="./tInfoView.tInfo?num="+42; });
		
		var p43 = new google.maps.Marker({
			position : { lat : 48.852947, lng : 2.349859 },
			map : map });
		p43.addListener('click', function() { location.href="./tInfoView.tInfo?num="+43; });
		
		var p44 = new google.maps.Marker({
			position : { lat : 58.195390, lng : -6.744149 },
			map : map });
		p44.addListener('click', function() { location.href="./tInfoView.tInfo?num="+44; });
		
		var p45 = new google.maps.Marker({
			position : { lat : 29.313906, lng : 110.432680 },
			map : map });
		p45.addListener('click', function() { location.href="./tInfoView.tInfo?num="+45; });
		
		var p46 = new google.maps.Marker({
			position : { lat : 51.509509, lng : -0.098575 },
			map : map });
		p46.addListener('click', function() { location.href="./tInfoView.tInfo?num="+46; });
		
		var p47 = new google.maps.Marker({
			position : { lat : 63.402175, lng : -19.130600 },
			map : map });
		p47.addListener('click', function() { location.href="./tInfoView.tInfo?num="+47; });
		
		var p48 = new google.maps.Marker({
			position : { lat : -43.223394, lng : 171.714460 },
			map : map });
		p48.addListener('click', function() { location.href="./tInfoView.tInfo?num="+48; });
		
		var p49 = new google.maps.Marker({
			position : { lat : 51.549009, lng : -0.094034 },
			map : map });
		p49.addListener('click', function() { location.href="./tInfoView.tInfo?num="+49; });
		
		var p50 = new google.maps.Marker({
			position : { lat : -37.872142, lng : 175.682954 },
			map : map });
		p50.addListener('click', function() { location.href="./tInfoView.tInfo?num="+50; });
		
		var p51 = new google.maps.Marker({
			position : { lat : 51.482211, lng : -3.181177 },
			map : map });
		p51.addListener('click', function() { location.href="./tInfoView.tInfo?num="+51; });
		
		var p52 = new google.maps.Marker({
			position : { lat : 35.714951, lng : 139.517518 },
			map : map });
		p52.addListener('click', function() { location.href="./tInfoView.tInfo?num="+52; });
	}
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCGq_P8ogSYWBlfdbghNaxFAxN074GH888&callback=initMap"></script>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<nav class="col-sm-3" id="myScrollspy">
			<ul class="nav nav-pills nav-stacked">
				<li class="active"><a href="tInfoMap.jsp">여행정보 Map</a></li>
				<li><a href="tInfoList.tInfo">여행정보 List</a></li>
			</ul>
		</nav>
		
		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 여행정보 > 여행정보 Map
			</div>
		</div>

		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">여행정보 Map</p>
			</div>	
		</div>
		
		<div class="position formInfo">
			<div id="map"></div>
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>