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
		$("#big").click(function() {
			location.href = "${pageContext.request.contextPath}/tInfo/tInfoList.tInfo";
		});
		$("#one").click(function() {
			location.href = "${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num=1";
		});
		$("#two").click(function() {
			location.href = "${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num=27";
		});
		$("#three").click(function() {
			location.href = "${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num=23";
		});
		$("#four").click(function() {
			location.href = "${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num=35";
		});
		$("#five").click(function() {
			location.href = "${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num=3";
		});
		$("#six").click(function() {
			location.href = "${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num=15";
		});
	});
</script>
<style type="text/css">
section {
	margin-top: -20px;
	margin-left: 0px;
	width: 100%;
	background-color: #f1f1f1;
	padding-bottom: 100px;
}

h2{
	font-family:NanumGothic,’나눔고딕’,ng,sans-serif;
}

.carousel-inner > .item > img, .carousel-inner > .item > a > img {
	width: 100%;
	height: 800px;
	margin: auto;
}

.center {
	width: 100%;
	height: 800px;
	margin: 0px auto;
}

.position {
	width: 1500px;
	height: 800px;
	margin: 10px auto;
	background-color: white;
	padding-left: 15px;
}

.banner {
	width: 300px;
	height: 300px;
	margin: 30px;
	float: left;
	font-weight: bold;
	text-align: center;
	background-size: 100% 100%;
	cursor: pointer;
}

.bigban {
	width: 660px;
	background-image: url("${pageContext.request.contextPath}/resources/img/banner/side/1.gif");
}

.one {
	background-image: url("${pageContext.request.contextPath}/resources/img/banner/side/2.jpg");
}

.two {
	background-image: url("${pageContext.request.contextPath}/resources/img/banner/side/3.jpg");
}

.three {
	background-image: url("${pageContext.request.contextPath}/resources/img/banner/side/4.jpg");
}

.four {
	background-image: url("${pageContext.request.contextPath}/resources/img/banner/side/5.jpg");
}

.five {
	background-image: url("${pageContext.request.contextPath}/resources/img/banner/side/6.jpg");
}

.six {
	background-image: url("${pageContext.request.contextPath}/resources/img/banner/side/7.jpg");
}

h2 {
	color:  rgb(0,174,240);
}

.text {
	margin-top: 20pt;
	color: white;
	text-shadow: 0 0 2px #f00;
	font-weight: 800;
	line-height: 150%;
	font-family: impact;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<div class="center">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
					<li data-target="#myCarousel" data-slide-to="3"></li>
					<li data-target="#myCarousel" data-slide-to="4"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<a href="${pageContext.request.contextPath}/flight/mainFlight.jsp"><img src="${pageContext.request.contextPath}/resources/img/banner/airplane.jpg"></a>
						<div class="carousel-caption">
							<h3>항공기 예약 전격 시행 !</h3>
						</div>
					</div>

					<div class="item">
						<a href="${pageContext.request.contextPath}/rentCar/rentCarList.rentCar"><img src="${pageContext.request.contextPath}/resources/img/banner/rentcar.jpg"></a>
						<div class="carousel-caption">
							<h3>렌터카 예약을 쉽고 간편하게 !</h3>
						</div>
					</div>
					
					<div class="item">
						<a href="${pageContext.request.contextPath}/tPackage/tPackageList.tPackage?nation=japan"><img src="${pageContext.request.contextPath}/resources/img/banner/japan.jpg"></a>
						<div class="carousel-caption">
							<h3>가깝고도 먼 일본 지금 떠나보아요 !</h3>
						</div>
					</div>
					
					<div class="item">
						<a href="${pageContext.request.contextPath}/tPackage/tPackageList.tPackage?nation=china"><img src="${pageContext.request.contextPath}/resources/img/banner/china.jpg"></a>
						<div class="carousel-caption">
							<h3>거대한 나라 중국 무엇이 기다리고 있을까요 ?</h3>
						</div>
					</div>
					
					<div class="item">
						<a href="${pageContext.request.contextPath}/tPackage/tPackageList.tPackage?nation=usa"><img src="${pageContext.request.contextPath}/resources/img/banner/usa.jpg"></a>
						<div class="carousel-caption">
							<h3>머나먼 미국에는 무엇이 당신을 기다리고있을까요 ?</h3>
						</div>
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a> <a class="right carousel-control" href="#myCarousel" role="button"	data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<!-- banner end -->
		
		<div class="position">
			<h2>HOT 이슈 상품</h2>
			<div class="banner bigban" id="big"><h3 class="text">애니메이션과 함께하는 여행</h3></div>
			<div class="banner one" id="one"><h3 class="text">'너의 이름은' 장소를<br>	찾아가봐요</h3></div>
			<div class="banner two" id="two"><h3 class="text">'미녀'와 '야수'와<br>함께 떠나는 여행</h3></div>
			<div class="banner three" id="three"><h3 class="text">'비긴어게인'<br>감성 속으로</h3></div>
			<div class="banner four" id="four"><h3 class="text">'인셉션'<br>꿈의 세계로</h3></div>
			<div class="banner five" id="five"><h3 class="text">행방불명이 된<br>'센'과'치히로'를<br>찾아 떠나요  </h3></div>
			<div class="banner six" id="six"><h3 class="text">'해리포터'<br>그 마법의 세계로</h3></div>
		</div>
		
		
	</section>

	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>