<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
<%@ include file="/sub/temp/bootStrap.jspf"%>
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book.css">
<title>어라운드 무비</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var day = new Date("${requestScope.book.day}");
		var year = day.getFullYear();
		var month = day.getMonth() + 1;
		var date = day.getDate() + 1;
		if (month < 10) {
			month = "0" + month;
		}
		if (date < 10) {
			date = "0" + date;
		}	
		
		$(".limit").html(year + "-" + month + "-" + date + " 오후 11:59:59");
		
		$("#bookList").click(function() {
			$.post("../../common/bookList.jsp",
			function(data) {
				$("#sub").html(data);	
			});
		});
		
		var point = ${requestScope.point};
		
		$("#point_input").focus(function(){
			$("#point_span").html("보유 적립금은 " + point + "원 입니다.");
        });
	
		
		$("#point_btn").click(function() {
			if ($("#point_input").val() > point) {
				alert("보유 적립금을 확인 해 주세요.");
			} else {
				var total = ${requestScope.book.won} - $("#point_input").val();
				$("#total_price").html(total + " 원");
			}
		});
		
		$("#pay_btn").click(function() {
			window.open("", "pay_pop", "top=200, left=500, width=400, height=500");
			document.frm.price.value = ${requestScope.book.won};
			document.frm.point.value = $("#point_input").val();
			document.frm.action = "./memberPayAgree.book";
			document.frm.method = "post";
			document.frm.target = "pay_pop";
			document.frm.submit();
		});
		
		$("#list_btn").click(function() {
			location.href="./memberRentBookList.book";
		});
		
		$("#book_cancel").click(function() {
			document.frm.action = "./memberBookCancel.book";
			document.frm.submit();
		});
		
		$("#pay_cancel").click(function() {
			document.frm.action = "./memberPayCancel.book";
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
.button {
	text-align: center;
}

th {
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	padding: 10px 20px 10px 20px;
	vertical-align: middle;
	background-color: #e6e6e6;
}

td {
	font-size: 14px;
	padding: 10px 20px 10px 20px;
}

.left {
	text-align: left;
}

.right {
	text-align: right;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf"%>

	<nav class="col-sm-3" id="myScrollspy">
		<ul class="nav nav-pills nav-stacked">
			<li><a href="./memberPoint.member">My 멤버쉽</a></li>
			<li><a id="bookList">예약/결제내역</a></li>
			<li id="sub" style="margin-left: 20px;"></li>
			<li><a href="./memberMyInfo.jsp">회원 정보 관리</a></li>
			<li><a href="./memberDelete.jsp">회원 탈퇴</a></li>
		</ul>
	</nav>

	<section>
		<div class="bBar">
		<div class="position noBMargin">
			<a href="../../index.jsp">HOME</a> > My Page > 예약/결제내역 > 패스/티켓
		</div>
		</div>

		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">패스/티켓</p>
		</div>
		</div>
		<div class="position formInfo">
			<div>
			<div class="position titleBox">
				<h3>예약 내용</h3>
			</div>
				<hr>
				<table>
					<colgroup>
						<col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="35%">
					</colgroup>
					<tr>
						<th>예약번호</th>
						<td class="left">T${requestScope.book.day}-${requestScope.book.num}</td>
						<th>예약상태</th>
						<td class="left">${requestScope.book.status}</td>
					</tr>
					<tr>
						<th>예약상품</th>
						<td class="left">${requestScope.ticket.name}</td>
						<th>예약매수</th>
						<td class="left">${requestScope.book.pnum} 매</td>
					</tr>
					<tr>
						<th>수령방법</th>
						<td class="left" colspan="3">
							<ul>
								<c:if test="${requestScope.book.pmethod == 'visit'}">
									<li>수령방법 | 방문수령</li>
									<li>수령날짜 | ${requestScope.book.sdate}</li>
									<li>수령장소 | 서울본사 : (04320) 서울시 용산구 한강대로 313 / 부산지사 : 	(48957) 부산광역시 중구 대청로 148
									</li>								
								</c:if>
								<c:if test="${requestScope.book.pmethod == 'airport'}">
									<li>수령방법 | 인천공항수령</li>
									<li>수령날짜 | ${requestScope.book.sdate}</li>
									<li>수령장소 | 인천공항3층 1번출입구 A카운터-유리벽사이 어라운드무비 테이블 [대한항공(KE), 진에어(LJ), 제주항공 (7C)]
									</li>								
								</c:if>
							</ul>
							<c:if test="${requestScope.book.pmethod == 'visit'}">
								<div style="background-color: lightgrey; padding: 15px;">
									<ul>
										<li>서울, 부산지점만 방문수령 가능합니다.</li>
										<li>- 서울 방문시간 : 오전 9시~오후 8시</li>
										<li>- 부산 방문시간 : 오전 9시~오후 6시</li>
									</ul>
								</div>
							</c:if>
							<c:if test="${requestScope.book.pmethod == 'airport'}">
								<div style="background-color: lightgrey; padding: 15px;">
									<div><span style="color: blue;">인천공항 수령 시 주의사항</span></div>
									<ul>
										<li>수령 당일 공항 직원이 미리 전화 드리지 않습니다. 선택하신 수령 시간에 미팅 장소로 직접 가셔서 수령하시면 됩니다.</li>
										<li>인천공항 3층 항공사 체크인 카운터 양쪽 끝에 미팅 장소가 있습니다.<br>
										★반드시 패스 수령을 마치신 후 출국장(보안검색, 출국심사)으로 들어가시기 바랍니다.★<br>
										(한번 출국장으로 들어간 뒤에는 나오실 수 없습니다.)</li>
										<li>미팅 장소에 직원이 부재중일 경우, 아래 비상 연락처로 연락 주시기 바랍니다.<br>
										[비상 연락처 : 010-8962-1773]
										</li>
										<li>공항의 미팅 담당자는 어라운드무비 직원이 아닌, 공항 안내 외주 업체 직원입니다.<br>
											따라서 여행 관련 질문에는 답해드리지 못하므로, 문의 사항이 있을 경우 사전에 담당자에게 문의해 주시기 바랍니다.</li>
										<li>항공사 수속 카운터는 항공사 사정으로 변경될 수 있습니다.</li>
									</ul>
									
								</div>
							</c:if>					
						</td>
					</tr>
				</table>
				
				<div class="position titleBox">
				<h3>결제 정보</h3>
				</div>
				<hr>
				<c:if test='${requestScope.book.status == "결제대기"}'>
					<table>
						<tr>
							<th>적립금 사용</th>
							<td class="left"><input type="text" id="point_input" style="text-align: right; width: 60px;" value="0">원 
							<input type="button" id="point_btn" value="사용">
							<span id="point_span" style="color: blue;"></span>
							</td>
						</tr>
						<tr>
							<th>총금액</th>
							<td class="left" id="total_price">${requestScope.book.won} 원</td>
						</tr>
						<tr>
							<th>결제기한</th>
							<td class="limit left">${requestScope.book.day} 오후 11:59:59</td>
						</tr>
						<tr>
							<th style="vertical-align: top;">결제방법</th>
							<td class="left">
								*가상계좌 결제 및 다양한 결제 방법으로 결제 가능합니다.<br>
								<h6>예금입금 : 신한은행 56202761552574</h6>
								<h6>예금주 : 어라운드 무비(KCP 한국 사이버 결제)</h6>							
								<h6>계좌유효기간 : <span class="limit"></span></h6>
								<br>
							</td>
						</tr>
					</table>
					<form name="frm" method="post">
						<input type="hidden" name="price" value="">
						<input type="hidden" name="name" value="${requestScope.member.name}">
						<input type="hidden" name="num" value="${requestScope.book.num}">
						<input type="hidden" name="day" value="${requestScope.book.day}">
						<input type="hidden" name="point" value="">
					</form>
					
					<div class="position button">
						<input type="button" id="pay_btn" class="btn btn-primary" value="신용카드 결제">
						<input type="button" id="book_cancel" class="btn btn-danger" value="예약취소">
						<input type="button" id="list_btn" class="btn btn-default" value="목록">
					</div>
				</c:if>
				
				<c:if test='${requestScope.book.status == "예약확정"}'>
					<table>
						<tr>
							<th>총금액</th>
							<td class="left">${requestScope.book.won} 원</td>
						</tr> 
						<tr>
							<th>사용 적립금</th>
							<td class="left">${requestScope.book.usepoint} 원</td>
						</tr> 
						<tr>
							<th>결제 금액</th>
							<td class="left">${requestScope.book.won + requestScope.book.usepoint} 원</td>
						</tr> 
					</table>
					
					<div class="position button">
						<input type="button" id="pay_cancel" class="btn btn-danger" value="결제취소">
						<input type="button" id="list_btn" class="btn btn-default" value="목록">
					</div>	
				</c:if>
				
				<c:if test='${requestScope.book.status == "취소완료"}'>
					<p style="color: red;">예약 취소된 상품입니다.</p>
				</c:if>
						
			</div>
				
		</div>
	</section>

	<%@ include file="/sub/temp/footer.jspf"%>
</body>
</html>