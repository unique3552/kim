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
		$("#insert").click(function(){
			location.href="./hotelInsert.jsp";
		});
		
		$(".foreign").click(function(){
			var engnation=$(this).attr("id");
			$.post("./hotelForeign.hotel",{
				engnation:engnation
			},function(data){
				$("."+engnation).html(data);
			});
		});
		
		$("#search").click(function(){
			if($("#region").val()==""){
				alert("국가와 지역을 선택 해주세요.");
			}else{
				document.frm.submit();
			}
		});
		
		
		$(".go").click(function(){
			var curPage=$(this).attr("id");
			location.href="./hotelList.hotel?curPage="+curPage+"&location=${location}&name=${name}&gnum=${gnum}";
		});
		
		$("#nation").change(function() {			
			$.post("./hotelRegion.hotel", {
				nation: $("#nation").val()
			},
			function(data) {
				$("#region").html(data);
			});
		});
		
		$(".hotelView").click(function(){
			var num=$(this).attr("id");
			location.href="./hotelView.hotel?num="+num+"&location=${location}";
		});
	});
</script>
<style type="text/css">
section {
	min-height: 1500px;
}

table.notice {
	width: 600px;
	margin: 20px auto;
}

table.search {
	width: 500px;
	margin: 0px auto;
	float: none;
}

.list {
	width: 1050px;
	overflow: hidden;
}

.element {
   width: 300px;
   margin: 2%;
   
   float: left;
}

tr.top {
	font-weight: bold;
	background-color: #00cc99;
}

td {
	font-size: 16px;
	font-size: 16px;
	text-align: center;
}

.pagination {
	margin: 0px; 
}

.hotelView {
	cursor: pointer;
}

.hname{
	color: rgb(0,174,240);
}


.btnStyle {
	width: 130px;
	height: 95px;
	font-size: 20px;
	border: 1px solid gray;
	text-align: center;
	color: white;
	background-color: rgb(19,206,102);
	position: absolute;
	margin-top: 5px;
	margin-left: -80px;
}

.Bcolor {
	padding-top: 5px;
	width: 700px;
	height: 150px;
	background-color: rgb(44,65,98);
	border-radius: 3px;
}

.tbox{
	border-radius: 5px;
}

.Lcolor {
	/* border: 1px solid rgb(0,174,240); */
	background-color: white;
}

.go:HOVER {
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>

	<section>
	
	<!-- 왼쪽 사이드바 -->
	<nav class="col-sm-3" id="myScrollspy">
		<ul class="nav nav-pills nav-stacked">
			<li><h2 style="color: white;">일본 호텔</h2></li>
			<c:forEach items="${japanList}" var="j">
				<li><a href="hotelList.hotel?location=${j.num}">${j.region}</a></li>
			</c:forEach>

			<li><h2 style="color: white;">해외 호텔</h2></li>
			<c:forEach items="${foreignList}" var="f">
				<li><a class="foreign" id="${f.engNation}">${f.nation}</a></li>
				<span class="${f.engNation}"></span>
			</c:forEach>
		</ul>
	</nav>
	
	<div class="bBar">
		<div class="position noBMargin">
			<a href="../index.jsp">HOME</a> > 호텔
		</div>
	</div>
	
	<div class="wBar">
		<div class="position noTMargin">
			<p class="title">${locationDTO.region}</p>
		</div>
	</div>
	
	<div class="position Bcolor">
		<!-- 검색 기능 -->
			<form action="hotelList.hotel" name="frm">
				<table class="notice">
					<colgroup>
						<col width="20%">
						<col width="50%">
						<col width="30%">
					</colgroup>
					<tr>
						<td style="color: white">국가</td>
						<td><select class="form-control" id="nation">
								<option value="">선택</option>
								<c:forEach items="${nationList}" var="nationList">
									<option value="${nationList.engNation}">${nationList.nation}</option>
								</c:forEach>
						</select></td>
						<td rowspan="3">
							<input type="button" class="btn btn-primary btnStyle" id="search" value="검색">
						</td>
					</tr>

					<tr>
						<td style="color: white">지역</td>
						<td><select class="form-control" id="region" name="location">
								<option value="">선택</option>
						</select></td>
					</tr>

					<tr>
						<td style="color: white">호텔명</td>
						<td><input class="form-control" type="text" name="name"></td>
					</tr>
				</table>
			</form>
		</div><br>
	
		<!-- 호텔 이미지, 이름, 객실수 뿌려주는 곳 (호텔 리스트) -->
		<div class="position list">
			<c:forEach items="${hotelList}" var="h">
				<div class="tbox">
					<table class="element Lcolor">
						<tr>
							<td colspan="2"><img width="300px" height="250px" id="${h.num}" class="hotelView" alt=""	src="../hotelImg/${h.img}"></td>
						</tr>
						<tr>
							<td><strong>호텔명</strong></td>
							<td class="hname">${h.name}</td>
						</tr>
						<tr>
							<td><strong>객실수</strong></td>
							<td>${h.gnum}</td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>

		<!-- 페이징 -->
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
					
					<c:if test="${sessionScope.admin!=null}">
						<!--  관리자만 추가 가능 -->
						<td><input type="button" class="btn btn-primary" value="추가" id="insert"></td>
					</c:if>
				</tr>
			</table>
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>