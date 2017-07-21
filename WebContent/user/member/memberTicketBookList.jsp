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
			location.href="./memberTicketBookList.book?curPage="+curPage;
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
			<p>
				현지 사정으로 확정 요금이 변동될 수 있으니 <span style="color: red;">결제시 확정요금</span>을
				반드시 확인해 주세요.
			</p>
			<hr>

			<div>
				<table class="notice table table-hover">
					<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
					</colgroup>
					<thead>
						<tr class="top">
							<th scope="col">예약번호</th>
							<th scope="col">예약상품</th>
							<th scope="col">예약매수</th>
							<th scope="col">예약상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.book}" var="book" varStatus="status">
							<tr>
								<td><a href="./memberTicketBookView.book?num=${book.num}">R${book.day}-${book.num}</a></td>
								<td>${requestScope.ticket[status.index].name}</td>
								<td>${book.pnum} 매</td>
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
		</div>
	</section>

	<%@ include file="/sub/temp/footer.jspf"%>
</body>
</html>