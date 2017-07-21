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
<%@ include file="/sub/temp/bootStrap.jspf" %>
<title>어라운드 무비</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#del").click(function(){
			location.href="./noticeDelete.notice?num=${notice.num}&pnum=${notice.fnum}";
		});
		$("#mod").click(function(){
			location.href="./noticeModForm.notice?num=${notice.num}";
		});
		$("#list").click(function(){
			location.href="./noticeList.notice?curPage=${curPage}";
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


tr:LAST-CHILD {
	border-bottom-style: none;
}

tr.top {
	font-weight: bold;
	background-color: rgb(44,65,98);
	color:white;
}

.position {
	width: 1000px;
}

td {
	font-size: 15px;
	text-align: center;
	max-width: 300px;
	padding: 10px 20px 10px 20px;
}

.green{
	font-weight: bold;
	background-color: rgb(44,65,98);
	color:white;
	border-radius: 3px;
}

span {
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>

	<section>
		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 
				<a href="noticeList.notice">공지사항</a> > 공지사항 ${notice.num}
			</div>
		</div>

		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">공지사항 ${notice.num}</p>
			</div>	
		</div>
		
		<div class="position formInfo">
		<table class="notice">
			<colgroup>
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="10%">
			</colgroup>
			
			<tr style="border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;">
				<td style="font-weight: bold;">번호</td>	
				<td>${notice.num}</td>
				<td style="font-weight: bold;">제목</td>
				<td colspan="3">${notice.title}</td>
			</tr>
			
			<tr style="border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;">
				<td style="font-weight: bold;">작성자</td>
				<td>${notice.writer}</td>
				<td style="font-weight: bold;">작성일자</td>
				<td>${notice.reg_date}</td>
				<td style="font-weight: bold;">조회수</td>
				<td>${notice.hit}</td>
			</tr>
			
			<tr>
				<td colspan="6">
					
				</td>
			</tr>
			
			<tr>
				<td colspan="6" class="green">내용</td>
			</tr>
			
			<tr>
				<td colspan="6"><p>${notice.contents}</p>
					<div class="position">
					<c:forEach items="${fileList}" var="f">
							<img src="../upload/${f.fsname}" style="max-width:920px;">
					</c:forEach>
					</div>
				</td>
			</tr>
			
			<tr>
				<td colspan="6">
					<c:if test="${sessionScope.admin != null }">
						<input class="btn btn-danger" type="button" value="삭제" id="del">
						<input class="btn btn-warning" type="button" value="수정" id="mod">
					</c:if>
					<input class="btn btn-primary" type="button" value="목록으로" id="list">
				</td>
			</tr>
			
		</table>
		</div>
	</section>

	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>