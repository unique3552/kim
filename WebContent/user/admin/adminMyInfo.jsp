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
<style type="text/css">
		h3{
	margin: 0;
}
.formInfo{
	width: 1020px;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<nav class="col-sm-3" id="myScrollspy">
		<ul class="nav nav-pills nav-stacked">
			<li><a href="./adminGoods.admin">상품 관리</a></li>
			<li><a href="./adminMyInfo.jsp">관리자 정보 관리</a></li>
		</ul>
	</nav>
	
	<section>
		<div class="bBar">
		<div class="position noBMargin">
			<a href="../../index.jsp">HOME</a> > Admin Page > 관리자 정보 관리
		</div>
		</div>
		
		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">관리자 정보 관리</p>
		</div>
		</div>
		
		<div class="position formInfo">
			<form action="./adminMod.admin" method="post">
				<table class="select table table-hover">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
					</colgroup>
					
					<thead>
					<tr>
						<td>아이디</td>
						<td><input class="form-control" type="text" name="id" readonly="readonly" value="${sessionScope.admin.id}"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input class="form-control" type="password" name="pw" value="${sessionScope.admin.pw}"></td>
						<td>비밀번호 재확인</td>
						<td><input class="form-control" type="password" name="pw2" value="${sessionScope.admin.pw}"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input class="form-control" type="text" name="name" readonly="readonly" value="${sessionScope.admin.name}"></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input class="form-control" type="text" name="phone" value="${sessionScope.admin.phone}"></td>
					</tr>
					<tr><td colspan="4"><button class="btn btn-primary">수정</button></td></tr>
					</thead>
				</table>
				<input type="hidden" name="num" value="${sessionScope.admin.num}">
			</form>
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>