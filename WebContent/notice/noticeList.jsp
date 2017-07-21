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

table.notice {
	width: 980px;
	margin: 20px auto;
}

table.search {
	width: 500px;
	margin: 0px auto;
	float: none;
}

.position {
	width: 1000px;
}

tr.top {
	font-weight: bold;
	background-color: rgb(44,65,98);
	color:white;
}

td {
	font-size: 15px;
	text-align: center;
}

.pagination {
	margin: 0px; 
}

span {
	cursor: pointer;
}

.left{
	text-align: left;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".go").click(function(){
			var curPage=$(this).attr("id");
			location.href="./noticeList.notice?curPage="+curPage+"&kind=${kind}&search=${search}";
		});
		$("#write").click(function(){
			location.href="./noticeWriteForm.jsp";
		});
	});
</script>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>

	<section>
		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 공지사항
			</div>
		</div>

		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">공지사항</p>
			</div>	
		</div>
	
		<div class="position formInfo">
			<table class="notice table table-hover">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
				</colgroup>
				
				<thead>
					<tr class="top">
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일자</td>
						<td>조회수</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${noticeList}" var="n">
						<tr>
							<td>${n.num}</td>
							<td class="left"><a href="./noticeView.notice?num=${n.num}&curPage=${curPage}">${n.title}</a></td>
							<td>${n.writer}</td>
							<td>${n.reg_date }</td>
							<td>${n.hit }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="position">
			<form action="./noticeList.notice">
				<table class="search">
					<colgroup>
						<col width="40%">
						<col width="40%">
						<col width="20%">
					</colgroup>
					<tr>
						<td><select class="form-control" name="kind">
								<option value="title">제목으로 검색</option>
								<option value="contents">내용으로 검색</option>
								<option value="writer">작성자로 검색</option>
						</select></td>
						<td><input type="text" class="form-control" name="search"></td>
						<td><button class="btn btn-success">검색</button></td>
					</tr>
				</table>
			</form>
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
	</section>

	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>