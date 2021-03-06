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
		$("#bookList").click(function() {
			$.post("../../common/bookList.jsp",
			function(data) {
				$("#sub").html(data);	
			});
		});
		
		$(".go").click(function(){
			var curPage=$(this).attr("id");
			location.href="./memberFlightBookList.book?curPage="+curPage;
		});
	});
</script>
<style>
h3{
	margin: 0;
}
section{
	padding-bottom: 100px;
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
.red{
	color:red;
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
			<a href="../../index.jsp">HOME</a> > My Page > 예약/결제내역 > 항공권
		</div>
		</div>

		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">항공권</p>
		</div>
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
							<th scope="col">출국 / 귀국 날짜</th>
							<th scope="col">편명</th>
							<th scope="col">인원수</th>
							<th scope="col">예약상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.book}" var="book"
							varStatus="status">
							<tr>
								<td><a href="./memberFlightBookView.book?num=${book.num}">F${book.day}-${book.num}</a></td>
								<td>${book.sdate} /<br> ${book.ldate}
								</td>
								<td>${requestScope.flight[status.index].name}</td>
								<td>${book.pnum} 명</td>
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
						모든 취소 접수시간은 어라운드 무비의 <span style="color: rgb(0,174,240);">평일(정상영업일) 업무시간</span>을 기준으로 합니다.<br>
						<br>

						＊ 월~금요일 : 09:00~18:00 (원활한 업무처리를 위해 16시까지 접수 부탁 드립니다)<br>
						＊ 토, 일, 공휴일 : 현지 취소의 문제점이 있어 처리가 불가능합니다. (공휴일은 해외 현지 공휴일을 포함합니다.)<br>
						    취소 접수일이 토/일요일인 경우 금요일 16시까지 접수해야 하며, 그 이후 취소는 월요일 접수로 처리됩니다.<br>
					</dd>
					<br>
					<dt>※ 취소 수수료</dt>
					<dd>
						<table>
							<tr>
								<td><strong>~ 출발 91일 전</strong></td><td>수수료 없음</td>
							</tr>
							<tr>
								<td><strong>출발 90일 ~ 61일 전</strong></td><td><span class="red">20,000원</span> 수수료 부과</td>
							</tr>
							<tr>
								<td><strong>출발 60일 ~ 31일 전</strong></td><td><span class="red">40,000원</span> 수수료 부과</td>
							</tr>
							<tr>
								<td><strong>출발 30일 ~ 출발 당일</strong></td><td><span class="red">60,000원</span> 수수료 부과</td>
							</tr>
						</table>
					</dd>
					<br>
					<dt>* 항공권은 명시된 여정 순서대로 사용해야 하며 왕복 여정 중 첫 구간 미탑승 시 리턴 구간 사용은 불가합니다.<br>
						<strong>* 운임이 인하될 경우 차액 환불은 불가합니다.</strong><br>
						* 왕복항공권은 첫구간 편도 취소는 불가합니다.<br>
						* 항공권 구매 후 결제수단은 변경이 불가합니다.<br>
						* 항공권은 타인 양도 및 명의 변경이 불가합니다.<br>
						<strong>* 모든 수수료는 1인, 편도 기준으로 적용 됩니다.</strong>
					</dt>
					
				</dl>
			</div>

		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf"%>
</body>
</html>