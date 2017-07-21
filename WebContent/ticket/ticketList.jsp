<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book.css">
<%@ include file="/sub/temp/bootStrap.jspf"%>
<title>어라운드 무비</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#insert").click(function() {
			location.href = "./hotelInsert.jsp";
		});
		
		$("#nationList").click(function() {
			$.get("./ticketNation.ticket", {
				
			}, function(data) {
				$("#nation").html(data);
			})
		});
		
		$(".go").click(function(){
			var curPage=$(this).attr("id");
			location.href="./ticketList.ticket?location="+${requestScope.location.num} + "&curPage=" + curPage;
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
.wrap_1 {
	margin: 30px 0;
}

.li_1 {
	width: 30%;
	float: left;
}

.li_1 > div {
	padding: 15px;
	height: 170px;
	border: 1px solid #e2e2e2;
	background-color: #e6e6e6;
}

.ticketTable {
	height: 300px;
	width: 293px;
	float: left;
	margin: 20px;
	background-color: white;
}

table.search {
	width: 500px;
	margin: 0px auto;
	float: none;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf"%>

	<section>
		<!-- 왼쪽 사이드바 -->
		<nav class="col-sm-3" id="myScrollspy">
			<ul class="nav nav-pills nav-stacked">
				<li><h2 style="color: white">
						<a href="./ticketList.ticket?location=1&curPage=1"
							style="color: white">일본</a>
					</h2></li>
				<li id="nationList"><h2 style="color: white; cursor: pointer;">해외</h2></li>
				<span id="nation"></span>
			</ul>
		</nav>
		
		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> >
				<a href="ticketMain.jsp">패스/티켓</a> > ${requestScope.location.nation}
			</div>
		</div>
		
		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">${requestScope.location.nation}</p>
			</div>	
		</div>
		
		<div class="position formInfo">
			<div class="position titleBox">
				<h3><strong>${requestScope.location.nation}</strong></h3>
			</div>
			<div class="wrap_1 position">
				
				<c:if test="${requestScope.message == null}">
					<c:forEach items="${requestScope.ticketList}" var="ar">
						<table class="ticketTable">
							<tr>
								<td>
									<a href="./ticketView.ticket?name=${ar.name}"><img style="width: 100%; height: 170px;" src="../resources/img/ticket/${ar.img}"></a>
								</td>
							</tr>
							<tr>
								<td style="width: 100%; height: 110px; padding: 10px;">
									<div style="border-bottom: 1px dotted #c0c0c0">
										<h4><strong>${ar.name}</strong></h4>
										<h4 style="color: blue">${ar.price} 원</h4>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width: 100%; height: 50px; padding: 10px;">
									<div>
										2017.06.28.까지 현지에서 여권과 함께 제시하여 사용 가능
									</div>
								</td>
							</tr>
						</table>
					</c:forEach>
				</c:if>
				<c:if test="${requestScope.message != null}">
					<h3 style="color: red;">${requestScope.message}</h3>
				</c:if>
			</div>
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
		</div>
	</section>

	<%@ include file="/sub/temp/footer.jspf"%>
</body>
</html>