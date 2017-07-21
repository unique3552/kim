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
<%@ include file="/sub/temp/bootStrap.jspf" %>
<title>어라운드 무비</title>
<style type="text/css">
section {
	margin-left: 0px;
	margin-top: -70px;
	width: 100%;
}

h3{
	margin: 0px;
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

.position {
	width: 1000px;
}

.noBMargin{
	margin-top: 70px;
	margin-bottom: 0px;
}
.noTMargin{
	margin-top: 0%;
}

.formInfo{
	background-color: white;
	width: 1020px;
	border-radius: 3px;
	padding: 10px;
}

.button {
	text-align: center;
}

.small {
	margin-top: 0px;
	padding: 10px;
}

.orangeLine {
	border: 2px solid  rgb(0,174,240);
}

th {
	font-size: 16px;
	font-weight: bold;
	text-align: center;
	padding: 10px 20px 10px 20px;
	vertical-align: middle;
}

td {
	font-size: 16px;
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
			location.href="../user/member/memberRentBookList.book";
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
			<a href="../index.jsp">HOME</a> > <a href="./rentCarList.rentCar">렌트카</a> > 렌트카 예약
		</div>
		</div>
		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">렌트카 예약</p>
			<p>원화결제금액을 <%-- <span style="color: red">${requestScope.tomorrow}</span> --%> 내일까지 결제하셔야 차량 수배(또는 변경)가 시작되며, 해당시간 내에 결제가 되지 않으면 예약접수는 자동 취소됩니다.</p>
		</div>
		</div>
		
		<div class="formInfo position">
		<div class="position">
			<div class="position titleBox">
					<h3>현지 결제 요금 정보</h3>
			</div>
		</div>
		<div class="position small orangeLine">
			<span class="low">렌트요금<br>(현지 엔화결제)</span>
			
			<table class="cash">
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<tr class="tableHead line">
					<th>차량렌트비</th>
					<th>타지역반납금</th>
					<th>기타요금</th>
					<th>합계</th>
				</tr>
				
				<tr class="line">
					<td class="right">${requestScope.location.unit} ${requestScope.book.tprice}</td>
					<td class="right">${requestScope.location.unit} 0</td>
					<td class="right">${requestScope.location.unit} 0</td>
					<td class="right">${requestScope.location.unit} ${requestScope.book.tprice}</td>
				</tr>
				<tr>
					<td colspan="4">* 현재 표시되는 요금은 예상요금이며, 확정시 요금이 변동 될 수 있습니다.<br>예약이 확정 된 후 금액을 반드시 확인해 주세요.</td>
				</tr>
			</table>
		</div>
		
		<div class="position">
			<div class="position titleBox">
					<h3>원화 결제 정보</h3>
			</div>
		</div>
		<div class="position small orangeLine">
			<table class="cash">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tr>
					<th>예약대행수수료</th>
					<td>0 원</td>
				</tr>
				
				<tr>
					<th>NOC 커버</th>
					<td>${requestScope.book.won} 원</td>
				</tr>
				
				<tr>
					<th>총금액</th>
					<td>${requestScope.book.won} 원<br><span style="color: red; font-size: 0.8em;">* 마이페이지에서 가상계좌 결제 및 다양한 결제수단으로 결제 가능합니다.</span></td>
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