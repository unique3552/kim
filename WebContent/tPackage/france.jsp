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
		var center = {	lat : 46.621041, lng : 2.470912 };
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 4,
			animation : google.maps.Animation.DROP,
			center : center
		});
		
		var p2 = new google.maps.Marker({
			position : { lat : 48.080865, lng : 7.357040 },
			map : map });
		p2.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+2; });
		
		var p9 = new google.maps.Marker({
			position : { lat : 48.858377, lng : 2.294492 },
			map : map });
		p9.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+9; });

		var p11 = new google.maps.Marker({
			position : { lat : 48.620827, lng : -1.534253 },
			map : map });
		p11.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+11; });

		var p14 = new google.maps.Marker({
			position : { lat : 48.860583, lng : 2.337633 },
			map : map });
		p14.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+14; });

		var p27 = new google.maps.Marker({
			position : { lat : 44.599571, lng : 2.398537 },
			map : map });
		p27.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+27; });
		
		var p35 = new google.maps.Marker({
			position : { lat : 48.855772, lng : 2.287612 },
			map : map });
		p35.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+35; });
		
		var p36 = new google.maps.Marker({
			position : { lat : 48.887917, lng : 2.329574 },
			map : map });
		p36.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+36; });
		
		var p37 = new google.maps.Marker({
			position : { lat : 48.886704, lng : 2.343103 },
			map : map });
		p37.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+37; });
		
		var p43 = new google.maps.Marker({
			position : { lat : 48.852947, lng : 2.349859 },
			map : map });
		p43.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+43; });
		
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
				<li class="active"><a
					href="tPackageList.tPackage?nation=france">프랑스</a></li>
				<li><a href="tPackageList.tPackage?nation=england">영국</a></li>
				<li><a href="tPackageList.tPackage?nation=greece">그리스</a></li>
				<li><a href="tPackageList.tPackage?nation=taiwan">대만</a></li>
				<li><a href="tPackageList.tPackage?nation=newzealand">뉴질랜드</a></li>
			</ul>
		</nav>

		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 
				<a href="packageMain.jsp">패키지여행</a> > 프랑스
			</div>
		</div>
		
		<div class="wBar">
			<div class="position noTMargin">
				<img class="flag" src="${pageContext.request.contextPath}/resources/img/flag/france.png">
				<span class="title">프랑스</span>
			</div>
		</div>
		
		<div class="position formInfo">
			<table class="info">
				<tr>
					<td><span class="movie"> <video autoplay loop>
								<source	src="${pageContext.request.contextPath}/resources/movie/FRANCE.mp4">
							</video>
					</span></td>

					<td><div class="introduce">
							<p>- 여행 최적기 -</p>
							<p>6~8월</p>

							<p>2) 주요 도시</p>
							<p>파리, 리옹, 보르도, 니스, 디종, 마르세유 등</p>

							<p>3) 주요 관광지</p>
							<p>오르세 미술관(Musée d'Orsay), 퐁피두 센터(Centre Pompidou),콩코르드
								광장(Place de la Concorde),생 미셸 거리(Boulevard Saint Michel),
								몽파르나스(Montparnasse), 샤르트르(Chartres), 샹젤리제 극장(Theatre des
								Champs-Elysees), 팔레 루아얄(Palais Royal), 뤽상부르 공원(Jardin du
								Luxembourg), 들라크루아 미술관(Musee National Eugene Delacroix), 파리 시립
								근대미술관(Musee d'Art Modern de la Ville de paris), 팔레 드 도쿄(Palais
								de Tokyo), 피카소 미술관(Musée National Picasso), 테르트르 광장(Place du
								Tertre), 파리 시청사(Hôtel de Ville), 팡테옹(Panthéon), 갈리에라 궁전(Palais
								GallieraPalais Galliera), 프티 팔레(Petit Palais), 코메디 프랑세즈(Comédie
								Francaise), 사크레 쾨르 성당(Basilique du Sacré Cœur), 바스티유 광장(Place de
								la Bastille)-그랑 팔레(Grand Palais), 방돔 광장(Place Vendôme),
								베르사유(Versailles), 에펠탑(Eiffel Tower), 루브르 박물관(Musée du Louvre)</p>

							<p>4) 대표 음식</p>
							<p>푸아그라(Fois Gras)</p>
							<p>철갑 상어알, 송로버섯과 더불어 세계 3대 진미 중 하나로 꼽히는 푸아그라는 거위간으로 만든 요리다.
								프랑스의 대표적 별미로서 거위간을 우유, 물, 와인 등에 담가놓았다가 양념하여 찌거나 굽거나 튀긴 요리로,
								부드러우며 고소한 맛이 특징이다. 알자스와 남부지방의 푸아그라는 프랑스 내에서도 최고로 친다.</p>

							<p>달팽이 요리(에스카르고, Escargot)</p>
							<p>프랑스인들은 전채요리로 달팽이 요리를 즐겨 먹는다. 요리에 사용하는 달팽이는 헬릭스포마티아라는 달팽이로
								식용(食用) 전용 달팽이다. 일반적 조리법은 부르고뉴식 구이로 버터와 마늘, 파슬리로 만든 양념을 달팽이에 뿌려
								오븐에 구워 만든다. 요리된 달팽이는 껍질째 들고 포크로 살을 꺼내 먹으면 된다.</p>

							<p>라타투이(Ratatouille)</p>
							<p>라타투이는 가지, 토마토, 호박 등 각종 채소와 허브를 넣어 올리브유로 볶아 만든 프로방스 지역의 전통
								음식이다. 일반적으로 육류나 다른 음식의 곁들임 요리로 먹으며, 빵이나 크래커와 함께 애피타이저로도 먹는다.</p>

							<p>부야베스(Bouillabaisse)</p>
							<p>부야베스는 마르세유의 대표 음식으로 각종 해산물과 허브, 채소를 넣어 수프처럼 큰 볼에 담아내는 요리다.
								조개, 새우, 홍합 등 신선한 해산물을 넣어 깔끔하고 담백한 맛이 난다. 국물은 바게트빵을 곁들여 먹는다.</p>

							<p>- 기타 여행팁 -</p>

							<p>1) 통화 정보</p>
							<p>프랑스는 유로를 사용한다. 유로(€)는 지폐 €500, €200, €100, €50, €20, €10,
								€5와 동전 €2, €1, 50￠, 20￠, 10￠, 5￠, 2￠, 1￠가 있다.</p>

							<p>2) 환전 정보</p>
							<p>우리나라 시중 은행이나 공항 환전소에서 유로로 환전할 수 있다. 주거래 은행을 이용하거나 사이버 환전을
								할 경우 환율 우대 혜택을 받을 수 있다. 프랑스 내에서는 은행, 우체국, 호텔, 철도역 및 공항의 환전소, 거리의
								환전상을 통해 유로로 환전할 수 있다. 환율은 은행이 가장 좋으며, 환전상은 환율이 나쁜 편이다. 은행의 큰
								지점에는 자동 환전기가 있어 24시간 내내 자동 환전을 할 수 있다.</p>

							<p>3) 사용 전압</p>
							<p>전압은 220V이며 주파수는 50hz로 국내와 동일하지만 플러그 모양이 다르기 때문에 어댑터를 준비해야
								한다. 어댑터는 국내에서 미리 구입하거나 프랑스에서도 €10 정도면 구입할 수 있다.</p>

							<p>4) 전화 사용법</p>
							<p>공중전화는 대부분 카드식으로 길거리에서 쉽게 찾아볼 수 있다. 공중전화 카드는 타박(TABAC),
								키오스크(Kiosque), 우체국에서 구입할 수 있다. 프랑스 내의 전화번호는 10자이며, 두 자리씩 끊어서 쓴다.
								공중전화로 한국으로 전화를 걸 때는 액정판에 '데크로세(Decrocher)'라 쓰여진 것을 확인한 후 수화기를
								든다. 그후 '파시앙테(Patienter)'란 글자가 뜰 때까지 기다린 후 '뉘메로테(Numeroter)'라는
								글자가 뜨면 '00-82-[0을 뺀 지역번호]-[전화번호]'를 순서대로 누르면 된다.</p>


							<p>5) 우편 사용법</p>
							<p>파리에서 엽서를 보낼 경우 우체국(LA POSTA)에 직접 가거나 타박(TABAC)에서 우표를 사서
								'PROVENCE ET ETRANGER(지방 및 외국)'라고 써 있는 우체통 투입구에 넣으면 된다. 엽서 요금은
								￠90다. 소포는 최대 30kg까지 취급하며, €27.50~276의 비용이 든다. 우체국은 월요일에서 금요일 오전
								8시에서 오후 7시까지 운영되며, 토요일은 정오까지만 문을 연다.</p>


							<p>6) 인터넷 사용법</p>
							<p>인터넷은 시내의 인터넷 카페와 민박, 호스텔의 컴퓨터를 이용하면 된다. 단, 한국에 비해 인터넷 속도가
								느리며 ,1시간에 4유로 정도로 비싼 편이다. 파리 중심지에 있는 Miki라는 인터넷 카페는 비교적 빠른 인터넷을
								이용할 수 있다. 노트북을 가져간다면 카페나 퐁피두 센터, 맥도날드, 스타벅스 등 wifi(무선 인터넷) 구역에서
								무선 인터넷을 사용할 수 있다. wifi 1일 이용권은 €10~20 정도다.</p>

							<p>7) 치안 상태</p>
							<p>프랑스는 국내 치안이 안정되어 있으며 전쟁, 내란, 테러와 같은 사건이 자주 발생하는 편은 아니다.
								그러나 테러의 위험으로부터 벗어난 안전 지대라고 할 수는 없어 경찰당국은 테러 경계경보를 ‘오렌지 단계’로 유지하고
								있다. 치안은 유럽에서 가장 안정적이라 평가되지만, 파리 북동부 및 외곽 지역, 유명 관광지, 유흥가, 지하철역
								등에서는 여행객을 노리는 소매치기가 종종 일어난다. 또한 지나치게 호의를 베풀며 접근하는 사람이나 가짜 경찰 행세를
								하며 여행객에게 접근하는 경우도 있다.</p>

							<p>8) 여행 안전수칙</p>
							<p>프랑스인들은 자국 문화에 대한 자부심이 확고하다. 특히 언어에 대한 자부심이 강하기 때문에 영어로
								의사소통할 수 없는 경우가 있다. 일반적으로 파리의 관광지, 호텔, 식당 등에서는 영어가 통용되지만, 지방이나 교외
								지역에서는 영어 사용에 어려움이 많은 편이다. 때문에 기본적인 프랑스어 표현을 외워두어 위급한 상황에서는 프랑스어를
								사용하는 것이 좋다. 프랑스 내에서 택시를 탈 경우에는 진짜 택시인지 확인해야 한다. 가짜 택시 기사에 의한 강간,
								살해 사건 등이 종종 일어나므로 택시에 탑승할 때는 운전사의 영업허가서와 영업허가판 등을 확인해야 한다. 프랑스
								내에서 전쟁, 내란의 위험은 없는 편이나 최근 이슬람 과격분자들에 의한 테러가 발생하기도 한다.</p>
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