<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
td {
	width: 220px;
	text-align: center;
	padding: 10px 20px 10px 20px;
}
#lSearch{
	width: 20px;
	float: left;
	height: 20px;
}
#icon{
	padding: 0px;
}

.formInfo{
	width: 1020px;
}

h3{
	margin: 0;
}

</style>
<script>
	$(function() {
		
		var today = new Date();
		var y = today.getFullYear();
		var m = today.getMonth() + 1;
		if (m < 10) {
			m = "0" + m;
		}
		var d = today.getDate() + 1;
		if (d < 10) {
			d = "0" + d;
		}
		
		$("#departure_date").attr("min", y+"-"+m+"-"+d);
		$("#arrival_date").attr("min", y+"-"+m+"-"+d);
		
		$("#departure_date").change(function() {
			$("#arrival_date").attr("min", $("#departure_date").val());
			
		});
		
		$("#click1").click(function() {
			$("#show1").html("귀국 날짜");
			$("#show2").html('<input type="date" id="arrival_date" class="form-control" name="adate"><input type="hidden" value="0" name="way">');
			$("#departure_date").attr("min", y+"-"+m+"-"+d);
			$("#arrival_date").attr("min", y+"-"+m+"-"+d);
			
			$("#departure_date").change(function() {
				$("#arrival_date").attr("min", $("#departure_date").val());
				
			});
		});
		
		$("#click2").click(function() {
			$("#show1").html("");
			$("#show2").html('<input type="hidden" value="1" name="way">');
			$("#departure_date").attr("min", y+"-"+m+"-"+d);
			$("#arrival_date").attr("min", y+"-"+m+"-"+d);
			
			$("#departure_date").change(function() {
				$("#arrival_date").attr("min", $("#departure_date").val());
				
			});
		});
		
		
		$("#acity").on("focus","#search",function(){
			window.open("./acityNation.flight", "acity", "width=450, height=400, left=750, top=300");
		});
		
		$("#lSearch").click(function(){
			window.open("./acityNation.flight", "acity", "width=450, height=400, left=750, top=300");
		});
		
		var acity=false;
		var dcity=false;
		var adate=false;
		var ddate=false;
		var pcheck=false;
		var check=false;
		$("#sub").click(function(){
			if(document.frm.dcity.value==''){
				dcity=false;
			}else{
				dcity=true;
			}
			if($("#search").val()==''){
				acity=false;
			}else{
				acity=true;
			}
			if($("#departure_date").val()==''){
				ddate=false;
			}else{
				ddate=true;
			}
			if($("#arrival_date").val()==''){
				adate=false;
			}else{
				adate=true;
			}
			if($("#pnum").val()==''){
				pcheck=false;
			}else{
				pcheck=true;
			}
			
			if(dcity==false){
				alert("출발 도시를 선택해주세요.");
			}else if(acity==false){
				alert("도착 도시를 선택해주세요.");
			}else if(ddate==false){
				alert("출국 날짜를 선택해주세요.");
			}else if(adate==false){
				alert("귀국 날짜를 선택해주세요.");
			}else if(pcheck==false){
				alert("인원수를 입력해주세요.");
			}else{
				check=true;
			}
			
			if(check){
				document.frm.submit();
			}
			
		});
	});
</script>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<nav class="col-sm-3" id="myScrollspy">
			<ul class="nav nav-pills nav-stacked">
				<li><a href="./mainFlight.jsp">항공권 검색</a></li>
				<li><a href="./flightInfo.jsp">항공 안내</a></li>
			</ul>
		</nav>
		
		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 항공 > 항공권 검색
			</div>
		</div>
		
		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">항공권 검색</p>
			</div>
		</div>

		<div class="position formInfo">
		<form action="flightList.flight" method="post" name="frm">
			<table>
				<tr>
					<td colspan="2"><div class="btn-group">
						<input type="button" id="click1" class="btn btn-primary" value="왕복">
						<input type="button" id="click2" class="btn btn-primary" value="편도">
						<input type="number" id="select" hidden="hidden" value="1">
					</div></td>
				</tr>
				<tr>
					<td>출발도시</td>
					<td>도착도시</td>
				</tr>
				<tr>
					<td>
						<select id="loc1" class="form-control" name="dcity">
							<option value="" selected>선택</option>
							<option value="52">인천</option>
							<option value="53">김포</option>
						</select>
					</td>
					<td id="acity"><input type="text" class="form-control" id="search">
					</td>
					<td id="icon">
						<img src="../resources/img/search.png" id="lSearch">
					</td>
				</tr>
				<tr>
					<td>출국 날짜</td>
					<td id="show1">
						귀국 날짜
					</td>
				</tr>
				<tr>
					<td><input type="date" id="departure_date" class="form-control" name="ddate"></td>
					<td id="show2">
						<input type="date" id="arrival_date" class="form-control" name="adate">
						<input type="hidden" value="0" name="way">
					</td>
				</tr>
				<tr>
					<td>인원수</td>
					<td>선호하는 항공</td>
				</tr>
				<tr>
					<td>
						<select class="form-control" name="pnum" id="pnum">
							<option value="" selected>선택</option>
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
							<option value="4">4명</option>
							<option value="5">5명</option>
						</select>
					</td>
					<td><input type="radio" name="company" value="대한항공"><img src="${pageContext.request.contextPath}/resources/img/air/대한항공.gif">&nbsp;&nbsp;&nbsp;
					<input type="radio" name="company" value="아시아나항공"><img src="${pageContext.request.contextPath}/resources/img/air/아시아나.gif">&nbsp;&nbsp;&nbsp;
					<input type="radio" name="company" value="진에어"><img src="${pageContext.request.contextPath}/resources/img/air/진에어.gif">&nbsp;&nbsp;&nbsp;
					<input type="radio" name="company" value="티웨이"><img src="${pageContext.request.contextPath}/resources/img/air/티웨이.gif"></td>
				</tr>
				<tr>
					<td colspan="2"><input id="sub" type="button" class="btn btn-success" value="검색"></td>
				</tr>
			</table>
			</form>
			<div>
				
			</div>
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>