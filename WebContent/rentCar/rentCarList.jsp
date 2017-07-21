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
<%@ include file="/sub/temp/bootStrap.jspf" %>
<title>어라운드 무비</title>
<style type="text/css">
section {
	margin-left: 0px;
	width: 100%;
}

.position {
	width: 1000px;
}

table.menu {
	height: 100px;
	margin: 20px auto;
}

table.select{
	float: left;
	margin: 20px auto;
	margin-left: 5%;
	margin-right: 5%;
}

th {
	font-size: 20px;
	font-family: 굴림체;
	font-weight: bold;
	text-align: center;
	padding: 10px 20px 10px 20px;
	vertical-align: middle;
}

td {
	text-align: center;
	padding: 10px 20px 10px 20px;
}

.searchBox{
	background-color: rgb(44,65,98);
	border-radius: 3px;
}

select {
	width: 100px;
}

#select_wrap{
	background-color: white;
}

.select {
	cursor: pointer;
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

.sWhite{
	color: white;
}

* {box-sizing:border-box}

.mySlides {display:none}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Number text (1/3 etc) */
.numbertext {
  color: black;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 13px;
  width: 13px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 2.5s;
  animation-name: fade;
  animation-duration: 2.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}

.banCover {
	width: 1015px;
	margin: 10px auto;
	overflow: hidden;
}

.banner {
	margin: 10px;
	float: left;
	background-size: 100% 100%;
	cursor: pointer;
}

.big {
	width: 445px;
	height: 250px;
	background-image: url("${pageContext.request.contextPath}/resources/img/rentCarBanner/rentBanner5.jpg");
}

.one {
	width: 245px;
	height: 250px;
	background-image: url("${pageContext.request.contextPath}/resources/img/rentCarBanner/rentBanner6.jpg");
}

.two {
	width: 245px;
	height: 250px;
	background-image: url("${pageContext.request.contextPath}/resources/img/rentCarBanner/rentBanner7.jpg");
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
		
		$("#pickup_date").attr("min", y+"-"+m+"-"+d);
		$("#return_date").attr("min", y+"-"+m+"-"+d);
		
		$("#pickup_date").change(function() {
			$("#return_date").attr("min", $("#pickup_date").val());
			
		});
		
		
		$("#choice").click(function() {
			var nation = $("#nation").val();
			var what = $("#what").val();
			if(nation != 'null' && what > 0) {
				location.href = "rentcar" + what + ".jsp?"+nation;
			}
		});		
		
		$("#nation").change(function() {			
			$.post("./rentCarRegion.rentCar", {
				nation: $("#nation").val()
			},
			function(data) {
				$("#region").html(data);
			});
		});
		
		$("#choice").click(function() {
			$.get("./rentListTable.rentCar", {
				kind: $("#kind").val(),
				region: $("#region").val(),
				pDate: $("#pickup_date").val(),
				rDate: $("#return_date").val()
			},
			function(data) {
				$("#select_wrap").html(data);
			});
		});
		
		$("#select_wrap").on("click", ".select", function() {
			document.frm.num.value = $(this).attr("id");
			document.frm.submit();
		});
		
		
		var slideIndex = 0;
		showSlides();

		function showSlides() {
		    var i;
		    var slides = document.getElementsByClassName("mySlides");
		    var dots = document.getElementsByClassName("dot");
		    for (i = 0; i < slides.length; i++) {
		       slides[i].style.display = "none";  
		    }
		    slideIndex++;
		    if (slideIndex> slides.length) {slideIndex = 1}    
		    for (i = 0; i < dots.length; i++) {
		        dots[i].className = dots[i].className.replace(" active", "");
		    }
		    slides[slideIndex-1].style.display = "block";  
		    dots[slideIndex-1].className += " active";
		    setTimeout(showSlides, 2000); // Change image every 2 seconds
		}
		
		$(".big").click(function() {
			location.href = "${pageContext.request.contextPath}/rentCar/rentCarBanner5.jsp";
		});
		$(".one").click(function() {
			location.href = "${pageContext.request.contextPath}/rentCar/rentCarBanner6.jsp";
		});
		$(".two").click(function() {
			location.href = "http://rentacar.tourbaksa.com/document/toyota_rent_guide.pdf";
		});
	});
</script>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<div class="bBar">
		<div class="position noBMargin">
			<a href="../index.jsp">HOME</a> > 렌트카
		</div>
		</div>
		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">렌트카 예약</p>
		</div>
		</div>
		<div class="position searchBox">
			<table class="menu">
				<tr>
					<td class="sWhite">국가</td>
					<td class="sWhite">도시</td>
					<td class="sWhite">차량 종류</td>
				</tr>
				<tr>
					<td>
						<select class="form-control" id="nation" style="width: 190px;">
							<option>선택</option>
							<c:forEach items="${nationList}" var="nationList">
								<option value="${nationList.engNation}">${nationList.nation}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<select class="form-control" id="region" style="width: 190px;">
							<option value="null">선택</option>
						</select>
					</td>
					<td><select class="form-control" id="kind">
							<option selected>선택</option>
							<option value="hybrid">하이브리드</option>
							<option value="car">승용차</option>
							<option value="suv">SUV</option>
					</select></td>
				</tr>
				<tr>
					<td class="sWhite">픽업 날짜</td>
					<td class="sWhite">반납 날짜</td>
					<th rowspan="2"><input id="choice" type="button" class="btn btn-success" value="예약 하기"></th>
				</tr>
				<tr>
					
					<td><input class="form-control" type="date" placeholder="픽업 날짜" id="pickup_date" min="" value=""></td>
					<td><input class="form-control" type="date" placeholder="반납 날짜" id="return_date" min=""></td>
					
				</tr>
			</table>
		</div>

		<!-- <div class="position">
			<h3>차량선택</h3>
		</div> -->

		<div class="position" id="select_wrap">
			<div class="slideshow-container">
				<div class="mySlides fade">
					<div class="numbertext">1 / 4</div>
					<a href="${pageContext.request.contextPath}/rentCar/rentCarBanner1.jsp"><img src="${pageContext.request.contextPath}/resources/img/rentCarBanner/rentBanner1.jpg" style="width: 100%"></a>
				</div>

				<div class="mySlides fade">
					<div class="numbertext">2 / 4</div>
					<a href="${pageContext.request.contextPath}/rentCar/rentCarBanner2.jsp"><img src="${pageContext.request.contextPath}/resources/img/rentCarBanner/rentBanner2.jpg" style="width: 100%"></a>
				</div>

				<div class="mySlides fade">
					<div class="numbertext">3 / 4</div>
					<a href="${pageContext.request.contextPath}/rentCar/rentCarBanner3.jsp"><img src="${pageContext.request.contextPath}/resources/img/rentCarBanner/rentBanner3.jpg" style="width: 100%"></a>
				</div>
				
				<div class="mySlides fade">
					<div class="numbertext">4 / 4</div>
					<a href="${pageContext.request.contextPath}/rentCar/rentCarBanner4.jsp"><img src="${pageContext.request.contextPath}/resources/img/rentCarBanner/rentBanner4.jpg" style="width: 100%"></a>
				</div>
			</div>
			<br>

			<div style="text-align: center">
				<span class="dot"></span>
				<span class="dot"></span>
				<span class="dot"></span>
				<span class="dot"></span>
			</div>
			
			<%-- <table class="menu">
				<tr>
					<td><a href="http://www.tourbaksa.com/Newrentacar/"><img src="${pageContext.request.contextPath}/resources/img/rentCarBanner/car.png">렌트 차량 안내</a></td>
					<td><a href="http://rentacar.tourbaksa.com/document/toyota_rent_guide.pdf"><img src="${pageContext.request.contextPath}/resources/img/rentCarBanner/insurance.png">보험 안내</a></td>
				</tr>
			</table> --%>
			<div class="banCover">
				<div class="banner big"></div>
				<div class="banner one"></div>
				<div class="banner two"></div>
				<%-- <a href="http://www.tourbaksa.com/Newrentacar/"><img src="${pageContext.request.contextPath}/resources/img/rentCarBanner/car.png">렌트 차량 안내</a><br>
				<a href="http://rentacar.tourbaksa.com/document/toyota_rent_guide.pdf"><img src="${pageContext.request.contextPath}/resources/img/rentCarBanner/insurance.png">보험 안내</a> --%>
			</div>
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>