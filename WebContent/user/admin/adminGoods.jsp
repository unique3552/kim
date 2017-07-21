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
			<a href="../../index.jsp">HOME</a> > Admin Page > 상품 관리
		</div>
		</div>
		
		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">상품 관리</p>
		</div>
		</div>
		
		<div class="position formInfo">
			<table class="select table table-hover">
				<colgroup>
					<col width="15%">
					<col width="40%">
					<col width="25%">
					<col width="20%">
				</colgroup>
				<thead>
				<tr class="top">
					<th>상품 번호</th>
					<th>상품 이름</th>
					<th>여행 국가</th>
					<th>수용 가능 인원</th>
				</tr>
				</thead>
				
				<tbody>
				<c:forEach items="${requestScope.tpackage}" var="tpackage">
					<tr>
						<td>${tpackage.num}</td>
						<td><a href="../../tPackage/tPackageView.tPackage?num=${tpackage.num}">${tpackage.name}</a></td>
						<td>${tpackage.nation}</td>
						<td>${tpackage.pnum}</td>	
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>