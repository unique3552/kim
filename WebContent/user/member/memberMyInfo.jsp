<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>

	<nav class="col-sm-3" id="myScrollspy">
		<ul class="nav nav-pills nav-stacked">
			<li><a href="./memberPoint.member">My 멤버쉽</a></li>
			<li><a id="bookList">예약/결제내역</a></li>
			<span id="sub" style="margin-left: 20px;">
			<li><a href="./memberMyInfo.jsp">회원 정보 관리</a></li>
			<li><a href="./memberDelete.jsp">회원 탈퇴</a></li>
		</ul>
	</nav>

	<section>
		<div class="bBar">
		<div class="position noBMargin">
			<a href="../../index.jsp">HOME</a> > My Page > 회원 정보 관리
		</div>
		</div>
		
		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">회원 정보</p>
		</div>
		</div>
		
		<div class="position formInfo">
			<form action="./memberMod.member" method="post">
				<table class="notice">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
					</colgroup>
					<tr>
						<td>아이디</td>
						<td><input type="text" class="form-control" name="id" readonly="readonly" value="${sessionScope.member.id}"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" class="form-control" name="pw" value="${sessionScope.member.pw}"></td>
						<td>비밀번호 재확인</td>
						<td><input type="password" class="form-control" name="pw2" value="${sessionScope.member.pw}"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" class="form-control" name="name" readonly="readonly" value="${sessionScope.member.name}"></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input type="text" class="form-control" name="phone" value="${sessionScope.member.phone}"></td>
					</tr>
					<tr>
						<td>국적</td>
						<td>
							<select class="form-control" name="nation">
								<option selected="selected" value="${sessionScope.member.nation}">대한민국</option>
							</select>							
						</td>
					</tr>
					<tr>
						<td colspan="4"><button class="btn btn-warning">수정</button></td>
					</tr>
				</table>
				<input type="hidden" name="num" value="${sessionScope.member.num}">
			</form>
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>