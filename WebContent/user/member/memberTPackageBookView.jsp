<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>어라운드 무비</title>
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
<%@ include file="/sub/temp/bootStrap.jspf"%>
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book.css">
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
			location.href="./memberTPackageBookList.book";
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
.button {
	text-align: center;
}
h3{
	margin: 0;
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
.formInfo{
	width: 1020px;
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
			<a href="../../index.jsp">HOME</a> > My Page > 예약/결제내역 > 패키지 여행상품
		</div>
		</div>
		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">패키지 여행상품</p>
		</div>
		</div>
		<div class="position formInfo">
			<p>
				원화결제금액을 <span style="color:rgb(0,174,240);" class="limit"></span>까지 결제하셔야 예약이 확정 되며, 해당 시간 내에 입금이 되지 않으면 예약이 자동 취소됩니다.
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
						<td class="left">P${requestScope.book.day}-${requestScope.book.num}</td>
						<th>예약상태</th>
						<td class="left">${requestScope.book.status}</td>
					</tr>
					<tr>
						<th>패키지명</th>
						<td class="left"><a href="../../tPackage/tPackageView.tPackage?num=${tPackage.num}">${tPackage.name}</a></td>
						<th>인원수</th>
						<td class="left">${book.pnum}</td>
					</tr>
					<tr>
						<th>출발날짜</th>
						<td class="left">${requestScope.book.sdate}</td>
						<th>도착날짜</th>
						<td class="left">${requestScope.book.ldate}</td>
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
							<th>적립금 사용</th>
							<td class="left"><input type="text" id="point_input" style="text-align: right; width: 60px;" value="0">원 
							<input type="button" id="point_btn" value="사용">
							<span id="point_span" style="color: blue;"></span>
							</td>
						</tr>
						<tr>
							<th>총금액</th>
							<td class="left">${requestScope.book.won} 원</td>
						</tr>
						<tr>
							<th>결제기한</th>
							<td class="limit left"> </td>
						</tr>
						<tr>
							<th>결제방법</th>
							<td class="left">
								*가상계좌 결제 및 다양한 결제 방법으로 결제 가능합니다.<br>
								<h6>예금입금 : 신한은행 56202761552574</h6>
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