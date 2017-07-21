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
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/package.css">
<%@ include file="/sub/temp/bootStrap.jspf" %>
<title>어라운드 무비</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		var check=false;
		
		$("#insert").click(function(){
			if($("#hotelImg").val()==null || $("#hotelImg").val()==""){
				alert("썸네일 이미지를 첨부 하세요.");
			}else{
				check=true;
			}
			if(check){
				document.frm.submit();
			}
		});
		
	});
</script>
<style type="text/css">
table.menu {
	height: 100px;
	margin: 20px auto;
	margin-left: 2%;
}

th {
	font-size: 17px;
	font-weight: bold;
	text-align: center;
	padding: 10px 20px 10px 20px;
	background-color: #f2f2f2;
	border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;
	vertical-align: middle;
}

td {
	padding: 10px 20px 10px 20px;
	text-align: left;
	height: 30px;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
	
	<div class="bBar">
		<div class="position noBMargin">
			<a href="../index.jsp">HOME</a> > 호텔 > 호텔추가
		</div>
	</div>
	
	<div class="wBar">
		<div class="position noTMargin">
			<p class="title">호텔추가</p>
		</div>
	</div>
	
	<div class="position">
		<form action="hotelInsert.hotel"  method="post" enctype="multipart/form-data" name="frm">
			<table>
				<tr>
					<th>호텔명:</th>
					<td><input type="text" name="name"></td>
				</tr>
				
				<tr>
					<th>객실수:</th>
					<td><input type="number" name="gnum"></td>
				</tr>
				
				<tr>
					<th>지역 번호:</th>
					<td><input type="number" name="location"></td>
				</tr>
				
				<tr>
					<th>주소:</th>
					<td><input type="text" name="address"></td>
				</tr>
				
				<tr>
					<th>호텔 썸네일:</th>
					<td><input type="file" value="호텔 리스트에 쓸 이미지 추가" id="hotelImg" class="btn btn-warning" name="f1"></td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center;"><input type="button" value="호텔 등록" id="insert" class="btn btn-primary"></td>
			</table>
		</form>
	</div>
	
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>