<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% int no = 0; %>
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
	$(function() {
		$("#mod").click(function(){
			location.href="./tPackageModForm.tPackage?num=${tPackage.num}";
		});
		
		$("#del").click(function(){
			location.href="./tPackageDelete.tPackage?num=${tPackage.num}&pnum=${tPackage.fnum}&img=${tPackage.img}";
		});
		
		$("#pnum").change(function(){
			var p=$(this).val();
			var oprice="${tPackage.price}";
			$("#price").text("￦ "+p*1*oprice*1);
		});
		
		month_days=new Array('31','28','31','30','31','30','31','31','30','31','30','31');
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

		$("#pickup_date").attr("min", y + "-" + m + "-" + d);
		$("#return_date").attr("min", y + "-" + m + "-" + d);

		$("#pickup_date").change(function() {
			var pdate=$("#pickup_date").val();
			var da = pdate.substring(8,10);
			da=eval(parseInt(da)+parseInt(3));	// 일수를 3일 뒤로 변경

			var month=today.getMonth();
		      if(da>month_days[month]){ //날짜가 33일이런식으로 정의된 일자보다 길다면
		       da-=month_days[month]; //날짜감소
		       month+=1;	// 월 증가
		      }
		      month++;
		      if (month < 10) {
					month = "0" + month;
				}
		     	if (da < 10) {
					da = "0" + da;
				}
		      
			$("#return_date").val(y + "-" + month + "-" + da);
		});
		
		var dcheck=false;
		var pcheck=false;
		$("#book").click(function(){
			if($("#pickup_date").val()==''){
				dcheck=false;
			}else{
				dcheck=true;
			}
			if($("#pnum").val()==''){
				pcheck=false;
			}else{
				pcheck=true;
			}
			
			if(dcheck==false){
				alert('출발 날짜를 선택해주세요.');
			}else if(pcheck==false){
				alert('인원수를 선택해주세요.');
			}else{
				document.frm.submit();
			}
			
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
	margin-left: 2%;
	width: 560px;
	margin-top: 10%;
}

table.search {
	width: 500px;
	margin: 0px auto;
	float: none;
}


.line{
	border: 2px solid black;
	background-color: rgb(44,65,98);
	color: white;
	font-weight: bold
}

.photo {
	width: 440px;
	margin: 0px auto;

	overflow: hidden;
	float: left;
}

tr.top {
	font-weight: bold;
	background-color: #00cc99;
}

td {
	font-size: 13px;
	text-align: center;
	padding: 10px 5px;
}

.carousel-inner > .item > img, .carousel-inner > .item > a > img {
	width: 80%;
	height: 200pt;
	margin: auto;
}

.btn{
	background-color: rgb(255,192,0);
	color: white;
}


.blue{
	color: rgb(0,174,240);
}

#roomTable > tr:nth-child(even){
	background-color:rgb(244,244,244);
}

.upload{
	width: 85%;
}

#innerTB{
	background-color: #f2f2f2;
	width: 380px;
	font-size: 15px;
}

.thumb {
	width: 400px;
	height: 300px;
}

#book{
	font-weight: bold;
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
		<div class="bBar">
			<div class="position noBMargin">
			<a href="../index.jsp">HOME</a> > 패키지여행
		</div>
		</div>
		
		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">${tPackage.name}</p>
			</div>
		</div>
		
	<div class="position formInfo">
	<form action="./tPackageBook.tPackage" method="post" name="frm">
		<input type="hidden" name="num" value="${tPackage.num}">
		<div class="position">
			<div class="photo">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<table id="innerTB">
								<tr>
									<td colspan="4" class="img"><img class="thumb" alt="" src="../tPackageImg/${tPackage.img}"></td>
								</tr>
								<tr>
									<td>문의 및 예약 담당자 : </td><td><strong>${admin.name}</strong></td>
									<td>전화 : </td><td>${admin.phone}</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 패키지 정보 -->
			<table class="notice">

				<tr>
					<td><strong>교통편</strong></td><td>${dFlight.company}</td>
					<td><strong>호텔</strong></td><td>${hotel.name}</td>
				</tr>

				<tr>
					<td><strong>출발</strong></td><td><input type="date" class="form-control" id="pickup_date" name="sDate"></td>
					<td><strong>도착</strong></td><td><input type="date" class="form-control" readonly="readonly" id="return_date" name="lDate"></td>
				</tr>
				
				<tr>
					<td><strong>인원</strong></td>
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
					<td><strong>수용 인원</strong></td><td>${tPackage.pnum}</td>
				</tr>
				<tr>
					<td colspan="4"><strong id="price" style="color: rgb(0,174,240); font-size: 23px;">￦ ${tPackage.price}</strong></td>
				</tr>
				<tr>
					<td colspan="4"><input type="button" class="btn" value="예약하기" id="book"></td>
				</tr>
				
				<c:if test="${sessionScope.admin!=null}">
					<!-- 관리자만 수정, 삭제 가능 -->
					<tr>
						<td colspan="4"><input type="button" class="btn" id="mod" value="수정">
						<input type="button" class="btn" id="del" value="삭제"></td>
					</tr>
				</c:if>
			</table>
		</div>
		
		<div class="position line">
			<h4>상품 정보</h4>
		</div>
		
		<div class="position">
			<strong>호텔 정보</strong>
			<hr>
			<p>
				- 조식안내<br>
				조식가능시간 : 07:00~09:30<br>
				조식장위치 : 3층 레스토랑<br>
				조식내용 : 뷔페<br>
				- 호텔 위치<br>
				${hotel.address}<br>
				- 객실 수<br>
				${hotel.gnum}
			</p>
			<br>
			<strong>추가 & 현지요금안내</strong>
			<hr>
			<table>
				<tr>
					<td>구분</td><td>나이</td><td>추가금</td><td>메모</td>
				</tr>
				<tr>
					<td>추가시요금</td><td>0~9</td><td>0</td><td>동반 투숙 어린이 무료</td>
				</tr>
			</table>
			<br>
			<strong>교통편 안내</strong>
			<hr>
			<table>
				<tr>
					<td></td><td><strong class="blue">출발편</strong></td><td><strong class="blue">도착편</strong></td>
				</tr>
				<tr>
					<td><strong class="blue">항공사</strong></td><td>${dFlight.company}</td><td>${aFlight.company}</td>
				</tr>
				<tr>
					<td><strong class="blue">출발시간</strong></td><td>${dFlight.dtime}</td><td>${aFlight.dtime}</td>
				</tr>
				<tr>
					<td><strong class="blue">도착시간</strong></td><td>${dFlight.atime}</td><td>${aFlight.atime}</td>
				</tr>
			</table>
			<br>
			<strong>참고 자료</strong>
			<hr>
			<div>
				<c:forEach items="${fileList}" var="f">
					<img src="../upload/${f.fsname}" class="upload">
					<br>
					<br>
				</c:forEach>
			</div>
			<br>
			<br>
			<strong>이용 시 주의사항</strong>
			<hr>
			<p>- 상기 사진은 이미지 컷으로 내용과 다를 수 있습니다.</p>
			<br>
			<br>
			<strong>준비물</strong>
			<hr>
			<p>
				① 여권의 만료기간 3개월 이상과 여권의 종류를 다시 한번 확인 부탁드립니다.<br>
				- 일본은 3개월까지 무비자 관광 입국 가능 국가 입니다.<br>
				- 단수여권(PS)인지 복수여권(PM)인지 다시 한번 확인 해주세요.<br>
				- 단수여권인 경우 해외여행 경험이 있으신 분은 새로 발급 받으셔야 합니다.<br>
				- 관용여권(PO)의 경우 여행시 출국 가능한지 직접 확인 하셔야 합니다.<br>
				- 여권으로 인한 문제 발생시, 어라운드 무비에서는 책임지지 않습니다.<br>
				② 환전 - : 개인간식비, 개인쇼핑등의 개인 지출용<br>
				③ 갈아입을 여벌 옷<br>
				④ 110V 플러그 - 개인적으로 카메라등 충전하실분<br>
				⑤ 여권분실 대비 - 여권사본, 여권용 사진 2장 준비<br>
				⑥ 기타 - 카메라, 개인 비상약 (소화제/지사제/멀미약/두통약등), 작은 우산등<br>
				※숙박지에 기본적인 세면도구, 수건, 드라이어기등은 있습니다.(노천온천 이용시 수영복 필요없음)<br>
			</p>
			<br>
			<br>
		</div>
	</form>
	</div>
	</section>

	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>