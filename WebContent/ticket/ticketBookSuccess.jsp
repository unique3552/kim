<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

table.menu {
	height: 100px;
	margin: 20px auto;
	margin-left: 2%;
}

table.select{
	float: left;
	margin: 20px auto;
	margin-left: 2%;
}

.button {
	text-align: center;
}

.small {
	margin-top: 0px;
	padding: 10px;
}

.orangeLine {
	border: 4px solid orange;
}

th {
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	padding: 10px 20px 10px 20px;
	vertical-align: middle;
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

select {
	width: 100px;
}

.indent {
	text-indent: 20px;
}

.middle {
	font-size: 16px;
	font-weight: bold;
	width: 200px;
	text-align: left;
}

.low {
	font-size: 16px;
	font-weight: bold;
	float: left;
	text-align: center;
	margin-left: 20px;
	margin-right: 100px;
	margin-top: 10px;
}

hr {
	border: 2px solid black;
	margin: 10px;
}

.tableHead {
	background-color: #cccccc;
}

.cash {
	width: 70%;
}

input {
	width: 150px;
}

tr.line {
	border-top: 2px solid #666666;
	border-bottom: 2px solid #666666;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#my_btn").click(function() {
			location.href="../user/member/memberTicketBookList.book";
		});
		$("#index_btn").click(function() {
			location.href="../index.jsp";
		});
	});

</script>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<div class="bBar">
			<div class="position noBMargin">
			<a href="../index.jsp">HOME</a> > 패스/티켓 > 패스/티켓 예약
		</div>
		</div>
		<div class="wBar">
			<div class="position noTMargin">
			<p class="title">패스/티켓 예약</p>
		</div>
		</div>
		
		<div class="position formInfo">
		<div class="position titleBox">
			<h3>상품 정보</h3>
		</div>
			<table>
				<tr>
					<th>상품명</th>
					<th>수량</th>
					<th>금액</th>
				</tr>
				<tr>
					<td>${requestScope.ticket.name}</td>
					<td>${requestScope.pnum} 매</td>
					<td>${requestScope.won} 원</td>
				</tr>
			</table>
		
		
		<div class="position">
		<div class="position titleBox">
			<h3>수령방법</h3>
		</div>
			<table>
				<tr>
					<th>수령방법</th>
					<td>
						<ul>
							<c:if test="${requestScope.pmethod == 'visit'}">
								<li>방문수령</li>
							</c:if>
							<c:if test="${requestScope.pmethod == 'airport'}">
								<li>인천공항수령</li>
								<li>수령장소 | 인천공항3층 1번출입구 A카운터-유리벽사이 여행박사테이블</li>
							</c:if>
						</ul>
					</td>
				</tr>
				<tr>
					<th>수령일자</th>
					<td>
						<ul>
							<li>${requestScope.sdate}</li>
						</ul>
					</td>
				</tr>
				
			</table>
		</div>
		</div>

		<div class="position button">
			<input type="button" class="btn btn-warning" value="마이페이지 가기" id="my_btn">
			<input type="button" class="btn btn-default" value="메인 가기" id="index_btn">
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>