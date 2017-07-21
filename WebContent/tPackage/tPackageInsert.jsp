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
			if($("#tPackageImg").val()==null || $("#tPackageImg").val()==""){
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
section{
	margin-top: -30px;
}

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
	
	<nav class="col-sm-3" id="myScrollspy">
		<ul class="nav nav-pills nav-stacked">
			<li><a href="tPackageList.tPackage?nation=japan">일본</a></li>
			<li><a href="tPackageList.tPackage?nation=china">중국</a></li>
			<li><a href="tPackageList.tPackage?nation=usa">미국</a></li>
			<li><a href="tPackageList.tPackage?nation=france">프랑스</a></li>
			<li><a href="tPackageList.tPackage?nation=england">영국</a></li>
			<li><a href="tPackageList.tPackage?nation=greece">그리스</a></li>
			<li><a href="tPackageList.tPackage?nation=taiwan">대만</a></li>
			<li><a href="tPackageList.tPackage?nation=newzealand">뉴질랜드</a></li>
		</ul>
	</nav>
	
	<section>
		<div class="position">
			<a href="../index.jsp">HOME</a> > 패키지여행 > 패키지 추가
		</div>
		<div class="position">
			<h2 class="indent">패키지 추가</h2>
		</div>
		
		<div class="position">
		<form action="tPackageInsert.tPackage"  method="post" enctype="multipart/form-data" name="frm">
			<table class="menu">
				<tr>
					<th>패키지명:</th>
					<td><input type="text" name="name" class="form-control"></td>
				</tr>
				<tr>
					<th>수용 가능 인원:</th>
					<td><input type="number" name="pnum" class="form-control"></td>
				</tr>
				<tr>
					<th>가격:</th>
					<td><input type="number" name="price" class="form-control"></td>
				</tr>
				<tr>					
					<th>출발 항공 넘버:</th>
					<td><input type="number" name="dfnum" class="form-control"></td>
				</tr>
				<tr>
					<th>도착 항공 넘버:</th>
					<td><input type="number" name="afnum" class="form-control"></td>
				</tr>
				<tr>
					<th>호텔 넘버:</th>
					<td><input type="number" name="hnum" class="form-control"></td>
				</tr>
				<tr>
					<th>국가:</th>
					<td><input type="text" name="nation" class="form-control"></td>
				</tr>
				<tr>
					<th>패키지 썸네일:</th>
					<td><input type="file" value="패키지 리스트에 쓸 이미지 추가" id="tPackageImg" name="f1" class="btn btn-warning"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input type="button" value="패키지 등록" id="insert" class="btn btn-primary"></td>
				</tr>
			</table>
		</form>
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>