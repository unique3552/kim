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
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/package.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book.css">
<%@ include file="/sub/temp/bootStrap.jspf" %>
<title>어라운드 무비</title>
<script>
	function initMap() {
		var center = {	lat : 23.461229, lng : 121.270270 };
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 7,
			animation : google.maps.Animation.DROP,
			center : center
		});
		
		var p4 = new google.maps.Marker({
			position : { lat : 25.109236, lng : 121.846263 },
			map : map });
		p4.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+4; });

		var p20 = new google.maps.Marker({
			position : { lat : 25.175288, lng : 121.433465 },
			map : map });
		p20.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+20; });
	}
$(function(){
		
		$(".tPackageView").click(function(){
			var num=$(this).attr("id");
			location.href="./tPackageView.tPackage?num="+num;
		});
		
	});
</script>
<style>
	h3{
	margin: 0;
}
.formInfo{
	width: 1020px;
}
</style>
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
				<li class="active"><a
					href="tPackageList.tPackage?nation=taiwan">대만</a></li>
				<li><a href="tPackageList.tPackage?nation=newzealand">뉴질랜드</a></li>
			</ul>
		</nav>

		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 
				<a href="packageMain.jsp">패키지여행</a> > 대만
			</div>
		</div>

		<div class="wBar">
			<div class="position noTMargin">
				<img class="flag" src="${pageContext.request.contextPath}/resources/img/flag/taiwan.png">
				<span class="title">대만</span>
			</div>
		</div>

		<div class="position formInfo">
			<table class="info">
				<tr>
					<td><span class="movie"> <video autoplay loop>
								<source	src="${pageContext.request.contextPath}/resources/movie/TAIWAN.mp4">
							</video>
					</span></td>

					<td><div class="introduce">
						<p>유용한 정보
						<p>세금 및 서비스 요금</p>
						<p>대만 제품 세금은 일반적으로 그 가격에 포함되어 있습니다, 우리는 서로를 추가 할 필요가 없습니다. 쇼핑, 비즈니스 및 더 균일 송장, 그 바우처를 받게됩니다. 대만 호텔, 다국적 레스토랑 10 %의 서비스 요금을 부과합니다.</p>

						<p>전압</p>
						<p>대만 일반 가정용 전압 조명과 110V 또는 220V, 60Hz의 주파수로 소형 가전은 가전 제품으로 해외에서 가져온 경우, 당신은 전압을 확인해야합니다, 주파수가 적용됩니다.</p>

						<p>통신 서비스</p>
						<p>대만의 공중 전화 동전 두 종류로 카드 분할.
						코인 공중 전화는 1, 5, 10 동전을 투여 할 수있다. 공중 전화와 공중 전화 카드 형의 공중 전화 IC 카드, 광 카드와 공중 전화 IC 카드 형의 공중 전화 교 $ 100 $ 200 300 수있는 각 자국이나 편의점에 광 카드 구입했습니다.
						공중 전화 국내 유료 광산 타이밍, NT 달러의 과금 단위 요금. 시내 전화, 호출 (매개 변수의 자세한 사항 1 분 동안 1 달러를 신약의 수 공중 전화를 통신 속도 )
						모든 중국 및 기타 국가 (또는 지역)은 "국제 전화 요금"전체 소득의 사전 합의에 따라 필요 IDD 전화 통화. 각 소자에 NT $ (기준 세부 단위 인 공중 전화 통신 속도 )</p>

						<p>외국인은 대만 등산 노트</p>
						<p>종종 산 허가 제어 지역 경찰서에 자신의 신분증을 제시 산에 특정 컨트롤 영역, 분기가 주둔 (전송)하는 경우로, 사전에 적용되는 직접 지불 요청을 확인해야합니다 제어하는 ​​산악 지역을 입력 누가. 중국의 산 협회 공화국 여행을 등반 영어 가이드가 이끄는 4 개 이상의 그룹을 위해 배열 될 수있다.
						외국인에 관해서는 종종 여권의 신원이나 외국인 거주 증명서, 또는 함께 산에 권한있는 기관에서 발급 한 인증서 및 문서를 발급한다 업계 권한있는 당국과 함께 산으로 응용 프로그램 외국인을 작성해야 영역 제어 산에 입학 신청, NPA 또는 카운티 (도시) 경찰서, 지점의 관할에 주둔 (전송) 또는 산 허가 신청에 국립 공원 경찰의 강제 외국인. 산 라이센스에 준용 국적을 적용 산으로 같은 문제에 자신의 사람들과 함께 외국인으로. (02) 2357-7377 :에서 산 응용 프로그램에 경찰청에 문의하시기 바랍니다.</p> 

						<p>여행자 수표</p>
						<p>대만의 많은 기업은 여행자 수표, 따라서 여행자 수표, 대만 달러로 변환 은행을 기쁘게, 사람을 허용하지 않습니다.</p>
					</div></td>
				</tr>

				<tr>
					<td colspan="2" class="formInfo map">
						<div id="map"></div>
					</td>
				</tr>
			</table>
		</div>
		<div class="position formInfo">
			<c:forEach items="${tPackage}" var="p">
				<div id="${p.num}" class="tPackageView">
					<table class="element Lcolor">
						<tr>
							<td colspan="2"><img width="300px" height="250px" src="../tPackageImg/${p.img}"></td>
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
	</section>

	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>