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
<title>어라운드 무비</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var day = new Date();
		var year = day.getFullYear();
		var month = day.getMonth() + 1;
		var date = day.getDate() + 1;
		if (month < 10) {
			month = "0" + month;
		}
		if (date < 10) {
			date = "0" + date;
		}	
		
		$("#pay_date").html(year + "-" + month + "-" + date);
		
		$("#cancel_btn").click(function() {
			document.frm.action = "./memberBookCancel.book";
			document.frm.submit();
		});
		
		
		
		$("#list_btn").click(function() {
			if($("#goods").val()==6){
				location.href="./memberHotelBookList.book";
			}else if($("#goods").val()==2){
				location.href="./memberFlightBookList.book";
			}else if($("#goods").val()==3){
				location.href="./memberRentBookList.book";
			}else if($("#goods").val()==5){
				location.href="./memberTPackageBookList.book";
			}else if($("#goods").val()==4){
				location.href="./memberTicketBookList.book";
			}
		});
	});
</script>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf"%>

	<nav class="col-sm-3" id="myScrollspy">
		<ul class="nav nav-pills nav-stacked">
			<li><a href="./memberPoint.member">My 멤버쉽</a></li>
			<li><a id="bookList">예약/결제내역</a></li>
			<li id="sub" style="margin-left: 20px; background-color: pink;"></li>
			<li><a href="./memberMyInfo.jsp">회원 정보 관리</a></li>
			<li><a href="./memberDelete.jsp">회원 탈퇴</a></li>
		</ul>
	</nav>

	<section>
		<div class="position">
			<a href="../../index.jsp">HOME</a> > My Page > 예약/결제내역 > 결제 완료
		</div>

		<div class="position">
			<div>
				<h3>원화 결제 완료</h3>
				<hr>
				<input type="hidden" id="goods" value="${goods}">
				<table>
					<tr>
						<td><strong>예약상품 번호</strong></td>
						<td>R${requestScope.day}-${requestScope.bnum}</td>
					</tr>
					<tr>
						<td><strong>결제 날짜</strong></td>
						<td id="pay_date"></td>
					</tr>
					<tr>
						<td><strong>사용 적립금</strong></td>
						<td>${requestScope.point.usePoint} 원</td>
					</tr>
					<tr>
						<td><strong>적립금 잔액</strong></td>
						<td>${requestScope.point.curPoint} 원</td>
					</tr>
					<tr>
						<td><strong>결제 금액</strong></td>
						<td>${requestScope.price + requestScope.point.usePoint} 원</td>
					</tr>
					<tr>
						<td><strong>결제방법</strong></td>
						
						<c:if test="${requestScope.bank == null}">
							<td>
								<h4>가상계좌 결제</h4>
								<h4>입금자명 : ${requestScope.name}</h4>
							</td>
						</c:if>
						<c:if test="${requestScope.bank != null}">
							<td>
								<h4>신용카드 결제</h4>
							</td>
						</c:if>
					</tr>
				</table>
				<form name="frm" method="post">
					<input type="hidden" name="pnum" value="${requestScope.point.num}">
					<input type="hidden" name="usePoint" value="${requestScope.point.usePoint}">
					<input type="hidden" name="bnum" value="${requestScope.bnum}">
					<input type="button" id="list_btn" value="목록">
				</form>
			</div>
				
		</div>
	</section>

	<%@ include file="/sub/temp/footer.jspf"%>
</body>
</html>