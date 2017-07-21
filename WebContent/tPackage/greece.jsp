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
		var center = {	lat : 39.485711, lng : 22.544683 };
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 6,
			animation : google.maps.Animation.DROP,
			center : center
		});
		
		var p41 = new google.maps.Marker({
			position : { lat : 39.174597, lng : 23.651168 },
			map : map });
		p41.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+41; });
		
		var p42 = new google.maps.Marker({
			position : { lat : 39.174773, lng : 23.651499 },
			map : map });
		p42.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+42; });
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
				<li class="active"><a
					href="tPackageList.tPackage?nation=greece">그리스</a></li>
				<li><a href="tPackageList.tPackage?nation=taiwan">대만</a></li>
				<li><a href="tPackageList.tPackage?nation=newzealand">뉴질랜드</a></li>
			</ul>
		</nav>

		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 
				<a href="packageMain.jsp">패키지여행</a> > 그리스
			</div>
		</div>

		<div class="wBar">
			<div class="position noTMargin">
				<img class="flag" src="${pageContext.request.contextPath}/resources/img/flag/greece.png">
				<span class="title">그리스</span>
			</div>
		</div>

		<div class="position formInfo">
			<table class="info">
				<tr>
					<td><span class="movie"> <video autoplay loop>
								<source	src="${pageContext.request.contextPath}/resources/movie/GREECE.mp4">
							</video>
					</span></td>

					<td><div class="introduce">
							<p>- 관광 정보 -</p>

							<p>1) 여행 최적기</p>
							<p>대체로 날씨가 좋은 6월 중순~9월이 그리스의 여행성수기다. 성수기인 만큼 숙박료는 매우 비싸지만,
								항공기와 페리 또한 자주 운행되므로 여행하기에는 편리하다.</p>

							<p>2) 주요 도시</p>
							<p>아테네, 테살로니키, 라리사, 파트라, 올림피아, 델포이</p>

							<p>3) 주요 관광지</p>
							<p>아크로폴리스, 파르테논 신전, 디오니소스 극장, 애기나 섬, 국립고고학 박물관, 고대 아고라, 올림픽
								경기장, 아레오 파고스 언덕, 리카비토스 언덕, 올림피아 제우스 신전, 수니온 곶, 신타그마 광장, 산토리니 섬,
								크레타 섬, 로도스 섬, 미코노스 섬, 낙소스 섬</p>

							<p>4) 대표 음식</p>
							<p>고기 요리를 즐기는 그리스인들은 특히 양고기와 양치즈(훼따)를 많이 먹는다. 또한 해안을 따라 신선한
								어패류를 파는 곳들로 넘쳐나는데 특히 올리브유를 발라 구운 새우나 송어, 도미 튀김 등이 많다. 얇게 저민 고기를
								빵에 싸서 먹는 기로스나 오징어 튀김인 칼라마리 등도 길에서 쉽게 사 먹을 수 있다. 그리스의 과일은 당도가 높으며
								아주 신선하다. 지중해성 기후의 영향인데 과일 재배가 잘 되어 수확량도 많으므로 가격이 아주 싸다. 여름에는 멜론,
								수박이 많이 나고 가을에는 포도가 제철이다. 무화과, 땅콩, 아몬드 등의 견과류도 맛이 좋고 많이 난다.</p>

							<p>커피는 세 종류로 뜨거운 커피인 제스토(Zwsto), 크림 커피인 메 갈라(Me Gala), 설탕이
								들어가 있는 커피인 메 자하키(Me Zahaki)인데 대체로 시럽을 많이 넣어 진하면서 달다. 그리스에는 관광객은
								물론 젊은이들에게 인기가 높은 패스트푸드점도 여기저기에 많이 있으며 스파나코삐따라고 부르는 시금치와 치즈를 넣은
								파이는 간식으로 인기가 상당히 많다.</p>

							<p>- 기타 여행팁 -</p>

							<p>1) 통화 정보</p>
							<p>그리스는 2002년 1월부터 유로(EUR, €)를 사용하고 있다. 보조 화폐는 센트(CENT,¢)이다.
								달러도 사용은 가능하나 유로를 사용하는 것이 유리하다.</p>

							<p>2) 환전 정보</p>
							<p>여행 일정이 길지 않다면 출국전 국내에서 유로로 환전해 가져가는 것이 좋다. 그리스의 은행과 환전소에서는
								원화를 유로로 환전하는 것이 어렵기 때문이다. 환율우대, 수수료 감면 등의 혜택을 받고자 한다면 인터넷을 이용해
								환전하는 것도 좋다. 여행 일정이 긴 경우 여행자 수표를 이용하는 것도 편리한 방법 중 하나다. 재발행이 가능하므로
								분실 및 도난시에도 안심할 수 있다. 달러는 그리스 내 여러 곳에서 환전이 가능하긴 하지만 환전 시 수수료를
								지불해야 한다.</p>

							<p>3) 사용 전압</p>
							<p>표준 전압 220V, 50㎐. 둥근 구멍 두 개인 C-2형 플러그를 사용한다.</p>

							<p>4) 전화 사용법</p>
							<p>그리스의 통화료는 우리나라보다 약간 비싸다. 공중전화는 파란색이 국내 통화용, 오렌지색이 국제
								통화용이다. 대부분 카드식인데 카드는 충전 금액별로 세 종류가 있다. 카드의 구입은 그리스 전화국 OTE나 신문
								가판대인 키오스크(Kiosk)에서 가능하다. 한국으로 전화하는 방법은 00-82-(0을 제외한)지역번호-전화번호
								순이며 콜렉트콜이나 후불카드 사용 시에는 00-800-82-2111(한국통신)이나
								00800-82-11-000(데이콤)을 이용한다.</p>

							<p>5) 우편 사용법</p>
							<p>우편 이용 시에는 우체국에서 우표를 구입한 후 길거리에서 볼 수 있는 노란색 우체통을 이용한다.
								우편요금은 엽서가 €0.65이며 무게 기준으로는 21~50g까지가 €1이다.</p>

							<p>6) 인터넷 사용법</p>
							<p>인터넷 카페, 호텔 등에서 이용할 수 있다. 국내 인터넷 환경처럼 원활하지는 않으나, 아테네 올림픽 개최
								후 이용자가 늘어나면서 점차 편리해지는 추세다.</p>

							<p>7) 치안 상태</p>
							<p>그리스는 비교적 치안이 좋은 편이다. 하지만 관광객이 몰리는 일부 지역에서는 날치기나 소매치기 등의 범죄
								행위가 발생되고 있다.</p>

							<p>8) 여행 안전수칙</p>
							<p>유럽 내 다른 국가들에 비해서 그리스의 치안상태는 좋은 편이다. 하지만 1996년 이후 불법입국자 수가
								늘어나면서 해마다 범죄율도 증가하는 추세다. 관광객들로 붐비는 아테네 등지에서는 소매치기나 날치기가 늘고 있는데
								특히 현금을 많이 소지하고 있는 한국인을 노리는 경우가 많으므로 조심해야 한다.</p>
						</div></td>
				</tr>

				<tr>
					<td colspan="2" class="formInfo map">
						<div id="map"></div>
					</td>
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