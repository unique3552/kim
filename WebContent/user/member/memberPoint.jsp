<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
<%@ include file="/sub/temp/bootStrap.jspf" %>
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

#img{
	width: 50px;
	height: 50px;
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>

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
			<a href="../../index.jsp">HOME</a> > My Page > My 멤버쉽
		</div>
		</div>
		
		<div class="wBar">
		<div class="position noTMargin">
				<img src="${pageContext.request.contextPath}/resources/img/point1.png" id="img"><span class="title">가용 포인트</span>
		</div>
		</div>
		<div class="position formInfo">
				<h5 style="color:rgb(0,174,240);">내 가용 포인트 : ${sessionScope.curPoint} POINT</h5>
			<form action="./memberDelete.member" method="post">
				<table class="select table table-hover">
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="40%">
						<col width="20%">
					</colgroup>
					<thead>
					<tr class="top">
						<th>날짜</th>
						<th>구분</th>
						<th>내용</th>
						<th>이용 포인트</th>
					</tr>
					</thead>
					
					<tbody>
					<c:forEach items="${point}" var="point">
						<tr>
							<td>${point.reserve}</td>
							<td>${point.category}</td>
							<td>${point.contents}</td>
							<td>${point.usePoint}</td>	
						</tr>
					</c:forEach>
					</tbody>
					
				</table>
				<input type="hidden" name="num" value="${sessionScope.member.num}">
			</form>
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>