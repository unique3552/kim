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
		var center = {	lat : 54.988768, lng : -2.732226 };
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 4,
			animation : google.maps.Animation.DROP,
			center : center
		});
		
		var p12 = new google.maps.Marker({
			position : { lat : 55.855377, lng : -3.160198 },
			map : map });
		p12.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+12; });

		var p15 = new google.maps.Marker({
			position : { lat : 51.752023, lng : -1.257731 },
			map : map });
		p15.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+15; });

		var p18 = new google.maps.Marker({
			position : { lat : 51.753808, lng : -1.253733 },
			map : map });
		p18.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+18; });

		var p22 = new google.maps.Marker({
			position : { lat : 57.273896, lng : -5.516159 },
			map : map });
		p22.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+22; });

		var p38 = new google.maps.Marker({
			position : { lat : 51.072740, lng : 0.042720 },
			map : map });
		p38.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+38; });
		
		var p44 = new google.maps.Marker({
			position : { lat : 58.195390, lng : -6.744149 },
			map : map });
		p44.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+44; });
		
		var p46 = new google.maps.Marker({
			position : { lat : 51.509509, lng : -0.098575 },
			map : map });
		p46.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+46; });
		
		var p49 = new google.maps.Marker({
			position : { lat : 51.549009, lng : -0.094034 },
			map : map });
		p49.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+49; });
		
		var p51 = new google.maps.Marker({
			position : { lat : 51.482211, lng : -3.181177 },
			map : map });
		p51.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+51; });
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
				<li class="active"><a
					href="tPackageList.tPackage?nation=england">영국</a></li>
				<li><a href="tPackageList.tPackage?nation=greece">그리스</a></li>
				<li><a href="tPackageList.tPackage?nation=taiwan">대만</a></li>
				<li><a href="tPackageList.tPackage?nation=newzealand">뉴질랜드</a></li>
			</ul>
		</nav>

		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 
				<a href="packageMain.jsp">패키지여행</a> > 영국
			</div>
		</div>
		
		<div class="wBar">
			<div class="position noTMargin">
				<img class="flag" src="${pageContext.request.contextPath}/resources/img/flag/england.png">
				<span class="title">영국</span>
			</div>
		</div>

		<div class="position formInfo">
			<table class="info">
				<tr>
					<td><span class="movie"> <video autoplay loop>
								<source	src="${pageContext.request.contextPath}/resources/movie/ENGLAND.mp4">
							</video>
					</span></td>

					<td><div class="introduce">
							<p>- 관광 정보 -</p>
							<p>1) 여행 최적기</p>
							<p>날씨가 가장 좋은 6~8월은 여행하기에 제격이다. 그러나 그만큼 사람들이 북적대고 숙박 예약이나 관광지
								입장권 구매가 쉽지 않다. 더욱 여유롭게 영국을 둘러보고 싶다면 4~5월, 9~10월을 추천한다. 날씨도 적당하고
								관광객들이 덜 붐빈다.</p>
							<p>2) 주요 도시</p>
							<p>런던, 옥스퍼드, 버밍엄, 노팅엄, 케임브리지, 리버풀, 맨체스터, 웨일스, 스코틀랜드, 애버딘, 리즈,
								엑서터</p>
							<p>3) 주요 관광지</p>
							<p>런던</p>
							<p>버킹엄 궁전, 웨스트민스터 사원, 대영박물관, 타워 브리지, 런던 브리지, 케임브리지, 런던 아이,
								피커딜리 서커스, 트라팔가 광장, 내셔널 갤러리, 세인트 폴 대성당, 하이드 파크, 코벤트 가든, 국회의사당,셜록
								홈스 박물관, 자연사 박물관, 테이트 모던, 노팅 힐, 옥스퍼드, 윈저성, 런던 탑, 윈저성 등</p>
							<p>옥스퍼드</p>
							<p>옥스퍼드 스토리, 셸도니언 극장, 머들린 칼리지, 카팩스 타워 등</p>
							<p>케임브리지</p>
							<p>퀸스 칼리지, 킹스 칼리, 트리니티 칼리지 등</p>
							<p>윈저</p>
							<p>윈저성, 이튼칼리지 등</p>
							<p>그리니치</p>
							<p>구 왕립 천문대, 국립 해양 박물관, 커티 사크 호 등</p>
							<p>4) 대표 음식</p>
							<p>피시 앤 칩스</p>
							<p>여행 중 어디에서나 맛볼 수 있는 영국의 대표 요리다. 영국은 지형적 조건 때문에 생선이 많이 잡히고
								감자 생산량도 풍부한데, 피시 앤 칩스는 이 두 가지 재료를 이용해 조리한 요리다. 대구나 가자미 등 흰살생선을
								기름에 튀겨 감자튀김을 곁들여 먹는다.</p>
							<p>로스트 비프</p>
							<p>온 가족이 교회를 다녀온 일요일에 점심으로 고기를 먹던 풍습에서 유래한 음식이라고 해서 '선데이
								로스트'라 부르기도 한다. 쇠고기를 양념 없이 통째로 오븐에 구워 조리하여 구운 야채들과 함께 접시에 낸다.
								쇠고기를 굽는 과정에서 흘러나온 고깃 기름에 달걀과 밀가루를 섞어 요크셔 푸딩을 만들기도 한다.</p>
							<p>하기스</p>
							<p>스코틀랜드의 대표적인 요리로 양의 내장을 잘게 다져 현미와 섞은 것을 양의 위장에 채워서 찐다. 취향에
								따라 메시포테이토와 순무를 곁들이기도 한다.</p>
							<p>- 기타 여행팁 -</p>
							<p>1) 통화 정보</p>
							<p>영국은 유럽연합 소속이지만 공식통화인 유로 대신 자국 화폐 단위인 파운드 스털링을 사용한다. 흔히
								파운드(GBP)라고 부르며 기호는 ￡이다. 보조화폐는 페니와 펜스(페니의 복수형)를 사용한다. 지폐는 ￡50,
								￡20, ￡10, ￡5가 있고, 동전은 ￡2, ￡1, 50p, 20p, 10p, 5p, 2p, 1p가 있다.
								￡1=100p이다.</p>
							<p>2) 환전 정보</p>
							<p>여행 일정이 짧고, 경비가 많지 않다면 국내에서 환전해 파운드로 가져가는 것이 좋다. 인터넷에서 환전
								경우 환율 우대, 수수료 감면, 여행자보험 무료 등 다양한 혜택을 받을 수 있다. 영국 현지에서 환전하려면 공항
								환전소나 시내 은행을 이용하면 된다. 그러나 공항 환전소는 환율이 좋지 않고, 시내 은행마다 환전 수수료가 조금씩
								다르다는 점을 염두에 둬야 한다. 간혹 환전 업무를 하지 않는 은행도 있으므로 원화보다는 유로를 챙겨가는 것이
								낫다.</p>
							<p>여행이 장기간 일 경우에는 환율이 유리하고 수수료가 저렴한 여행자 수표를 준비하는 것도 괜찮다.
								분실하거나 도난을 당해도 재발행이 가능하다. 규모가 큰 레스토랑 등에서는 현금처럼 사용할 수도 있지만, 현지에서
								현금으로 바꿔야 하는 불편함이 있다. 분실의 위험이 있는 현금보다 신용카드나 직불카드를 선호하는 여행자라면, 일단
								외국에서 사용 가능한 카드인지 출국 전에 확인부터 해야 한다.</p>
							<p>3) 사용 전압</p>
							<p>240V, 50Hz로 우리나라 가전제품을 그대로 가져가 사용할 수 있다. 하지만 영국에서는 핀 3개의
								플러그를 사용하므로 변환플러그를 챙겨가야 한다. 현지에서 구할 수 있지만 우리나라에서 멀티어댑터를 미리 구입해
								가져가면 편리하다. 110V 콘센트를 사용하는 호텔도 간혹 있다.</p>
							<p>4) 전화 사용법</p>
							<p>곳곳에 공중전화가 마련되어 있으며 동전이나 카드(전화카드 혹은 크레디트 카드)를 이용해 전화를 이용할 수
								있다. 동전은 10p, 20p, 50p, ￡1를 사용할 수 있는데, 간혹 ￡2를 사용할 수 있는 전화기도 있다.
								우리나라와 마찬가지로 사용하지 않는 동전만 반환되니 작은 금액의 동전을 사용하는 것이 좋다. 전화카드는 요금별로
								다양하게 준비되어 있으며 우체국이나 쇼핑센터, 가판대 등에서 구할 수 있다.</p>
							<p>한국으로 전화하려면 국제인식번호 00(국제자동전화식별번호)+82(국가번호)+0을 뺀
								지역번호+상대방전화번호를 누르면 된다. 호텔 전화기를 이용하는 경우에는 호텔 외선번호를 누르고 사용한다. 호텔
								전화는 기본 전화 요금에 호텔 서비스요금이 10~15％ 정도 추가되므로 비싼 편이다.</p>
							<p>5) 우편 사용법</p>
							<p>영국 국립 우편 제도인 로열 메일은 세계에서 가장 빠른 우편 서비스를 제공하는 곳 중 하나로 평가받고
								있다. 우표는 우체국과 지역 상점, 쇼핑센터 등에서 판매되고 있으며 로열 메일 우편함은 시내 곳곳에 배치되어 있다.
								우체국은 우편과 소포 배달 외에도 환전, 각종 수납 등 다양한 서비스를 제공한다. 우체국은 주중 오전 9시부터 오후
								5시 30분까지 운영한다. 규모가 큰 우체국의 경우 토요일에 문을 여는 경우가 있지만, 오후 12시 30분에 업무를
								종료한다.</p>
							<p>6) 인터넷 사용법</p>
							<p>영국은 다른 유럽국가에 비해 인터넷 사용 환경이 좋은 편으로, 호텔과 인터넷 카페 등에서 인터넷을 사용할
								수 있다. 대부분 호텔에서는 유선 인터넷이나 무선 인터넷이 가능하지만, 간혹 서비스를 제공하지 않는 곳이 있으니
								확인을 해야 한다. 인터넷 이용비는 장소에 따라 다르지만 보통 시간당 1~3파운드 정도다. 공공도서관 같은 곳에서는
								무료로 인터넷을 사용할 수 있다.</p>
							<p>7) 치안 상태</p>
							<p>영국은 유럽 중에서도 비교적 치안이 좋은 편으로 혼자 여행하는 것도 크게 위험하지 않다.</p>
							<p>8) 여행 안전수칙</p>
							<p>현지에서는 야간 외출을 자제하고 우범지역은 가급적 방문하지 않도록 한다. 저렴한 가격의 무허가 숙박업소는
								되도록 피한다. 사람들이 많이 몰리는 유명 관광지에서는 소매치기를 주의하고 값비싼 물건은 눈에 띄지 않도록 한다.
								버스를 탈 때에는 운전기사 뒷좌석에, 2층 버스일 경우 운전자 시야에 들어오는 1층에 앉는 것이 좋다. 열차나
								지하철을 이용할 때는 사람들이 많은 칸에 탑승하고 택시를 이용할 때는 영국 정부가 승인한 택시(black cab)를
								이용하는 것이 안전하다. 영국에서는 자동차의 핸들이우측에 달려 있어 우리나라와는 반대로 좌측통행을 한다. 그래서
								길을 건널 때 반드시 오른쪽 방향을 보고 차량의 위치가 어디인지 주의해야 한다. 그리고 비가 많이 오는 영국날씨의
								특성상 우산이나 간단한 비옷을 준비하면 유용하다.</p>
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