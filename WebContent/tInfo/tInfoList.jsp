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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".go").click(function(){
			var curPage=$(this).attr("id");
			location.href="./tInfoList.tInfo?curPage="+curPage+"&kind=${kind}&search=${search}";
		});
	});
</script>
<style type="text/css">
h3{
	margin: 0;
}
.formInfo{
	width: 1020px;
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

tr.top {
	font-weight: bold;
	background-color: rgb(44,65,98);
	color:white;
}

td {
	font-size: 16px;
	text-align: center;
}

.pagination {
	margin: 0px; 
}

span {
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>

	<section>
		<nav class="col-sm-3" id="myScrollspy">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="tInfoMap.jsp">여행정보 맵</a></li>
				<li class="active"><a href="tInfoList.tInfo">여행정보 List</a></li>
			</ul>
		</nav>
		
		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 여행정보 > 여행정보 List
			</div>
		</div>

		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">여행정보 List</p>
			</div>	
		</div>
		
		
		<div class="position formInfo">
			<table class="notice table table-hover">
				<colgroup>
					<col width="10%">
					<col width="35%">
					<col width="20%">
					<col width="35%">
				</colgroup>

				<thead>
					<tr class="top">
						<td>번호</td>
						<td>장소명</td>
						<td>국가</td>
						<td>영화</td>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${tInfoList}" var="tInfo">
						<tr>
							<td>${tInfo.num}</td>
							<td><a href="./tInfoView.tInfo?num=${tInfo.num}">${tInfo.tname}</a></td>
							<td>${tInfo.nation}</td>
							<td>${tInfo.video}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="position">
			<form action="">	<!-- 수정하기 -->
				<table class="search">
					<colgroup>
						<col width="40%">
						<col width="40%">
						<col width="20%">
					</colgroup>
					<tr>
						<td>
						<select class="form-control" name="kind">
								<option value="tname">장소명으로 검색</option>
								<option value="nation">국가로 검색</option>
								<option value="video">영화로 검색</option>
						</select></td>
						<td><input type="text" class="form-control" name="search"></td>
						<td><button class="btn btn-success">검색</button></td>
					</tr>
				</table>
			</form>
		</div>

		<div class="position">
			<table class="search">
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
				</tr>
			</table>
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>