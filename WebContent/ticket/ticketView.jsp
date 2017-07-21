<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/section.css">
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/footer.css">
	<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book.css">
<%@ include file="/sub/temp/bootStrap.jspf"%>
<title>어라운드 무비</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#nationList").click(function() {
			$.get("./ticketNation.ticket", {
				
			}, function(data) {
				$("#nation").html(data);
			})
		});
		
		$("#choice").change(function() {
			var num = $(this).val();
			var price = ${requestScope.ticket.price};
			$.post("./ticketChoice.ticket", {
				num : $(this).val(),
			}, function(data) {
				$("#infoSection").html(data);
			});
		});
		
		$("#agecal").click(function() {
			window.open("http://www.tourbaksa.com/newpass/inc/pop_calculate.asp", "만 나이 계산기", "top=100, left=100, width=530, height=180");
		});
		
		$("#buyBtn").click(function() {
			document.frm.submit();
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

section {
	min-height: 1800px;
}

.wrap_1 {
	margin: 30px 0;
}

.li_1 {
	width: 30%;
	float: left;
}

.li_1>div {
	padding: 15px;
	height: 170px;
	border: 1px solid #e2e2e2;
	background-color: #e6e6e6;
}

.wrap_1>div {
	float: left;
	margin: 20px;
}

.choiceBox {
	border-top: 1px solid #454545;
	border-bottom: 1px solid #454545;
}

.btn{
	background-color: rgb(255,192,0);
		color: white;
		width: 150px;
}

#choice{
	max-width: 300px;
}


</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf"%>

	<!-- 왼쪽 사이드바 -->
	<nav class="col-sm-3" id="myScrollspy">
		<ul class="nav nav-pills nav-stacked">
			<li><h2 style="color: white"><a href="./ticketList.ticket?location=1&curPage=1" style="color: white">일본</a></h2></li>
			<li id="nationList"><h2 style="color: white; cursor: pointer;">해외</h2></li>
			<span id="nation"></span>
		</ul>
	</nav>

	<section>
		<div class="bBar">
			<div class="position noBMargin">
			<a href="../index.jsp">HOME</a> > <a href="./ticketMain.jsp">패스/티켓</a> > <a href="./ticketList.ticket?location=${requestScope.location.num}">${requestScope.location.nation}</a> > ${requestScope.ticket.name}
		</div>
		</div>
		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">패스/티켓</p>
			</div>	
		</div>
		
		<div class="position formInfo">
			<div class="position titleBox">
				<h3><strong>일본</strong></h3>
			</div>
			<div class="wrap_1">
				<div>
					<img style="width: 410px; height: 290px;"
						src="../resources/img/ticket/${requestScope.ticket.img}">
				</div>
				<div style="width: 400px;">
					<h4>${requestScope.name}</h4>
				</div>

				<div>
					<table style="width: 500px;">
						<colgroup>
							<col width="20%">
							<col width="80%">
						</colgroup>
						<tr>
							<td><strong>취소수수료</strong></td>
							<td>10%</td>
						</tr>
						<tr>
							<td><strong>상품선택</strong></td>
							<td>
								<select id="choice" class="form-control">
									<option selected="selected">선택</option>
									<option value="${requestScope.ticket.num}">${requestScope.ticket.kind}${requestScope.ticket.price}원</option>
								</select>
							</td>
						</tr>
					</table>
					<br>
					<div id="infoSection"></div>
					
					<div>
						총 판매금액 : <span id="total">0</span> 원
					</div>
				</div>

				<div style="margin: 20px 20px 20px 400px;">
					<input type="button" class="btn" id="buyBtn" value="구매하기">
				</div>

				<div
					style="border: 1px solid #e2e2e2; margin: 20px 0px; padding: 20px; width: 1000px;">
					<ul>
						<li><strong><span style="color: blue;">유효기간 |</span></strong>
							2017.06.28.까지 현지에서 여권과 함께 제시하여 교환</li>
					</ul>
					<ul>
						<li><strong><span style="color: blue;">주의사항 |</span></strong></li>
						<li>- 한국인이면서, 무비자입국(90일단기체류)시에만 이용가능 합니다.</li>

						<li>- 본 상품은 해외여행객으로써 현지가 대비 저렴하게 구입해서 가서 현지에서 교환후 사용하는 것으로 열차
							운임에 대한 것만 포함되어있습니다.<br>(원하시는 날짜의 열차 좌석을 출국전 확보할 수 있는 것은 아니며
							편도권상품의 지정석은 현지에 교환시 문의하셔야합니다.)
						</li>

						<li>- 환불은 구입후 1개월이내 당사 도착분에 한하여 수수료 10% 공제후 환불가능(받았던 교환권 그대로
							반송), 이후 도착시 환불 불가</li>
						<li>- 현지 교환 후에는 열차의 운행 중단이나 지연 등의 사유가 발생 하더라도 티켓의 유효기간 연장 또는
							환불 불가</li>

						<li>※ 자유여행상품 예약자는 해당 상품 담당자에게 개별 구입문의하셔야합니다.</li>

						<li>* 2017/06/28 까지 기간한정 상품입니다.</li>
					</ul>
				</div>
				<div
					style="margin: 20px 0px;">
					<div class="position titleBox">
						<h3>
							<span style="color: blue;">자동 출입국 심사</span>시 주의사항
						</h3>
					</div>
					<div>
						외국인 관광객을 대상으로 하는 패스는 여권에 '단기체재' 스탬프/스티커를 받으신 분만 패스 교환 및 이용이 가능합니다.
						자동입국 심사대를 이용하실 경우, 여권에 '단기체재' 스탬프/스티커가 찍히지 않아 패스 교환 및 이용이 불가하오니,
						반드시 <span style="color: red;">입국심사관에게 심사를 받은 후 입국</span>하시기 바랍니다.
						<img alt="자동출입국심사이미지" src="../resources/img/newpass.PNG">
					</div>
				</div>

				<div
					style="border: 1px solid #e2e2e2; margin: 20px 0px; padding: 20px;">
					<ul>
						<li><strong><span style="color: blue;">요금정보 |</span></strong></li>
						<li style="float: right;"><a id="agecal"
							style="cursor: pointer;">만 나이 계산기</a></li>
					</ul>
					<table
						style="border-top: 1px solid #e2e2e2; border-bottom: 1px solid #e2e2e2; width: 90%;">
						<tr
							style="background-color: lightgrey; border-top: 1px solid #e2e2e2; border-bottom: 1px solid #e2e2e2;">
							<td>상품</td>
							<td>어라운드무비 판매가</td>
						</tr>
						<tr
							style="border-top: 1px solid #e2e2e2; border-bottom: 1px solid #e2e2e2;">
							<td>${requestScope.ticket.kind}</td>
							<td>${requestScope.ticket.price}원</td>
						</tr>
					</table>
					
					<ul>
						<li>■ 환불안내</li>
						<li>- 구입후 취소, 환불은 구입일로부터 1개월 이내에만 가능, 수수료 10%가 발생합니다.</li>
						<li>(현지 교환하기전, 받으신 상태 그대로 보내주셔야 합니다.)</li>
						<li>- 입금후 발권이 순차 진행되므로 입금후부터 취소,변경 발생시에도 수수료 10% 공제후 환불가능합니다.
							(영문변경시에도 수수료발생)</li>
						<li>- 열차티켓으로 교환 후의 환불은 불가능합니다.</li>
						<li>- 구성품 모두 해외 사전구입용으로 현지에서는 어떠한 환불도 불가합니다.</li>
						<li>- 열차의 운행 중지나 연착, 기타 사유가 발생하여도 패스의 유효기간을 연장하거나 환불받으실 수
							없습니다.</li>
						<li>- 분실이나 도난 등의 사고를 당하더라도 재발행되지 않습니다.</li>
					</ul>
					<ul>
						<li>■ 주문안내</li>
						<li>* 방문수령,택배배송,인천공항수령 등 3가지방법으로 주문가능합니다.</li>
						<li>(방문: 서울본사,부산,대구 지점만 가능 / 택배: 2,500원, 우체국택배이용 / 인천공항:
							5,000원 패스비와 함께 선결제)</li>
						<li>* 여러 종류의 패스를 함께 주문시 [장바구니]를 이용하시면 한번에 구매가 가능(묶음배송가능)합니다.
							(묶음배송 : 택배비 또는 공항전달비를 1번만 부담)</li>
						<li>* 출발일이 얼마 남지않은 경우 방문 또는 인천공항 수령으로 주문 부탁드립니다. (5일이내 출발의 경우
							택배지연 가능성이 있어 택배예약 불가)</li>
						<li>* 택배예약은 평일 오전 11시까지 입금완료된 건에 한해 당일 발송, 오전 11시이후 입금건은 다음날
							발송되므로 여유있게 주문,결제부탁드립니다. 발송후 2~4일내 배송예상</li>
						<li>(참고: 금요일 오전 11시이후 결제시 월요일 발송, 화~목요일 배송예상)</li>
					</ul>
				</div>

			</div>
		</div>
	</section>

	<%@ include file="/sub/temp/footer.jspf"%>
</body>
</html>