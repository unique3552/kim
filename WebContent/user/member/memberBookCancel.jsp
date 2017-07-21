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
		$("#list_btn").click(function() {
			if($("#goods").val()==6){
				location.href="./memberHotelBookList.book?curPage=1";
			}else if($("#goods").val()==2){
				location.href="./memberFlightBookList.book?curPage=1";
			}else if($("#goods").val()==3){
				location.href="./memberRentBookList.book?curPage=1";
			}else if($("#goods").val()==5){
				location.href="./memberTPackageBookList.book?curPage=1";
			}else if($("#goods").val()==4){
				location.href="./memberTicketBookList.book?curPage=1";
			}
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

.button{
	text-align: center;
}
.btn{
	background-color: rgb(255,192,0);
	color: white;
	width: 150px;
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
			<a href="../../index.jsp">HOME</a> > My Page > 예약/결제내역 > 예약 취소
		</div>
		</div>

		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">예약 취소</p>
		</div>
		</div>
		<div class="position formInfo">
				<input type="hidden" id="goods" value="${requestScope.gnum}">
			<div class="position button">
				<h4>예약번호 ${requestScope.goods}${requestScope.book.day}-${requestScope.book.num} 의 예약 취소가 완료되었습니다.</h4>
				<input type="button" class="btn" id="list_btn" value="목록">
			</div>
		</div>
	</section>

	<%@ include file="/sub/temp/footer.jspf"%>
</body>
</html>