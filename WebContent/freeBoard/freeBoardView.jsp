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
		$("#frm").hide();
	    
		$("#mod").click(function(){
			location.href="freeBoardModForm.freeBoard?num=${freeBoard.num}";
		});
		
		$("#del").click(function(){
			location.href="freeBoardDelete.freeBoard?num=${freeBoard.num}&pnum=${freeBoard.fnum}";
		});
		
		$("#list").click(function(){
			location.href="freeBoardList.freeBoard?curPage=${curPage}";
		});
		
		$("#reply").click(function(){
			$("#frm").toggle(500);
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
	max-width: 300px;
	padding: 10px 20px 10px 20px;
}

span {
	cursor: pointer;
}


tr:LAST-CHILD {
	border-bottom-style: none;
}

.green{
	font-weight: bold;
	background-color: rgb(44,65,98);
	color:white;
	border-radius: 3px;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 
				<a href="freeBoardList.freeBoard">여행자Talk</a> > 여행자Talk ${freeBoard.num}
			</div>
		</div>

		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">여행자Talk ${freeBoard.num}</p>
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
					<td>번호</td>	
					<td>${freeBoard.num}</td>
					<td>제목</td>
					<td colspan="3">${freeBoard.title}</td>
				</tr>
				
				<tr style="border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;">
					<td>작성자</td>
					<td>${freeBoard.writer}</td>
					<td>작성일자</td>
					<td>${freeBoard.reg_date}</td>
					<td>조회수</td>
					<td>${freeBoard.hit}</td>
				</tr>
			
				<tr>
					<td colspan="6" class="green">내용</td>
				</tr>
				
				<tr>
					<td colspan="6"><p>${freeBoard.contents}</p>
					<div class="position">
					<c:forEach items="${fileList}" var="f">
							<img src="../upload/${f.fsname}" style="max-width:920px;">
					</c:forEach>
					</div>
					</td>
				</tr>
			
				<tr>
					<td colspan="6">
					<c:if test="${freeBoard.writer==sessionScope.member.id}">
						<input class="btn btn-danger" type="button" value="삭제" id="del">
						<input class="btn btn-warning" type="button" value="수정" id="mod">
					</c:if>
						<input class="btn btn-primary" type="button" value="목록으로" id="list">
					<c:if test="${sessionScope.member!=null}">
						<input class="btn" type="button" value="답글달기" id="reply">
					</c:if>
					</td>
				</tr>
			</table>
		</div>

		<div id="frm" class="position formInfo">
			<form id="refrm" action="freeBoardReply.freeBoard" method="post">
				<input type="hidden" name="num" value="${freeBoard.num}">
				<table class="notice">
					<tr style="border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;">
						<td>제목</td>
						<td><input class="form-control" type="text" name="title"></td>
					</tr>
					
					<tr style="border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;">
						<td>작성자</td>
						<td><input class="form-control" type="text" name="writer"></td>
					</tr>
					
					<tr>
						<td colspan="2" class="green">내용</td>
					</tr>
					
					<tr>
						<td colspan="2"><textarea id="se" cols="90px" cols="" name="contents"></textarea></td>
					</tr>
					
					<tr>
						<td colspan="2"><button class="btn btn-success">답글작성</button></td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>