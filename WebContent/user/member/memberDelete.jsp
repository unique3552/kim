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
<style type="text/css">
th {
	font-size: 14px;
}
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

h5{
	color: red;
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
			<a href="../../index.jsp">HOME</a> > My Page > 회원 탈퇴
		</div>
		</div>
		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">회원 탈퇴</p>
		</div>
		</div>
		<div class="position formInfo">
			<h5>회원탈퇴시, 기존 멤버십 적립 내용 및 혜택이 모두 소멸되며, 어라운드 무비 홈페이지의 모든 서비스를
				이용하실 수 없습니다.</h5>
			<h5>소멸된 내용은 복구가 불가능 하오니 신중하게 결정해 주시기 바랍니다.</h5>
			<form action="./memberDelete.member" method="post">
				<table>
					<colgroup>
						<col width="40%">
						<col width="60%">
					</colgroup>
					<tr>
						<th>아이디</th>
						<td>
							${sessionScope.member.id}
							<input type="hidden" name="id" value="${sessionScope.member.id}">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" class="form-control" name="pw"></td>
					</tr>
					<tr>
						<th>탈퇴 사유</th>
						<td><textarea class="form-control"></textarea></td>
					</tr>
					<tr><td colspan="2"><button class="btn btn-danger">탈퇴</button></td></tr>
					
				</table>
				<input type="hidden" name="num" value="${sessionScope.member.num}">
			</form>
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>