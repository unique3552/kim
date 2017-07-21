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
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/package.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book.css">
<%@ include file="/sub/temp/bootStrap.jspf" %>
<title>어라운드 무비</title>
<script>
	function initMap() {
		var center = {	lat : 34.347040, lng : 103.702446 };
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 4,
			animation : google.maps.Animation.DROP,
			center : center
		});
		
		var p6 = new google.maps.Marker({
			position : { lat : 26.871233, lng : 100.231327 },
			map : map });
		p6.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+6; });

		var p7 = new google.maps.Marker({
			position : { lat : 39.916332, lng : 116.397142 },
			map : map });
		p7.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+7; });

		var p45 = new google.maps.Marker({
			position : { lat : 29.313906, lng : 110.432680 },
			map : map });
		p45.addListener('click', function() { location.href="${pageContext.request.contextPath}/tInfo/tInfoView.tInfo?num="+45; });
		
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
				<li class="active"><a href="tPackageList.tPackage?nation=china">중국</a></li>
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
				<a href="packageMain.jsp">패키지여행</a> > 중국
			</div>
		</div>
		
		<div class="wBar">
			<div class="position noTMargin">
				<img class="flag" src="${pageContext.request.contextPath}/resources/img/flag/china.png"><span class="title">중국</span>
			</div>
		</div>

		<div class="position formInfo">
			<table class="info">
				<tr>
					<td><span class="movie">
						<video autoplay loop>
							<source	src="${pageContext.request.contextPath}/resources/movie/CHINA.mp4">
						</video>
					</span></td>

					<td><div class="introduce">
							<p>- 관광 정보 -</p>
							<p>1) 여행 최적기</p>
							
							<p>남한 땅의 100배가 넘는 광활한 국토를 자랑하는 중국의 여행 성수기는 지역마다 천차만별이다. 베이징을
								포함한 북부 지역의 경우 여름에는 폭염이, 겨울에는 한파가, 봄에는 황사가 불기 때문에 가을이 최적이다. 그러나
								중국의 골든위크인 국경절 연휴에는 모든 관광지가 인산인해를 이루므로 이 시기는 피하는 것이 좋다. 황사의 영향이
								적은 남부 지역은 봄과 가을 모두 여행하기 적당하다. 이 지역의 여름은 북부와는 비교할 수 없는 찜통더위가 연일
								이어지며 겨울 평균기온은 낮지 않지만 습기가 많아 뼈가 시린 듯한 추위가 느껴진다. 반면 홍콩은 여름에 무덥고 비가
								많이 내려 습도가 90 [네이버 지식백과] 중국 여행 (저스트고(Just go) 국가별 여행정보, 시공사) %를
								넘을 때도 있고, 겨울은 기온과 습도가 모두 낮다.</p>

							<p>2) 주요 도시</p>
							<p>베이징, 상하이, 톈진, 충칭, 하얼빈, 창춘, 선양, 스쟈좡, 타이위안, 지난, 정저우, 난징,
								허페이, 우한, 창사, 난창, 항저우, 푸저우, 광저우, 쿤밍, 구이양, 청두, 란저우, 시안, 시닝, 하이커우,
								난닝, 인촨, 후허하오터, 우루무치, 라싸, 홍콩, 마카오</p>

							<p>3) 주요 관광지</p>
							<p>베이징</p>
							<p>만리장성, 자금성, 이화원, 천안문광장, 왕푸징</p>

							<p>상하이</p>
							<p>와이탄, 동방명주, 예원</p>

							<p>쿤밍</p>
							<p>석림, 주샹동굴, 윈난민족촌</p>

							<p>청두</p>
							<p>우허우츠, 두보초당, 판다 생태공원</p>

							<p>난징</p>
							<p>명효릉, 중산릉, 영곡사</p>

							<p>쑤저우</p>
							<p>유원, 졸정원, 사자림</p>

							<p>시안</p>
							<p>진시황릉, 병마용박물관, 화칭츠, 파먼사</p>

							<p>홍콩</p>
							<p>침사추이, 빅토리아 피크, 란콰이퐁, 리펄스 베이</p>

							<p>마카오</p>
							<p>세나도 광장, 기아 요새</p>

							<p>4) 대표 음식</p>
							<p>중국의 음식은 다채롭기로 유명하다. 지역별 특색이 강한데 대체로 북쪽은 짜고, 남쪽은 달며, 동쪽은
								시고, 서쪽은 맵게 먹는다. 중국을 대표하는 4대 요리로는 베이징, 상하이, 쓰촨, 광둥 요리를 꼽는다. 궁중
								요리인 베이징 카오야(오리구이)와 몽고족의 요리인 솬양러우(중국식 샤브샤브)가 대표적인 베이징 요리다. 상하이
								요리는 쟝쑤성과 저쟝성에서 발달한 것으로 소동파가 즐겼다는 둥포러우와 고기 국물이 가득 찬 샤오룽바오(고기만두)가
								유명하다. 매운맛이 특징인 쓰촨 요리로는 훠궈(매운 샤브샤브)와 마포더우푸(마파두부)가 잘 알려져 있다. 모든
								동식물을 식재료로 쓴다는 광둥 요리는 뎬신(딤섬)이 우리에게 가장 친숙하다.</p>

							<p>- 기타 여행팁 -</p>

							<p>1) 통화 정보</p>
							<p>중국의 화폐 단위는 위안(YUAN, 元)이고, 구어에서는 '콰이(块)'라고 부른다. 보조 화폐는
								쟈오(JIAO, 角, 구어에서는 '마오'라고 부른다)와 펀(FEN, 分)이 있다. 1元은 10角이자 100分이다.
								RMB는 중국 인민은행이 발행한 화폐인 인민폐의 기호로써 중국 내에서 사용하는 단위이다. 달러가 아닌 위안화를
								준비한다.</p>

							<p>2) 환전 정보</p>
							<p>중국 현지에서는 우리나라 지폐와 중국 위안화의 환전이 쉽지 않으므로 출국 전에 미리 환전을 해 두는 것이
								좋다. 원화를 바로 위안화로 바꾸면 현지에 도착하자마자 사용할 수 있어 편리하다. 그러나 원화를 달러로 환전한 후
								중국의 은행에서 다시 위안화로 바꾸는 편이 전자보다 저렴하여 베테랑 여행자들은 달러로 환전하는 방법을 선호한다.
								현금을 들고 가는 것이 불안하다면 여행비의 일부를 여행자수표로 바꿔 가는 것도 좋은 방법이다. 환전은 은행 외에도
								공항에 있는 중국 은행 지점이나 호텔 카운터, 외국인이 많이 찾는 쇼핑센터 등에서 가능하며 신분증을 지참해야 한다.
								최근 중국 각지에서 위조지폐가 성행하고 있으니 아무리 유리한 비율로 환전해 준다고 해도 암거래는 시도하지 말자.</p>

							<p>3) 사용 전압</p>
							<p>220V, 50㎐로 우리나라의 전자 제품을 그대로 사용할 수 있다. 그러나 일부 지역은 플러그 모양이
								달라서 우리나라의 전자 제품과 맞지 않는 경우도 있다. 따라서 건전지를 이용하는 제품을 가지고 가거나 호텔
								카운터에서 어댑터를 빌려 사용해야 한다.</p>

							<p>4) 전화 사용법</p>
							<p>외국인이 많이 묵는 대도시의 고급 호텔은 객실에서도 국제전화를 걸 수 있다. 고급 호텔에 투숙하는 경우
								안내되어 있는 내선번호를 누르면 바로 전화를 걸 수 있다. 그러나 중소도시의 일반 호텔에서는 객실 전화로는
								국제전화를 걸 수 없고 공중전화를 이용해야 한다. 공중전화는 주화나 카드를 넣고 사용하며, 지폐밖에 없는 경우에는
								시내의 후불식 공용전화를 사용하면 된다. 중국 내로 전화를 걸려면 지역 번호부터 열한 자리를 누른다. 한국으로
								전화한다면 00 82를 붙이고 0을 뺀 지역 번호와 전화번호를 누른다. 예를 들어 서울의 123-4567로 전화를
								건다면 00 82 2 123 4567을 입력하면 연결된다.</p>

							<p>국제전화카드를 이용한다면 카드에 써 있는 번호를 입력한 후 위와 같은 방식으로 전화번호를 누른다.
								시내전화는 상당히 저렴하지만 다른 지방으로 거는 장거리 전화는 상대적으로 비싸다. 중국에서는 카드로 충전하는
								휴대폰을 사용하므로 장기 여행자라면 저렴한 단말기를 구입해 휴대하는 것도 좋은 방법이다.</p>

							<p>5) 우편 사용법</p>
							<p>편지나 소포를 보내고 싶다면 시내 곳곳에서 볼 수 있는 초록색 우체국 간판을 찾아 들어가자. 중국의
								우체국은 연중무휴로 아침 9시에서 오후 5시까지 우편물을 접수받는다. 보내는 지역에 따라 엽서는 3~5元, 편지는
								5元 이상(무게에 따라 측정) 지불해야 한다. 받는 사람의 주소는 한국어로 기재하고 맨 앞에 KOREA나 韩国이라고
								적으면 한국의 해당 주소로 배달된다. 한국과 가까운 지역이라면 일주일 안에 도착하기도 하지만 보통은 일주일 이상
								소요된다. 소포는 일반 소포와 EMS의 두 종류가 있다. 일반 소포는 저렴하지만 배로 운송하기 때문에 10일 이상
								소요된다. EMS로 보내면 가까운 지역은 최고 2~3일 내에도 받아볼 수 있지만 상당히 비싸다. 일반 소포는 보통
								100元 이하이고, EMS는 아무리 가벼운 물건이라도 100元 이상이다.</p>

							<p>6) 인터넷 사용법</p>
							<p>중국에도 한국과 같이 PC방이 있는데, 왕바(网吧)라고 부른다. 기차역이나 버스 터미널 근처, 시내
								곳곳에 있다. 이용 방법은 각 점포에 따라 조금씩 다르지만 보통은 카드로 등록하고 사용한다. 프런트에서 카드를 받고
								원하는 자리에 앉은 후 컴퓨터 전원을 켠다. 윈도우에 등록 번호와 비밀 번호를 입력하는 창이 뜨면 카드에 쓰여 있는
								번호를 입력하고 사용한다. 컴퓨터 사용 후 카드를 카운터에 내면 이용 시간에 따라 요금을 계산해 준다. 대도시의
								인터넷 속도는 한국보다 느린 편이지만 사용할 만한 수준이며, 중소도시는 속도가 많이 느리다. 일부 소도시에서는
								PC방을 찾을 수 없기도 하다. 이용 요금은 역시 지역에 따라 편차가 크지만 보통 시간당 1~5元 정도다.</p>

							<p>7) 치안 상태</p>
							<p>여행객들은 중범죄보다 절도나 소매치기 등 경범죄를 많이 당한다. 중국의 우범 지역은 기차역과 버스
								정류장, 버스, 지하철 등이다. 한편 시골에서는 귀중품 때문에 큰 사건에 휘말리는 경우도 있다.</p>

							<p>8) 여행 안전수칙</p>
							<p>안전한 여행을 위해 몇 가지 유의할 점이 있다. 중국에는 기름지고 자극적인 음식이 많으며 일부 중소
								도시는 위생 상태가 좋지 않으므로 여행 초반에 설사를 할 수 있다. 또한 윈난과 티베트 등 고산지대에서는 아무리
								건강한 사람이라도 고산병에 걸릴 수 있으니 상비약을 반드시 챙겨야 한다. 또한 가짜의 천국으로 악명 높은 중국에는
								위조지폐가 기승을 부리니 절대 암거래상에서는 환전하지 말자. 돈을 받으면 반드시 그 자리에서 확인해 보아야 하며,
								어두운 곳에서 돈을 지불해야 할 때는 미리 잔돈을 준비해 두는 것도 좋은 방법이다.</p>

							<p>대도시에는 값비싼 물건을 노리는 소매치기가 있고, 중소도시에는 한국인의 여권을 노리는 브로커가 있으니
								귀중품은 잘 간수해야 한다. 티베트나 신장과 인접한 지역을 여행할 경우에는 최근 불거진 테러 위협을 조심해야 한다.
								중국인들은 타인의 일에는 무심한 편이다. 공안(중국 경찰)도 예외는 아니므로 위험한 행동은 스스로 절제하는 수밖에
								없다.</p>
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