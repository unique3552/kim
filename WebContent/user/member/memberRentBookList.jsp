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
<script type="text/javascript">
	$(function() {
		$("#bookList").click(function() {
			$.post("../../common/bookList.jsp",
			function(data) {
				$("#sub").html(data);	
			});
		});
		
		$(".go").click(function(){
			var curPage=$(this).attr("id");
			location.href="./memberRentBookList.book?curPage="+curPage;
		});
	});
</script>
<style>
h3{
	margin: 0;
}
section{
	padding-bottom: 100px;
	height: 2000px;
}
.formInfo{
	width: 1020px;
}
.position {
	width: 1000px;
}

table.notice {
	width: 980px;
	margin: 20px auto;
}

table.search {
	width: 500px;
	margin: 0px auto;
	float: none;
}

td {
	font-size: 14px;
	text-align: center;
	vertical-align: middle;
}

.go{
	font-size: 18px;
	cursor: pointer;
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
		
		<div class="position formInfo">
			<p>
				현지 사정으로 확정 요금이 변동될 수 있으니 <span style="color: red;">결제시 확정요금</span>을
				반드시 확인해 주세요.
			</p>
			<hr>

			<div>
				<table class="notice table table-hover">
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr class="top">
							<th scope="col">예약번호</th>
							<th scope="col">픽업날짜/반납날짜</th>
							<th scope="col">픽업 점포</th>
							<th scope="col">선택 차량</th>
							<th scope="col">예약상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.book}" var="book"
							varStatus="status">
							<tr>
								<td><a href="./memberRentBookView.book?num=${book.num}">R${book.day}-${book.num}</a></td>
								<td>${book.sdate} /<br> ${book.ldate}
								</td>
								<td>${requestScope.location[status.index]}</td>
								<td>${requestScope.rentCar[status.index]}</td>
								<td>${book.status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!-- 페이징 부분/ 가운데로 배치 해주세요~ -->
			<div class="position">
				<table class="search">
					<colgroup>
							<col width="20%">
							<col width="60%">
							<col width="20%">
					</colgroup>
					<tr>
						<td><c:if test="${pageResult.curBlock>1}">
								<span class="go" id="${pageResult.startNum-1}">[이전]</span>
							</c:if></td>

						<td><ul class="pagination">
							<c:forEach begin="${pageResult.startNum}" end="${pageResult.lastNum}" var="i">
								<li><span class="go" id="${i}">${i}</span></li>
							</c:forEach>
						</ul></td>

						<td><c:if test="${pageResult.curBlock<pageResult.totalBlock}">
								<span class="go" id="${pageResult.lastNum+1}">[다음]</span>
							</c:if></td>
						<td><c:if test="${sessionScope.admin!=null}"><input type="button" class="btn btn-primary" value="글쓰기" id="write"></c:if></td>
					</tr>
				</table>
			</div>
		
			<hr>
			<div>
				<h4>처리상태 안내</h4>
				<ul style="list-style: none;">
					<li><strong>결제대기 :</strong> 고객의 예약을 접수하고 결제를 기다리는 상태입니다.</li>
					<li><strong>예약처리중 :</strong> 담당자가 예약건을 처리중입니다.</li>
					<li><strong>예약확정 :</strong> 예약이 확정 되었습니다.</li>
					<li><strong>취소완료 :</strong> 예약건이 취소 되었습니다.</li>
				</ul>
			</div>

			<div>
				<dl>
					<dt>※ 예약 및 취소 관련</dt>
					<dd>
						- 현지 지불 예상 요금은 별도의 추가 요금이 적용되지 않은 요금입니다.<br> - 현지에서 카드 결제 시
						해외에서도 사용 가능한 카드인지 미리 확인해주세요.<br> - 예약시 2만원의 취급수수료가 있으며(현재
						무료이벤트 중) 취소 시 취급수수료 부분은 환불되지 않습니다.<br> - 예약 취소 시 반드시 출발 7일전까지
						통보해 주셔야 하며, 2일전 취소는 취급수수료 외에도 차량금액의 30%, 1일전 50% , 당일은 100%가
						취소수수료로 발생합니다<br> (취소접수 기준:평일 오전 09:00- 오후 17:30 을 당일로 기준하며
						주말/공휴일은 취소가 불가합니다)
					</dd>
					<dt>※ 국제면허증 관련</dt>
					<dd>
						- 운전자의 여권 영문명과 국제운전면허증의 영문명이 동일해야 합니다. (예약자와 운전자는 틀려도 무관함)<br>
						- 국제면허증의 유효기간을 꼭 확인해주세요.<br> - 10인승 이상 운전 시 1종 대형면허가 필요하며,
						국제면허증 D란에 도장이 찍혀있어야 합니다.
					</dd>
					<dt>※ 현지 추가요금 관련</dt>
					<dd>
						- 예약 시의 반납 예정 시간을 초과한 경우 시간 당 추가 요금 발생.<br> - 픽업 장소와 반납 장소가
						예약 시와 다른 경우 거리에 따라 추가요금 발생.<br> - 반납 시 연료를 가득 채우지 못한 경우 주행거리
						환산으로 정산 후 청구.<br> - 운전자의 귀책사유로 인한 고장, 오염, 악취 등으로 수리 및 청소가 필요한
						경우 추가요금이 발생합니다.
					</dd>
				</dl>
			</div>
		</div>
		</div>
	</section>

	<%@ include file="/sub/temp/footer.jspf"%>
</body>
</html>