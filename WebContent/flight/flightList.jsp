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
.formInfo{
	width: 1020px;
}

h3{
	margin: 0;
}

table.select{
	width: 500px;
	float: left;
	margin: 20px auto;
	margin-left: 2%;
}

h4{
	font-weight: bold;
}

.plane{
	width: 25px;
	height: 25px;
}

td {
	text-align: center;
	padding: 10px 20px 10px 20px;
}

.list{
	min-height: 200px;
}

#bar{
	height: 30px;
	padding: 5px 20px;
	background-color: rgb(0,174,240);
	border-radius: 5px;
	width: 80px;
	float:left;
}

.inBar{
	margin : 0;
	color: white;
}

.info{
	height: 30px;
}

.left{
	height: 30px;
	padding: 8px;
	float:left;
}

h5{
	margin: 0;
	font-weight: bold;
}

.button {
	text-align: center;
}

.size {
	width: 1000px;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#research").click(function(){
			location.href="./mainFlight.jsp";
		});
		
		if($(".check").val()==1){
			var dcheck=false;
			var acheck=false;
			
			$("#book").click(function(){
				if($(".departure").is(":checked")){
					dcheck=true;
				}else{
					dcheck=false;
				}
				if($(".arrival").is(":checked")){
					acheck=true;
				}else{
					acheck=false;
				}
				
				if(dcheck==false){
					alert("가는 여정을 선택해주세요.");
				}else if(acheck==false){
					alert("오는 여정을 선택해주세요.");
				}else{
					document.frm.submit();
				}
			});
		}else if($(".check").val()==0){
			var dcheck=false;
			
			$("#book").click(function(){
				if($(".departure").is(":checked")){
					dcheck=true;
				}else{
					dcheck=false;
				}

				if(dcheck==false){
					alert("여정을 선택해주세요.");
				}else{
					document.frm.submit();
				}
			});
		}
		
		$(".departure").click(function(){
			var dprice=$(this).attr("id");
			var aprice=$(".arrival:checked").attr("id");
			var pnum="${pnum}";
			if($(".arrival").is(":checked")==false){
				aprice=0;
			}
			var total=dprice*pnum*1+aprice*pnum*1;
			$("#dTotal").val(dprice*pnum*1);
			$("#aTotal").val(aprice*pnum*1);
			$("#totalPrice").text("￦ "+total);
			$("#won").val(total);
		});
		
		$(".arrival").click(function(){
			var aprice=$(this).attr("id");
			var dprice=$(".departure:checked").attr("id");
			var pnum="${pnum}";
			if($(".departure").is(":checked")==false){
				dprice=0;
			}
			var total=dprice*pnum*1+aprice*pnum*1;
			$("#dTotal").val(dprice*pnum*1);
			$("#aTotal").val(aprice*pnum*1);
			$("#totalPrice").text("￦ "+total);
			$("#won").val(total);
		});
		
		
		
	});
</script>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<nav class="col-sm-3" id="myScrollspy">
		<ul class="nav nav-pills nav-stacked">
			<li><a href="./mainFlight.jsp">항공권 검색</a></li>
			<li><a href="./flightInfo.jsp">항공 안내</a></li>
		</ul>
	</nav>
	
	<form action="./flightBook.flight" method="post" name="frm">
	
	<section>
		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 항공 > 항공권 검색 > 항공권 예매
			</div>
		</div>
		
		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">항공권 예매</p>
			</div>
		</div>
		
		<div class="position formInfo">
		<div class="position">
			<div id="bar">
				<c:if test="${aList!=null }">	<!-- 도착 비행기 리스트가 있으면 1 -->
					<h4 class="inBar">왕복</h4>
					<input type="hidden" class="check" value="1">
				</c:if>
				<c:if test="${aList==null}">
					<h4 class="inBar">편도</h4>
					<input type="hidden" class="check" value="0">
				</c:if>
			</div>
			<c:if test="${aList!=null }">
				<div class="left">
					<h5>${ddate} &nbsp;~ &nbsp;${adate} &nbsp;&nbsp; / &nbsp;&nbsp;인원수 : <strong style="color:rgb(0,174,240);">${pnum}</strong>명</h5>
				</div>
			</c:if>
			<c:if test="${aList==null }">
				<div class="left">
					<h5>${ddate} &nbsp; / &nbsp;&nbsp;인원수 : <strong style="color:rgb(0,174,240);">${pnum}</strong>명</h5>
				</div>
			</c:if>
		</div>

		<div class="position list">
		<h4><img src="../resources/img/paper-plane.png" class="plane">&nbsp;구간 1 : ${dLocation.region} - ${aLocation.region} </h4>
			<table class="select table table-hover">
				<thead>
					<tr>
						<td>항공사</td>
						<td>편명</td>
						<td>출발시간</td>
						<td>도착시간</td>
						<td>정규운임</td>
						<td>선택</td>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${dList}" var="d">
						<tr>
							<td>${d.company}</td>
							<td>${d.name }</td>
							<td>${d.dtime }</td>
							<td>${d.atime }</td>
							<td style="color: rgb(0,174,240);">￦${d.price }</td>
							<td><input type="radio" class="departure" name="dnum" value="${d.num}" id="${d.price}"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<c:if test="${aList!=null}">
			<div class="position list">	
			<h4><img src="../resources/img/paper-plane.png" class="plane">&nbsp;구간 2 : ${aLocation.region} - ${dLocation.region} </h4>
				<table class="select table table-hover">
					<thead>
						<tr>
							<td>항공사</td>
							<td>편명</td>
							<td>출발시간</td>
							<td>도착시간</td>
							<td>정규운임</td>
							<td>선택</td>
						</tr>
					</thead>
	
					<tbody>
						<c:forEach items="${aList}" var="a">
							<tr>
								<td>${a.company}</td>
								<td>${a.name }</td>
								<td>${a.dtime }</td>
								<td>${a.atime }</td>
								<td style="color: rgb(0,174,240);">￦${a.price }</td>
								<td><input type="radio" class="arrival" name="anum" value="${a.num}" id="${a.price}"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
		<div class="position">
			<p>
				- 할인율은 실시간 변동되오니 이점 유념하여 주시기 바랍니다.<br>
				- 항공권 구입 시에는 예약과 동시 구매하셔야 하며, 미 구매된 예약은 자동 취소됩니다.<br>
				- 소아/유아의 나이 구분은 여행일(탑승일) 기준이며, 탑승 수속시 나이를 확인할 수 있는 서류를 반드시 지참하시기 바랍니다.<br>
				- 운임은 출발지 국가의 통화로 책정되며, 결제시에는 해당 환율이 적용됩니다. (일부국가 제외) <br>
				- 출·도착 시각은 현지 시각 기준이며 항공기 스케줄은 정부인가 조건으로, 예고 없이 변경 될 수 있습니다.	
			</p>
		</div>
		
		<div class="position" style="border: 2px solid rgb(0,174,240); padding: 20px;">
			<table>
				<tr>
					<td><strong>항공운임 등 총액</strong></td>
					<td><strong style="color: rgb(0,174,240); font-size: 23px;" id="totalPrice">￦ 0</strong>
					<input type="hidden" name="dTotal" id="dTotal" value="0">
					<input type="hidden" name="aTotal" id="aTotal" value="0">
					<input type="hidden" name="won" id="won" value="0"></td>
				</tr>
			</table>
		</div>
		</div>
		<input type="hidden" name="pnum" value="${pnum}">
		<input type="hidden" name="sdate" value="${ddate}">
		<input type="hidden" name="ldate" value="${adate}">
		<input type="hidden" name="dloc" value="${dLocation.num}">
		<input type="hidden" name="aloc" value="${aLocation.num}">
		<div class="position button">
			<input type="button" class="btn btn-primary" value="구간 및 운임 선택 완료" id="book">&nbsp;<input type="button" class="btn btn-warning" value="재검색" id="research">
		</div>
	</section>
	
	</form>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>