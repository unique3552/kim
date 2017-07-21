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
h3{
	margin: 0;
}
.formInfo{
	width: 1020px;
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
	margin-top: 5%;
	margin-left: 10%;
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
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>

	<section>
		<div class="bBar">
			<div class="position noBMargin">
			<a href="../../index.jsp">HOME</a> > 렌트카 > 렌트카 예약
		</div>
		</div>
		<div class="wBar">
			<div class="position noTMargin">
			<p class="title">렌트카 예약</p>
		</div>
		</div>
		
		<div class="position formInfo">
		<div class="position">
			<p class="indent">원화결제금액을 2017-04-26 오후 8:54:47까지 결제하셔야 차량 수배(또는 변경)가 시작되며, 해당시간 내에 결제가 되지 않으면 예약접수는 자동 취소됩니다.</p>
		<table>
			<tr><td class="middle">예약자 정보</td></tr>
		</table><hr>
		</div>
		
		<div class="position small">
			<table>
				<tr>
					<td class="middle">예약번호</td>
					<td>123123</td>
				</tr>
			</table>
		</div>
		
		<div class="position">
			<table>
				<tr><td class="middle">현지 결제요금 정보</td></tr>
			</table>
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
					<td class="right">1</td>
					<td class="right">2</td>
					<td class="right">3</td>
					<td class="right">4</td>
				</tr>
				<tr>
					<td colspan="4">* 현재 표시되는 요금은 예상요금이며, 확정시 요금이 변동 될 수 있습니다.<br>예약이 확정 된 후 금액을 반드시 확인해 주세요.</td>
				</tr>
			</table>
		</div>
		
		<div class="position">
			<table>
				<tr><td class="middle">원화 결제 정보</td></tr>
			</table>
		</div>
		<div class="position small orangeLine">
			<table class="cash">
				<colgroup>
					<col width="30%">
					<col width="70%">
				</colgroup>
				<tr>
					<th>예약대행수수료</th>
					<td class="left">1234</td>
				</tr>
				
				<tr>
					<th>NOC 커버</th>
					<td class="left">1234</td>
				</tr>
				
				<tr>
					<th>총금액</th>
					<td class="left">1234</td>
				</tr>
			</table>
		</div>
		</div>

		<div class="position button">
			<input type="button" class="btn btn-warning" value="마이페이지 가기" id="">
			<input type="button" class="btn btn-default" value="메인 가기" id="">
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>