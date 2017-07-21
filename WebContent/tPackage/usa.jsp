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
		var center = {	lat : 39.808166, lng : -101.519493 };
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 4,
			animation : google.maps.Animation.DROP,
			center : center
		});
		
		var p23 = new google.maps.Marker({
			position : { lat : 40.758854, lng : -73.985142 },
			map : map });
		p23.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+23; });

		var p24 = new google.maps.Marker({
			position : { lat : 40.711238, lng : -74.007160 },
			map : map });
		p24.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+24; });

		var p25 = new google.maps.Marker({
			position : { lat : 40.782885, lng : -73.965384 },
			map : map });
		p25.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+25; });

		var p26 = new google.maps.Marker({
			position : { lat : 40.730851, lng : -73.997434 },
			map : map });
		p26.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+26; });
		
		var p28 = new google.maps.Marker({
			position : { lat : 35.254646, lng : -101.643905 },
			map : map });
		p28.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+28; });
		var p31 = new google.maps.Marker({
			position : { lat : 29.953710, lng : -90.076095 },
			map : map });
		p31.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+31; });
		
		var p33 = new google.maps.Marker({
			position : { lat : 22.231723, lng : -159.401951 },
			map : map });
		p33.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+33; });	
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
				<li class="active"><a href="tPackageList.tPackage?nation=usa">미국</a></li>
				<li><a href="tPackageList.tPackage?nation=france">프랑스</a></li>
				<li><a href="tPackageList.tPackage?nation=england">영국</a></li>
				<li><a href="tPackageList.tPackage?nation=greece">그리스</a></li>
				<li><a href="tPackageList.tPackage?nation=taiwan">대만</a></li>
				<li><a href="tPackageList.tPackage?nation=newzealand">뉴질랜드</a></li>
			</ul>
		</nav>
		
		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 
				<a href="packageMain.jsp">패키지여행</a> > 미국
			</div>
		</div>

		<div class="wBar">
			<div class="position noTMargin">
				<img class="flag" src="${pageContext.request.contextPath}/resources/img/flag/usa.png">
				<span class="title">미국</span>
			</div>
		</div>
		
		<div class="position formInfo">
			<table class="info">
				<tr>
					<td><span class="movie"> <video autoplay loop>
								<source	src="${pageContext.request.contextPath}/resources/movie/USA.mp4">
							</video>
					</span></td>

					<td><div class="introduce">
							<p>2. 관광 정보</p>

							<p>- 여행 최적기 -</p>
							<p>미국은 워낙 땅이 넓어서 어느 계절에 여행하든 크게 상관없는 곳이다. 지역마다 계절이 바뀌는 시기가 달라
								여행 목적지나 경로를 그에 따라 조정할 수 있다. 대체로 날씨가 좋은 봄과 가을이 여행하기에 좋을 때로, 봄은 대개
								3~5월, 가을은 9~11월이다. 지역으로 보면 로스앤젤레스, 샌프란시스코는 4~11월, 시카고, 뉴욕, 워싱턴
								등은 5~9월이 여행하기 좋다.</p>

							<p>2) 주요 도시</p>
							<p>뉴욕, 시카고, 샌프란시스코, 시애틀, 보스턴, 로스앤젤레스, 마이애미, 워싱턴 DC, 애틀랜타,
								라스베이거스</p>

							<p>3) 주요 관광지</p>
							<p>자유의 여신상, 브로드웨이, 센트럴 파크, 엠파이어 스테이트 빌딩, 백악관, 피셔맨스 워프, 스페이스
								니들, LA 다운타운, 디즈니랜드, 비버리 힐스, 할리우드볼, 그랜드 캐니언 국립공원, UCLA, 하버드 대학,
								워싱턴 스퀘어, 유니버설 스튜디오 할리우드 등</p>

							<p>4) 대표 음식</p>
							<p>미국은 다민족 국가인 만큼 세계 각국의 다양한 요리를 맛볼 수 있다. 그 중 햄버거와 스테이크, 핫도그가
								대표적이며 바다가 가까운 동해안이나 서해안, 남부의 각 도시에서는 신선한 해산물 요리도 즐길 수 있다. 다양한
								요리들을 손쉽게 빨리 먹을 수 있어 여행자들에게 인기 있는 패스트푸드가 탄생한 곳이 바로 미국이다. 세계적으로
								유명한 맥도날드, 버거킹을 비롯해 각 지역에 특색 있는 패스트푸드점이 많다.</p>

							<p>- 기타 여행팁 -</p>

							<p>1) 통화 정보</p>
							<p>미국의 기본 화폐 단위는 달러(Dollar, $)와 센트(Cent, ¢)다. 센트는 달러보다 작은
								단위로, 1달러가 100센트다. 주로 쓰이는 지폐는 $1, 5, 10, 20, 50, 100 등 8종류다. 그
								외에도 몇 가지 지폐가 있긴 하지만 $2는 행운이 따른다는 속설 때문에 수집용으로 쓰이며 $500, $1000는
								액수가 너무 커서 잘 쓰이지 않는다. 미국인들은 달러를 ‘벅(Buck)’ 또는 ‘벅스(Bucks)’라는 속어로
								부르기도 한다. 동전은 $1와 1, 5, 10, 25, 50¢가 있다. 각각의 동전은 애칭을 갖고 있는데, 1¢는
								‘페니’, 5¢는 ‘니켈’, 10¢는 ‘다임’, 25¢는 ‘쿼터’라 불린다.</p>

							<p>2) 환전 정보</p>
							<p>원화는 미국의 은행이나 환전소에서 달러로 환전하기가 쉽지 않다. 그러므로 짧은 일정의 여행자는 국내에서
								달러로 환전해가는 것이 좋다. 인터넷에서 환전하는 경우 환율 우대, 수수료 감면 등 다양한 혜택을 받을 수 있다.
								장기간 여행자라면 환율이 유리하고 수수료가 저렴한 여행자 수표를 이용하는 것도 좋은 방법이다. 분실하거나 도난을
								당해도 재발행이 가능하다.</p>

							<p>3) 사용 전압</p>
							<p>미국 전기 전압은 주마다 약간씩 차이가 있지만 110~220V이고 주파수는 60Hz이다. 우리나라 전자
								제품을 사용하려면 어댑터를 가져가는 것이 좋다.</p>

							<p>4) 전화 사용법</p>
							<p>호텔 객실이나 공중전화에서 전화를 이용할 수 있다. 호텔 객실 전화로 국제 통화를 하면 요금이 무척
								비싸므로 가급적 공중전화를 이용하는 것이 좋다. 공중전화는 대부분 카드식이며 미국에서 사용되는 전화카드는 직접
								전화기에 넣어서 사용하는 것이 아니라 카드에 기재된 카드 고유번호를 눌러 통화하는 방식이다. 먼저 카드에 표기된
								접속번호를 누르고 안내에 따라 전화카드 번호, 상대방 전화번호를 누른다. 한국으로 전화하려면 82(국가번호)+0을
								제외한 지역번호+전화번호 순으로 누르면 된다. 수신자부담 전화를 이용할 수도 있다. 한국통신은
								1-800-288-7358, 데이콤은 1-800-845-6732를 누른 후 안내멘트에 따르면 된다.</p>

							<p>5) 우편 사용법</p>
							<p>엽서는 94¢, 편지는 무게에 따라 다르지만 기본 10kg까지 $23 정도이다. 한국으로 보낼 시 수신인
								주소와 이름은 한국어로 적고 마지막에 'South Korea Air Mail'을 기재하면 된다. 우표는 우체국이나
								호텔 로비, 슈퍼마켓 등에서 구입할 수 있다.</p>

							<p>6) 인터넷 사용법</p>
							<p>많은 호텔이 무선 인터넷 서비스를 제공한다. 인터넷 접속료는 보통 하루에 $10~15 정도이며, 경우에
								따라 무료인 곳도 있다. 노트북이 없는 경우 인터넷 카페를 이용하면 된다. 요금은 장소에 따라 다르지만, 시간당
								$6~10 정도이다.</p>

							<p>7) 치안 상태</p>
							<p>미국은 총기 소지가 가능한 나라이기 때문에 범죄가 빈번하게 일어나는 곳으로 인식되고 있다. 그러나
								일반적인 예상과 달리 몇 대도시 지역을 빼고는 치안이 안정된 편이다. 다만 소매치기와 같은 단순 범죄가 발생할 수
								있으니 혼자 위험지역을 방문하거나 밤에 돌아다니지 않는 편이 좋다.</p>

							<p>8) 여행 안전수칙</p>
							<p>미국 대도시의 슬럼가 지역은 범죄 발생률이 높기 때문에 대낮에도 혼자서는 방문은 자제하는 것이 좋다.
								혼자 다닐 때는 가급적 사람이 많은 곳으로 다니고, 큰 돈이나 값비싼 물건은 숙소에 두고 다니도록 한다. 되도록
								밤길은 피하고 밤에 외출할 때는 가까운 거리라도 택시를 이용하는 것이 더 안전하다. 여행 중 강도를 만났을 땐
								대항하기보다 강도에게 순순히 돈을 주는 게 안전할 수 있다. 워싱턴 DC의 경우 미국의 대도시 중 강력사건이
								상대적으로 많은 편이며, 특히 국회의사당을 중심으로 북서쪽 지역을 제외한 지역은 여행을 자제하는 것이 바람직하다.</p>
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