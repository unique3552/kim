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
.formInfo{
	width: 1020px;
}

h3{
	margin: 0;
}

table.notice {
	width: 1000px;
	margin: 20px auto;
}

th {
	color: white;
	font-size: 16px;
	font-weight: bold;
	background-color: rgb(44,65,98);
	height: 40px;
}

td {
	font-size: 0.9em;
}

td.left {
	padding-left: 10px;
	text-align: left;
}

th, td {
	text-align: center;
	vertical-align: middle;
	border: 2px solid black;
	padding: 2px;
}

.step {
	color: rgb(0,174,240);
	font-size: 0.8em;
	text-align: left;
	vertical-align: bottom;
	margin-bottom: -3%;
}

h5 {
	font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<nav class="col-sm-3" id="myScrollspy">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="./mainFlight.jsp">항공권 검색</a></li>
				<li><a href="./flightInfo.jsp">항공 안내</a></li>
			</ul>
		</nav>

		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 항공 > 항공 안내
			</div>
		</div>
		
		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">항공 안내</p>
			</div>
		</div>
		
		<div class="position formInfo">
		<div class="position">
			<div class="position titleBox">
			<h3>필수 준비물</h3>
			</div>
			<h4>여권(PASSPORT) / 비자(VISA) / 전자항공권 (e-ticket)</h4>
			<p>항공권을 구매하시면 전자항공권(e-ticket)이 자동 발급 됩니다. 대부분의 국가에서는 여행 개시일 기준으로
				여권 유효기간이 6개월 이상 남아 있어야 여행이 가능합니다. 일부 국가에서는 본인 서명이 없는 여권을 유효한 여행서류로
				인정하지 않으므로 여권 서명란에 서명하여 주시기 바랍니다.</p>
		</div>
		
		<div class="position">
			<div class="position titleBox">
			<h3>국가별 출입 규정</h3>
			</div>
			<p>국가별 비자, 여권 만료일 등의 제한사항을 확인하시어 예약/발권 등 여행 준비를 마치시기 바랍니다.</p>
			<p>일본, 마카오, 중국, 대만, 라오스, 태국, 베트남, 괌 국가별 출입규정:국가, 비자, 여권잔여 유효기간 조건,왕복항공권 안내표 </p>
			<table class="notice">
				<colgroup>
					<col width="12%">
					<col width="*">
					<col width="25%">
					<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">국가</th>
						<th scope="col">비자</th>
						<th scope="col">여권잔여 유효기간 조건</th>
						<th scope="col">왕복 항공권</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th colspan="row">일본</th>
						<td>
							<p>한국인 무비자 입국 가능</p>
						</td>
						<td>3개월 이상</td>
						<td>소지 필수</td>
					</tr>
					<tr>
						<th colspan="row">마카오</th>
						<td>
							<p>한국인 무비자 입국 가능</p>
						</td>
						<td>3개월 이상</td>
						<td>소지 필수</td>
					</tr>
					<tr>
						<th colspan="row">중국</th>
						<td>
							<p>비자필수</p>
						</td>
						<td>개인비자: 4개월 이상<br> 단체비자: 2개월 이상
						</td>
						<td>-</td>
					</tr>
					<tr>
						<th colspan="row">대만</th>
						<td>
							<p>한국인 무비자 입국 가능</p>
						</td>
						<td>6개월 이상</td>
						<td>소지 필수</td>
					</tr>
					<tr>
						<th colspan="row">라오스</th>
						<td>
							<p>한국인 무비자 입국 가능</p>
						</td>
						<td>6개월 이상</td>
						<td>-</td>
					</tr>
					<tr>
						<th colspan="row">태국</th>
						<td>
							<p>한국인 무비자 입국 가능</p>
						</td>
						<td>6개월 이상</td>
						<td>-</td>
					</tr>
					<tr>
						<th colspan="row">베트남</th>
						<td>
							<p>
								한국인 무비자 입국 가능<br> - 30일 이후 베트남 재 입국시: 무비자<br> - 30일 이내
								베트남 재 입국시: 비자 필수
							</p>
						</td>
						<td>6개월 이상</td>
						<td>-</td>
					</tr>
					<tr>
						<th colspan="row">괌</th>
						<td>
							<p>
								무비자 입국 가능<br> - 왕복항공권 소지자(45일 이하 무비자 체류 가능)
							</p>
						</td>
						<td>6개월 이상</td>
						<td>-</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="position">
			<div class="position titleBox">
			<h3>탑승 수속 절차</h3>
			</div>
			<table class="notice">
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr>
					<th><p class="step">STEP 01</p>공항 도착</th>
					<td class="left">공항 내 혼잡 상황을 고려하여 항공기 출발 2시간 전 도착하시길 권장드립니다. (인천공항: 3시간 전)</td>
				</tr>
				
				<tr>
					<th><p class="step">STEP 02</p>탑승 수속</th>
					<td class="left">
						<a class="btn btn-info" href="https://kr.koreanair.com/content/koreanair/korea/ko/traveling/airport-check-in.html#airport-check-in">KOREAN AIR</a>
						<a class="btn btn-info" href="http://flyasiana.com/CW/ko/common/pageContent.do?pageId=PC_0365">ASIANA AIR</a>
						<a class="btn btn-info" href="http://www.jinair.com/HOM/Service/AirportCounter_02.aspx">JIN AIR</a>
						<a class="btn btn-info" href="https://www.twayair.com/service/serviceInfo.do?menuSeq=231">TWAY AIR</a>
					</td>
				</tr>
				
				<tr>
					<th><p class="step">STEP 03</p>병무 신고<br>검역 신고<br>세관 신고</th>
					<td class="left">
						<h5>병무 신고</h5>
						<p>병역 의무자가 국외를 여행하고자 할 때는 병무청에 국외여행허가를 받고 출국당일 출국수속을 받기 전에 출국신고를 하셔야 합니다.</p>
						<a class="btn btn-primary" href="http://www.cyberairport.kr/pa/ko/d/2/2/6/index.jsp?tabIndex=2">병무신고안내</a>
						
						<h5>검역 신고</h5>
						<p>해외에서 들어오시는 외국·국내 여행자는 검역심사를 받으셔야 합니다.</p>
						<p>동물·축산물을 가지고 입국할 경우에는 농림축산검역검사본부에 출발국가에서 발행한 검역증명서를 제출하고 검역을 받아야 합니다.</p>
						<a class="btn btn-primary" href="http://www.cyberairport.kr/pa/ko/d/2/1/4/index.jsp?tabIndex=2">검역신고안내</a>
						
						<h5>세관 신고</h5>
						<p>미화 1만불을 초과하는 일반 해외여행 경비를 가지고 출국하실 경우 세관에 반드시 신고하셔야 하며 귀중품/고가품 등의 휴대품에 대해서도 신고하셔야 합니다.</p>
						<a class="btn btn-primary" href="http://www.cyberairport.kr/pa/ko/d/2/1/4/index.jsp?tabIndex=1">세관신고안내</a>
						
					</td>
				</tr>
				
				<tr>
					<th><p class="step">STEP 04</p>보안 검색</th>
					<td class="left">기내 반입금지 물품 및 위험물 검색이 진행됩니다.
						<p>주말과 성수기에는 탑승수속 및 보안검색 과정이 지체될 수 있습니다.</p>
						<p>(인천국제공항 보안 검색 혼잡 시간대 : 08:30~11:00, 17:00~19:00)</p>
					</td>
				</tr>
				
				<tr>
					<th><p class="step">STEP 05</p>출국 심사</th>
					<td class="left">
						<h5>출국 심사</h5>
						<p>1) 여행객은 유효한 여권을 소지하고 도착국가 또는 경유하는 국가의 유효한 입국사증 소지 여부를 확인하여야 합니다.</p>
						
						<p>2) 출국심사 후 면세지역에서는 현금출금(외환관리법에 의거 현금출금기 설치 불가)이 불가하오니 출국심사 전에 현금출금 등 여행에 필요하신 준비를 마치시기 바랍니다.<p>
						<p>무인 자동 출국 심사 : 무인 자동 출입국 심사 서비스에 사전 등록을 마친 고객은 좀 더 편리하고 신속하게 출국심사를 받을 수 있습니다.</p>
					</td>
				</tr>
				
				<tr>
					<th><p class="step">STEP 06</p>항공기 탑승</th>
					<td class="left">
						<p>출국 심사를 마친 후 탑승시간에 맞추어 해당 탑승구 앞에 대기하여 주시기 바랍니다.</p>
						<p>탑승 시작 : 항공기 출발 30분 전</p>
						<p>탑승 마감 : 항공기 출발 10분</p>
					</td>
				</tr>
			</table>
		</div>
		</div>
	</section>	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>