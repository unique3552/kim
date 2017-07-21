<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book.css">
<%@ include file="/sub/temp/bootStrap.jspf"%>
<title>어라운드 무비</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#insert").click(function() {
			location.href = "./hotelInsert.jsp";
		});

		$("#nationList").click(function() {
			$.get("./ticketNation.ticket", {
				
			}, function(data) {
				$("#nation").html(data);
			})
		});
		

	});
</script>
<style type="text/css">
h3{
	margin: 0;
}
.formInfo{
	width: 1020px;
}

.wrap_1 {
	margin: 30px 0;
}

.li_1 {
	width: 33.3%;
	float: left;
}

.li_1 > div {
	padding: 15px;
	height: 170px;
	border: 1px solid #e2e2e2;
	background-color: #e6e6e6;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf"%>

	<section>
		<!-- 왼쪽 사이드바 -->
		<nav class="col-sm-3" id="myScrollspy">
			<ul class="nav nav-pills nav-stacked">
				<li><h2>
						<a href="./ticketList.ticket?location=1&curPage=1"
							style="color: white">일본</a>
					</h2></li>
				<li id="nationList"><h2 style="color: white; cursor: pointer;">해외</h2></li>
				<span id="nation"></span>
			</ul>
		</nav>
		
		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 패스/티켓
			</div>
		</div>
		
		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">패스/티켓</p>
			</div>	
		</div>

		<div class="position formInfo">
			<div class="wrap_1">
				<h4>
					<strong>기획 프로모션</strong>
				</h4>
				<a href="./ticketView.ticket?name=도쿄%20스카이트리%20입장권%20전망회랑"> <img style="width: 100%; height: 250px;" alt="일본 기획 프로모션"
					src="../resources/img/ticket/sky.png">
				</a>
			</div>
			<div class="wrap_1">
				<h4>
					<strong>패스/티켓 <span style="color: darkblue">이용안내</span></strong>
					<a href="" style="float: right; background-color: #4fabf7; color:white; padding: 5px; font-size: small; clear:right;">자세히보기</a>
				</h4>
				<div style=" width: 1000px;">
					<ul class="jpticket_intro">
						<li class="li_1">
							<div>
								<p><img src="../resources/img/icon_check.png"> 방문구매는 불가합니다!(온라인구매만 가능)</p>
								<ul class="sm_list">
									<li><span>· </span>서울 본사 1층 자판기는 구매가능/일부패스 한정<br>
										(카드결제만가능)</li>
								</ul>
								<a
									href=""
									class="btn_pass_ty2">패스자판기 안내</a>
							</div>
						</li>
						<li class="li_1">
							<div class="rcp">
								<p><img src="../resources/img/icon_check.png"> 입금 다음날부터 방문 수령해 주세요!</p>
								<ul class="sm_list">
									<li><span>· </span>수령 시 이름, 상품명, 핸드폰 뒷자리 확인</li>
									<li><span>· </span>대리 수령 가능</li>
								</ul>
							</div>
						</li>
						<li class="li_1">
							<div>
								<p><img src="../resources/img/icon_check.png"> 평일(영업일)에만 방문 수령해 주세요!</p>
								<ul class="sm_list">
									<li><span>· </span>서울 09:00~20:00 (점심시간 수령가능)</li>
									<li><span>· </span>부산 09:00~18:00</li>
								</ul>
							</div>
						</li>
						<li class="li_1">
							<div class="apt">
								<p><img src="../resources/img/icon_flight.png"> 인천공항에서도 수령할 수 있어요!</p>
								<ul class="sm_list">
									<li><span>· </span>수령시간 06:00~20:00</li>
									<li><span>· </span>수령일 이전영업일 13시까지 결제<br> (예 : 토/일/월
										수령은 금요일 13시 마감, 영업일 기준으로 연휴기간은 상이)</li>
								</ul>
							</div>
						</li>
						<li class="li_1">
							<div class="busan">
								<p><img src="../resources/img/icon_ship.png"> 부산항 신국제여객터미널에서도 수령할 수 있어요!</p>
								<ul class="sm_list">
									<li><span>· </span>수령시간은 이용하시는 선박별로 다름</li>
									<li><span>· </span>수령일 이전 영업일 13시까지 결제<br> (예 : 토/일/월
										수령은 금요일 13시 마감, 영업일 기준으로 연휴 기간은 상이)</li>
								</ul>
							</div>
						</li>
						<li class="li_1">
							<div class="last">
								<p><img src="../resources/img/icon_gift.png"> 택배 주문은 출국 7일전까지 해주세요!</p>
								<ul class="sm_list">
									<li><span>· </span>6일 이내 출국 시 방문 수령</li>
									<li><span>· </span>인천공항/부산항 신국제여객터미널 수령만 가능</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="/sub/temp/footer.jspf"%>
</body>
</html>