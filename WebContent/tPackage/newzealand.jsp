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
		var center = {	lat : -43.559160, lng : 172.646117 };
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 4,
			animation : google.maps.Animation.DROP,
			center : center
		});
		
		var p48 = new google.maps.Marker({
			position : { lat : -43.223394, lng : 171.714460 },
			map : map });
		p48.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+48; });
		
		var p50 = new google.maps.Marker({
			position : { lat : -37.872142, lng : 175.682954 },
			map : map });
		p50.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+50; });
		
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
				<li><a href="tPackageList.tPackage?nation=taiwan">대만</a></li>
				<li class="active"><a
					href="tPackageList.tPackage?nation=newzealand">뉴질랜드</a></li>
			</ul>
		</nav>

		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 
				<a href="packageMain.jsp">패키지여행</a> > 호주
			</div>
		</div>
		
		<div class="wBar">
			<div class="position noTMargin">
				<img class="flag" src="${pageContext.request.contextPath}/resources/img/flag/newzealand.png">
				<span class="title">호주</span>
			</div>
		</div>

		<div class="position formInfo">
			<table class="info">
				<tr>
					<td><span class="movie"> <video autoplay loop>
								<source	src="${pageContext.request.contextPath}/resources/movie/NEWZEALAND.mp4">
							</video>
					</span></td>

					<td><div class="introduce">
							<p>- 관광 정보</p>

							<p>1) 여행 최적기</p>
							<p>1년 내내 여행자들의 발길이 끊이지 않는 나라다. 남섬, 북섬으로 나누어져 있어 지역별로 기후가 다르다.
								여름 시즌인 11~2월은 날씨가 좋아 북섬을 여행하기에 제격이다. 그러나 그만큼 사람들이 북적대고 숙박 예약이나
								관광지 입장권 구매가 쉽지 않다. 남섬은 겨울 스포츠를 즐기기 좋은 곳으로 어느 때든 계절에 상관없이 좋은 설질의
								스키장에서 스키를 마음껏 즐길 수 있다.</p>

							<p>2) 주요 도시</p>
							<p>오클랜드, 웰링턴, 크라이스트처치, 퀸스타운, 타우포, 기스본, 더니든 등</p>

							<p>3) 주요 관광지</p>
							<p>오클랜드</p>
							<p>데번포트, 오클랜드 하버 브리지, 이든 동산, 스카이 타워, 와이헤케섬, 비아덕트 항구, 미션베이,
								폰슨비</p>

							<p>웰링턴</p>
							<p>국회의사당, 시립미술관, 해양박물관, 콜로니얼 코티지 박물관, 캐서린 맨스필드 생가, 올드 세인트폴 교회</p>

							<p>퀸스타운</p>
							<p>퀸스타운 가든, 애로타운, 월터 피크 농장, 와카티푸 호수, 번지점프 브리지, 봅스힐, 윌리엄스 코티지,
								라세터즈 워프 카지노, 키위 & 버드라이프 파크, 언더워터월드</p>

							<p>크라이스트처치</p>
							<p>뉴질랜드 크라이스트처치 대성당, 크라이스트처치 카지노, 빅토리아 광장, 캔터베리 박물관, 해글리 공원,
								추억의 다리, 타운 홀, 캡틴 스콧 기념상, 아트 갤러리, 서던 인카운터 수족관 & 키위 하우스</p>

							<p>4) 대표 음식</p>
							<p>피시 앤 칩스(Fish & Chips)</p>
							<p>영국의 대표 요리로 잘 알려져 있는 피시 앤 칩스는 영연방 국가인 뉴질랜드에서도 친숙하게 만날 수 있다.
								어디에서나 저렴한 가격으로 푸짐하게 즐길 수 있어 여행자들에게 인기다.</p>

							<p>항이(Hangi)</p>
							<p>뉴질랜드 원주민인 마오리족의 전통 요리. 지열을 이용해 고기와 채소를 익혀서 먹는 요리로, 주로
								로토로아(Rotoroa) 지방에서 맛볼 수 있다. 땅 속에 구덩이를 파고 그 안에 지열을 받아 달궈진 돌을 넣으면
								항이 요리를 만들기 위한 준비가 끝난다. 요리 재료는 주로 감자, 고구마, 옥수수 등 향토적 냄새가 물씬 풍기는
								재료와 돼지고기 등을 사용하는데 특별한 양념 없이 재료 그대로 나뭇잎에 싸거나 바구니에 넣어 달궈진 돌 위에
								놓는다. 흙을 덮은 뒤 4시간 정도 놔두면 내용물이 익는다.</p>

							<p>- 기타 여행팁 -</p>

							<p>1) 통화 정보</p>
							<p>뉴질랜드 달러를 사용하며 NZ$로 표기한다. 보조 화폐는 센트(CENT,¢)이며 NZ$1는 100¢이다.
								미국 달러 사용도 가능하나, 환전 수수료를 줄이려면 뉴질랜드 달러를 미리 준비하는 편이 좋다.</p>

							<p>2) 환전 정보</p>
							<p>뉴질랜드에는 토마스 쿡 환전소와 ASB Bank, The National Bank of New
								Zealnad, Bnz Bank, Westpac 은행에서 환전이 가능하다. 은행 외에도 도시의 번화가 곳곳에
								환전소가 설치되어 있다.</p>

							<p>3) 사용 전압</p>
							<p>뉴질랜드 전역에서 사용되는 전압과 주파수는 각각 230~240V, 50Hz다. 한국 전자 제품을 그대로
								사용할 수 있다. 그러나 민감한 전자 제품의 경우 컨버터를 사용하는 것이 안전하다. 콘센트 구멍이 한국과 다르므로
								어댑터는 필수다.</p>

							<p>4) 전화 사용법</p>
							<p>대부분의 공중전화는 전화카드용이다. 카드는 서점이나 신문 가판대에서 구입할 수 있다. 카드 가격은
								NZ$2부터. 동전이나 신용카드를 쓸 수 있는 전화도 있지만 많지 않다. 한국으로 전화를 하려면 식별번호인
								‘00’을 누른 후 한국 국가번호 ‘82’, 0을 제외한 지역번호, 걸고자 하는 곳의 전화번호 순으로 누르면 된다.
								서울의 123-4567로 걸려고 한다면 00-82-2-123-4567을 누르면 된다. 단, 호텔에서 건다면 호텔의
								외선번호를 먼저 누른 뒤에 이 번호를 누른다. 호텔 전화의 경우 기본 전화요금에 호텔의 서비스 요금이 10~15%
								정도 추가되므로 비싸다. 콜렉트콜 번호는 080-044-8043이다.</p>

							<p>5) 우편 사용법</p>
							<p>뉴질랜드 우체국이나 편의점, 서점, 주유소 등지에서 쉽게 우표를 구입할 수 있으며, 대부분의 우편
								서비스는 해당 국가가 속해 있는 구역에 따라 비용과 배송 기간이 다르니 표를 보고 참고해야 한다. (한국은 G구역에
								속함) 서신의 경우 국제 항공과 국제 이코노미의 두 가지 옵션 중에서 선택 이용할 수 있으며, 국제 항공은 빠르지만
								국제 이코노미가 좀 더 저렴하다. 소포는 가장 빠른 서비스인 인터내셔널 익스프레스와 약간 저렴하나 빠른 인터내셔널
								에어, 느리지만 저렴한 이코노미의 세 가지 옵션 중에서 선택할 수 있다. 우편 서비스에 대한 자세한 내용은 수신자
								부담 전화 0800 501 501번으로 문의하거나 www.nzpost.co.nz/Cultures/en-NZ를
								방문하면 자세히 알 수 있다. 우편 서비스가 잘 발달되어 있으며, 사설 특송제 활용도 가능하다. 우체국 근무시간은
								월~금요일 9:00-17:00이며 규모가 큰 우체국의 경우 토요일 오전도 근무한다. 청구서 발송 및 지불 등이
								대부분 우편으로 이루어지고 우체국을 통한 택배 이용도 활성화되어 있다.</p>

							<p>6) 인터넷 사용법</p>
							<p>기업, 대학, 관공서 등에서 ADSL을 이용한 인터넷 접속이 주로 이루어지고 있다. ADSL 이용료가
								높아 일반 가정에서는 전화선을 이용한 모뎀 접속이 주종을 이루나 점차 가정용 ADSL 연결이 확산되고 있는 추세다.
								뉴질랜드 국영통신회사 Telecom이 회선 부분에서 독점적인 지위를 누리면서 통신망 개방이 이루어지지 않고 있어
								ADSL 가입 비용 및 사용료가 매우 높은 실정이다. 인터넷은 비교적 잘 발달되어 있고 인터넷 사용인구도 많은
								편으로 번화가에서 인터넷 카페도 손쉽게 찾을 수 있다.</p>

							<p>7) 치안 상태</p>
							<p>뉴질랜드의 치안은 안전한 편으로, 다른 나라에 비해 사고 발생률이 적다.</p>

							<p>8) 여행 안전수칙</p>
							<p>뉴질랜드는 일조량이 많고 자외선이 강하기로 유명해 피부암 발생률이 높은 나라다. 따라서 선글라스,
								선크림, 모자는 계절에 상관없이 꼭 필요하니 잊지 말자. 선크림은 차단지수가 높은 것을 고르는 것이 좋다.
								뉴질랜드는 날씨가 따뜻한 온대 기후지만 건조하기 때문에 여름에도 나무 그늘 밑에 들어가면 썰렁한 기운을 느낀다.
								하루에 4계절이 다 있다는 우스갯소리가 있을 만큼 갑자기 비가 오거나 날씨가 서늘해지기 때문에 우비나 겉옷을 반드시
								지참해야 한다.</p>
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