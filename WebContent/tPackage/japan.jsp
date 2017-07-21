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
		var center = {	lat : 37.760596, lng : 136.609376 };
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 4,
			animation : google.maps.Animation.DROP,
			center : center
		});
		
		var p1 = new google.maps.Marker({
			position : { lat : 34.669109, lng : 135.497207 },
			map : map });
		p1.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+1; });
		
		var p3 = new google.maps.Marker({
			position : { lat : 33.850000, lng : 132.783333 },
			map : map });
		p3.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+3; });
		
		var p5 = new google.maps.Marker({
			position : { lat : 35.665281, lng : 139.726372 },
			map : map });
		p5.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+5; });

		var p8 = new google.maps.Marker({
			position : { lat : 35.673219, lng : 139.740623 },
			map : map });
		p8.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+8; });

		var p13 = new google.maps.Marker({
			position : { lat : 35.687487, lng : 139.712819 },
			map : map });
		p13.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+13; });
		
		var p16 = new google.maps.Marker({
			position : { lat : 36.236600, lng : 137.189872 },
			map : map });
		p16.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+16; });
		
		var p52 = new google.maps.Marker({
			position : { lat : 35.714951, lng : 139.517518 },
			map : map });
		p52.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+52; });
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
				<li class="active"><a href="tPackageList.tPackage?nation=japan">일본</a></li>
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
				<a href="../index.jsp">HOME</a> > 
				<a href="packageMain.jsp">패키지여행</a> > 일본
			</div>
		</div>
		
		<div class="wBar">
			<div class="position noTMargin">
				<img class="flag" src="${pageContext.request.contextPath}/resources/img/flag/japan.png">
				<span class="title">일본</span>
			</div>
		</div>
		
		<div class="position formInfo">
			<table class="info">
				<tr>
					<td><span class="movie"> <video autoplay loop>
								<source	src="${pageContext.request.contextPath}/resources/movie/JAPAN.mp4">
							</video>
					</span></td>

					<td><div class="introduce">
							<p>- 여행 최적기 -</p>
							<p>일본에 여행객이 가장 많이 몰리는 시기는 여름휴가가 있는 7~8월경이다. 한국은 여행 비수기지만 일본은
								여행 성수기인 경우가 있다. '골든 위크'라 부르는 4월 29일~5월 5일과, 우리의 추석과 비슷한 오본이 있는
								8월 15일 전후로 일주일이 그렇다. 물론 연말연시는 최대 성수기다.</p>

							<p>2) 주요 도시</p>
							<p>도쿄, 오사카, 나고야, 삿포로, 고베, 교토, 후쿠오카, 요코하마, 히로시마, 센다이 등</p>

							<p>3) 주요 관광지</p>
							<p>도쿄</p>
							<p>신주쿠, 시부야, 아사쿠사, 하라주쿠, 우에노, 오다이바</p>

							<p>오사카</p>
							<p>신사이바시, 도톤보리, 난바, 오사카성, 신세카이</p>

							<p>홋카이도</p>
							<p>삿포로, 오타루, 후라노, 구시로 습지, 하코다테</p>

							<p>후쿠오카</p>
							<p>하카타, 지쿠고강 온천, 기타큐슈, 다자이후</p>

							<p>4) 대표 음식</p>
							<p>일본의 대표 음식인 초밥, 우동, 덮밥, 라멘은 우리 입맛에도 잘 맞는 대중적인 음식이다.</p>

							<p>스시(壽司)</p>
							<p>우리에게는 초밥으로 알려진 일본의 대표 음식이다. 식초 넣은 밥을 주재료로 생선과 채소, 조개, 소금,
								맛술 등을 넣어 만들며, 손으로 간장에 찍어 먹는다. 보통 ‘가리’라고 불리는 초생강이 같이 나오는데, 스시를 먹기
								전 초생강을 한 조각 먹으면 입 안이 개운해져 각 생선의 독특한 맛을 즐길 수 있다. 종류는 사각형으로 빚은 밥에
								겨자와 생선을 올린 '니기리', 김밥같이 말아 먹는 '마키', 유부초밥 같은 '이나리' 등이 있다.</p>

							<p>사시미(刺身)</p>
							<p>생선과 조개를 날것으로 적당한 크기로 저민 요리로, 일본의 대표적인 일품요리다. 우리나라의 회와 같지만,
								초장 대신 와사비와 간장에 찍어 먹는다. 재료의 성질에 따라 다양한 방법으로 요리한다.</p>

							<p>스이모노(吸い物)</p>
							<p>우리나라의 국과 같은 요리로 맑은 장국과 된장국으로 나눌 수 있다. 국을 숟가락으로 떠먹는 우리와 달리
								젓가락으로 가볍게 저어 그릇에 입을 대고 조금씩 마신다.</p>

							<p>야키모노(燒き物)</p>
							<p>석쇠나 철판에 구워 먹는 구이 요리다. 쇠고기나 돼지고기, 또는 생선에 데리소스를 발라 구워 먹는
								데리야키와, 우리나라 빈대떡 같은 오코노미야키가 있다. 그 밖에 양념을 하지 않고 불에 직접 구워 양념간장에 찍어
								먹는 시라야키, 소금을 뿌려 굽는 시오야키 등 다양한 요리가 있다.</p>

							<p>쓰케모노(漬物)</p>
							<p>채소류를 소금∙된장∙식초∙쌀겨∙간장에 절인 음식이다. 일본식 김치라 할 수 있는데 재료와 절임 방식에
								따라 다양한 종류가 있다. 우리에게 단무지로 알려진 다쿠앙이나 매실장아찌인 우메보시 등이 이에 속한다. 특히
								우메보시는 일본을 상징하는 음식으로 반찬이나 다양한 요리의 맛을 내는 데 쓰인다.</p>

							<p>니모노(煮物)</p>
							<p>다시마나 가쓰오부시 국물에 육류나 어패류를 채소와 함께 넣고 조린 요리다. 즉, 일본식 조림 요리인
								니모노는 반찬은 물론 술안주로 일본 식탁에 빠지지 않는다.</p>

							<p>스노모노(酢の物)</p>
							<p>해산물과 채소를 소금에 절였다가 설탕∙식초∙간장 등을 넣고 새콤하게 무치는 초무침 요리다. 식사할 때 입
								안을 상쾌하게 해주는 샐러드와 비슷한 역할을 한다.</p>

							<p>나베모노(なべもの)</p>
							<p>냄비에 육수를 붓고 여러 가지 재료를 넣어 끓인 냄비 요리다. 한 냄비에 다양한 재료를 넣어 여러 사람이
								같이 먹는다. 겨울철에 주로 먹는 일본의 대표 음식이다.</p>

							<p>샤부샤부(しゃぶしゃぶ)</p>
							<p>얇게 썬 쇠고기를 끓는 국물 속에 넣어 가볍게 익혀 먹는다. 고기 외에 다양한 채소와 곤약 등을 같이
								살짝 데쳐서 먹는다.</p>

							<p>스키야키(すき燒き)</p>
							<p>전골 요리에 해당된다. 간장∙청주∙설탕을 넣어 끓인 육수에 얇게 저민 연한 고기와 두부∙곤약∙버섯∙파
								등을 넣어 끓여 먹는다.</p>

							<p>낫토(納豆)</p>
							<p>일본의 대표적인 전통 음식 중 하나다. 삶은 콩을 발효시켜 만든 식품으로 냄새가 청국장과 비슷하며,
								끈적끈적하게 늘어난다. 최근에 영양식품으로 각광받고 있다.</p>

							<p>덴푸라(てんぷら)</p>
							<p>해산물이나 채소 등의 재료에 달걀을 섞은 밀가루 반죽을 묻혀 튀겨낸 튀김 요리다. 맛술을 넣은 간장이나
								소금에 찍어 먹는다.</p>

							<p>오니기리(お握り)</p>
							<p>밥에 소금으로 간을 하거나 깨, 다진 쇠고기 등 다양한 재료를 섞어 넣고 삼각형으로 뭉쳐 김으로 감싼
								음식이다. 우리나라의 편의점에서 볼 수 있는 삼각김밥 같은 형태지만, 밥에 들어간 재료가 더욱 다양하다. 일본의
								슈퍼마켓이나 편의점에서 다양한 제품이 판매되어 여행 중 간단하게 요기하기에 적당하다.</p>

							<p>바(そば)</p>
							<p>메밀가루에 달걀과 고구마녹말가루를 첨가해 만든 갈색 국수다. 국물을 뜨겁게 해서 먹거나 차가운 간장국물에
								조금씩 담가 먹는다. 잘게 썬 파와 다른 양념을 넣어 맛을 낸다.</p>

							<p>모리소바(もりそば)</p>
							<p>차가운 간장소스에 국수를 찍어 먹는다.</p>

							<p>덴푸라소바(てんぷらそば)</p>
							<p>육수에 만 국수 위에 새우튀김이 같이 나온다.</p>

							<p>다누키소바 (たぬきそば)</p>
							<p>고기 육수에 튀김가루를 올려 먹는다.</p>

							<p>우동(うどん)</p>
							<p>우리에게 익숙한 일본 국수다. 일반 국수보다 면발이 굵은 것이 특징이다. 먹는 방법은 소바와 비슷한데,
								차가운 간장국물에 담갔다 먹거나 잘게 썬 파와 고춧가루를 넣은 뜨거운 국물에 말아 먹는다.</p>

							<p>라멘(ラ－メン)</p>
							<p>일본식 라면이다. 간장소스나 된장으로 양념한 고기 육수에 밀가루 국수를 말아 먹는다. 얇게 저민
								돼지고기나 숙주나물 등을 곁들인다. 우리나라의 인스턴트 라면과는 맛이 다르며, 기름에 튀기지 않은 생면을 사용한다.
								지역마다 그 지역을 대표하는 다양한 라멘이 있다.</p>

							<p>돈부리(どんぶり)</p>
							<p>밥 위에 반찬이 되는 요리를 올려놓은 덮밥을 뜻한다. 올려놓은 요리에 따라 다양한 돈부리가 된다.
								우리나라의 덮밥과는 달리 비벼 먹지 않는다.</p>

							<p>텐돈(てんどん)</p>
							<p>밥 위에 새우, 채소 등의 튀김을 얹은 튀김덮밥이다. 맛술로 맛을 낸 독특한 양념간장을 둘러 먹는다.</p>

							<p>규돈(ぎゅうどん牛)</p>
							<p>쇠고기 볶음을 밥 위에 얹은 요리다.</p>

							<p>가쯔돈(カツどん)</p>
							<p>돈가스 덮밥으로, 튀긴 돈가스와 달걀프라이를 밥 위에 얹어 먹는다.</p>

							<p>오야코돈(親子井 おやこどん)</p>
							<p>밥 위에 닭고기와 달걀프라이를 얹은 요리다.</p>

							<p>우나돈(うな井 うなどん)</p>
							<p>장어구이가 밥 위에 올라간 비싼 덮밥이다.</p>

							<p>- 기타 여행팁 -</p>

							<p>1) 통화 정보</p>
							<p>일본 화폐 단위는 엔(円)이다. 2004년 11월 신권이 발행되었으나, 지금까지 구권을 함께 사용하고
								있다. 지폐: 1만円, 5,000円, 2,000円, 1,000円 동전: 500円, 100円, 50円, 10円,
								5円, 1円 (2009년 5월 기준, 100円=1,325원)</p>

							<p>2) 환전 정보</p>
							<p>여행 일정이 짧고 경비가 많지 않다면 국내에서 환전해 엔화로 가져가는 것이 좋다. 인터넷에서 환전하는
								경우 환율 우대, 수수료 감면, 여행자보험 무료 등 다양한 혜택을 받을 수 있다. 일본 현지에서 환전할 경우 공항
								환전소나 시내 은행을 이용한다. 그러나 공항 환전소는 환율이 좋지 않고, 시내 은행마다 환전 수수료가 조금씩
								다르다는 것을 염두에 둬야 한다. 간혹 환전 업무를 하지 않는 은행이 있으므로 주의한다.</p>

							<p>여행 경비가 10만円 이상으로 많은 편이라면 환율이 유리하고 수수료가 저렴한 여행자수표를 준비하는 것도 괜찮다.
							분실하거나 도난당해도 재발행할 수 있다. 규모가 큰 레스토랑에서는 현금처럼 사용할 수 있지만 대부분 현지에서 현금으로
							바꿔야 하는 불편함이 있다.
							</p>

							<p>분실 위험이 있는 현금보다 신용카드나 직불카드를 선호하는 여행자라면, 일단 외국에서 사용 가능한 카드인지 출국 전
							확인한다. 비자와 아멕스, 마스터, JCB 등 국제적인 네트워크가 있는 신용카드라면 현지의 현금인출기에서 엔화를 찾아
							쓸 수 있다. 하지만 수수료가 꽤 높은 편이다. 일본은 규모가 큰 쇼핑센터나 레스토랑에서 대부분 신용카드나 직불카드로
							결제가 가능하다. 단, 작은 음식점이나 숍, 교통수단을 이용할 때는 현금이 필요한 경우가 많다.
							</p>

							<p>3) 사용 전압</p>
							<p>110V. 한국의 전자 제품은 주로 220V이므로 전압 변압기를 연결해 사용하는 것이 안전하다. 그러나
								프리볼트 제품은 별도의 변압기가 없어도 된다. 단, 우리나라와 콘센트 모양이 다르므로 일명 '돼지코'라 부르는 변환
								플러그가 있어야 한다. 규모가 큰 호텔에서는 변환 플러그를 빌려주기도 하지만 미리 준비해 가는 것이 좋다.</p>

							<p>4) 전화 사용법</p>
							<p>일본 공중전화기는 국내용 전화기와 국제용 전화기의 모양과 색이 다르다. 국내용 전화기는 보통 녹색이고,
								국제용 전화기는 회색이다. 시내전화는 45초당 10円이다. 사용할 수 있는 동전은 10円과 100円 주화며, 동전과
								함께 전화카드(데레혼카)도 사용한다.</p>

							<p>한국으로 전화할 때는 국제전화 전용 전화기를 사용해야 하는데, 전화기나 전화박스에
								‘International Telephone’이라는 표시가 붙어 있다. 동전을 사용하는 회색 공중전화는 많지 않아
								불편하다. 그 외에는 국제전화 전용 카드가 있어야만 편리하게 국제전화를 걸 수 있다. 수신자 부담 전화를 이용하는
								방법도 있다.</p>

							<p>-일본에서 국제전화 거는 법</p>
							<p>001(국제자동전화 식별번호)+82(국가번호)+0을 뺀 지역번호+상대방 전화번호</p>

							<p>5) 우편 사용법</p>
							<p>일본에서 한국으로 우편을 보낼 때는 우체국까지 가지 않고 가까운 편의점 등에서 우표를 사서 붙인 후 우체통에 넣으면
							된다. 거리 곳곳에 빨간 우체통이 놓여 있다. 요금은 엽서 우표가 70円, 편지 우표가 90円이다. 하지만 소포는
							우체국에 가서 직접 접수해야 한다. 운송료는 배편이 항공편보다 싸지만, 운송기간이 몇 배 정도 더 걸린다. 한국으로
							보내는 우편일 경우 주소는 한글 또는 영문으로 쓴다. 한국에서 일본으로 우편을 보낼 경우 일본어로 주소 쓰는 방법은
							우리나라와 순서가 같다. 국가, 현, 시, 거리, 번지 순으로 쓰면 된다. 영어로 쓸 경우 그 반대로 쓰면 된다.
							</p>

							<p>6) 인터넷 사용법</p>
							<p>시내 곳곳에 인터넷 카페가 있어서 어렵지 않게 인터넷을 이용할 수 있다. 일본의 인터넷 카페는 게임,
								만화, 영화 등 다양한 시설을 즐길 수 있도록 갖춰 있다. 보통 1인실, 다인실 등 칸막이로 나눠 있다. 요금은
								1인실을 기준으로 1시간에 390円 정도다. 1시간 이후부터는 10분당 90円씩 추가된다. 인터넷 카페에 따라
								시간별로 패키지 요금을 마련해놓은 곳도 있다.</p>

							<p>7) 치안 상태</p>
							<p>일본의 치안 상태는 비교적 양호한 편이다. 여행하기에 안전한 곳이지만, 주요 시내 중심가와 유흥가에는
								폭력배와 소매치기가 있으므로 주의한다. 그러나 여행자 관련 사고는 극히 적은 편이다. 사회적으로 이슈가 되는 큰
								사건이 간혹 일어나지만 대부분 야쿠자 문제나 조직 관련 테러 문제며, 일반인과 연관된 일은 아니다.</p>

							<p>8) 여행 안전수칙</p>
							<p>지진 위험이 높은 나라이므로 지진에 대한 대비를 항상 한다. 지진이 일어나면 강도가 높지 않더라도 위에서
								떨어지는 물건을 피해 책상 밑 같은 곳에 숨는 것이 좋다. 비교적 강도 높은 지진이 날 경우를 대비해 출구를 미리
								확인해두는 것이 좋다. 급하게 대피할 경우 무너지기 쉬운 담이나 벽 주변은 피한다. 공원이나 광장에 시민이 대피할
								수 있는 곳이 마련돼 있다. 큰 진동이 멈췄다 하더라도 여진이 남아 있을 수 있으니 한동안 주의를 기울인다.</p>
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
				<div id="${p.num}"  class="tPackageView">
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