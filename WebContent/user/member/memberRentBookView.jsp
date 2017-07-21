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
		
		var bank;
		
		if ('${requestScope.bank}' == "shinhan") {
			bank = "신한은행";
		} else if ('${requestScope.book.bank}' == ("kb")) {
			bank = "국민은행";
		} else if ('${requestScope.book.bank}' == ("nonghyup")) {
			bank = "농협중앙회";
		} else if ('${requestScope.book.bank}' == ("woori")) {
			bank = "우리은행";
		} else if ('${requestScope.book.bank}' == ("keb")) {
			bank = "외환은행";
		} else if ('${requestScope.book.bank}' == ("suhyup")) {
			bank = "수협은행";
		} else if ('${requestScope.book.bank}' == ("ibk")) {
			bank = "기업은행";
		}
		
		$("#bank").html(bank + " ");
		
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
			<a href="../../index.jsp">HOME</a> > My Page > 예약/결제내역 > 렌트카
		</div>
		</div>
		
		
		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">렌트카</p>
		</div>
		</div>
		
		<div class="position formInfo">
			<p>
				원화결제금액을 <span style="color:rgb(0,174,240);" class="limit"></span>까지 결제하셔야 차량 수배(또는 변경)가 시작되며, 해당 시간 내에 입금이 되지 않으면 예약이 자동취소됩니다.
			</p>
			
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
						<td class="left">R${requestScope.book.day}-${requestScope.book.num}</td>
						<th>예약상태</th>
						<td class="left">${requestScope.book.status}</td>
					</tr>
					<tr>
						<th>픽업점포</th>
						<td class="left">${requestScope.location.region} 지점</td>
						<th>반납점포</th>
						<td class="left">${requestScope.location.region} 지점</td>
					</tr>
					<tr>
						<th>픽업날짜</th>
						<td class="left">${requestScope.book.sdate} 09:00 이후</td>
						<th>반납날짜</th>
						<td class="left">${requestScope.book.ldate} 21:00 이전</td>
					</tr>
					<tr>
						<th>렌터카명</th>
						<td class="left">${requestScope.rentCar.name}</td>
						<th>내비게이션</th>
						<td class="left">한국어</td>
					</tr>
				</table>
				
				<div class="position titleBox">
					<h3>현지 결제 요금 정보</h3>
				</div>
				<hr>
				<table>
					<tr>
						<th><p>렌트요금 <br>(현지 엔화결제)</p></th>
						<td>
							<table style="float: left; width: 800px;">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								<tbody>
									<tr>
										<th>차량렌트비</th><th>타지역반납금</th><th>기타요금</th><th>합계</th>
									</tr>
									<tr>
										<td class="right">${requestScope.location.unit}${requestScope.book.tprice}</td>
										<td class="right">${requestScope.location.unit} 0</td>
										<td class="right">${requestScope.location.unit} 0</td>
										<td class="right" style="font-weight:bold;">${requestScope.location.unit}${requestScope.book.tprice}</td>
									</tr>
								</tbody>
							</table>
							<p class="left">
								* 현재 표시되는 요금은 예상요금이며, 확정시 요금이 변동 될 수 있습니다. <br>
								예약이 확정 된 후 금액을 반드시 확인해 주세요.
							</p>
						</td>
					</tr>
				</table>				
			
				<div class="position titleBox">
					<h3>원화 결제 정보</h3>
				</div>
				<hr>
				<c:if test='${requestScope.book.status == "결제대기"}'>
					<table>
						<tr>
							<th>예약대행수수료</th>
							<td class="left">0 원</td>
						</tr>
						<tr>
							<th>NOC 커버</th>
							<td class="left">${requestScope.book.won} 원</td>
						</tr>
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
							<td class="limit left"></td>
						</tr>
						<tr>
							<th style="vertical-align: top;">결제방법</th>
							<td class="left">
								*가상계좌 결제 및 다양한 결제 방법으로 결제 가능합니다.<br>
								<h6>예금입금 : <span id="bank"></span> 56202761552574</h6>
								<h6>입금자명 : ${requestScope.book.dname}</h6>
								<h6>예금주 : 어라운드 무비(KCP 한국 사이버 결제)</h6>							
								<h6>계좌유효기간 : <span class="limit"></span></h6>
								<br>
							</td>
						</tr>
					</table>
					<form name="frm">
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