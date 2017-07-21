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
			location.href="./hotelModForm.hotel?num=${hotel.num}";
		});
		
		$(".foreign").click(function(){
			var engnation=$(this).attr("id");
			$.post("./hotelForeign.hotel",{
				engnation:engnation
			},function(data){
				$("."+engnation).html(data);
			});
		});
		
		$("#del").click(function(){
			location.href="./hotelDelete.hotel?num=${hotel.num}&pnum=${hotel.fnum}&img=${hotel.img}";
		});
		
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
			$("#return_date").attr("min", $("#pickup_date").val());
		});
		
		
		$("#search").click(function(){
			$.post("../room/roomList.room",{
				pDate:$("#pickup_date").val(),
				rDate:$("#return_date").val(),
				hnum:$("#hnum").val()
			},function(data){
				$("#roomTable").html(data);
			});
		});
		
		
		$("#roomTable").on("click",".book",function(){
			var rDate=$("#return_date").val();
			var pDate=$("#pickup_date").val();
			var rnum=$(this).attr("id");
			var totalPrice=$(this).attr("name");
			if(rDate!="" && pDate!=""){
				location.href="./hotelBook.hotel?rnum="+rnum+"&num=${hotel.num}&totalPrice="+totalPrice+"&location=${location.num}"+"&pDate="+$("#pickup_date").val()+"&rDate="+$("#return_date").val();	
			}else{
				alert("체크인/체크아웃 날짜를 지정해주세요.");
			}
		});
		
	});
</script>
<style type="text/css">
h2{
	color:white;
}

table.notice {
	width: 500px;
	margin-left: 2%;
	margin-top: 5%;
}

table.search {
	width: 500px;
	margin: 0px auto;
	float: none;
}

.formInfo{
	width: 1020px;
}

.line{
	background-color: rgb(44,65,98);
	color: white;
	font-weight: bold
}


.photo {
	width: 400px;
	margin: 0px auto;
	margin-right: 10px;
	overflow: hidden;
	float: left;
}

tr.top {
	font-weight: bold;
	background-color: #00cc99;
}

td {
	font-size: 14px;
	text-align: center;
	padding: 10px 20px 10px 20px;
}

.carousel-inner > .item > img, .carousel-inner > .item > a > img {
	width: 100%;
	height: 172pt;
	margin: auto;
}

.btn{
	background-color: rgb(255,192,0);
	color: white;
}

.full{
	width: 100%;
}
#search{
	background-color: rgb(0,174,240);
}

#roomTable{
	width: 100%;
}
#roomTable > tr:nth-child(even){
	background-color:rgb(244,244,244);
}
</style>
</head>
<body>
	<input type="hidden" value="${hotel.num}" id="hnum">
	<%@ include file="/sub/temp/header.jspf" %>

	<section>
		<!-- 왼쪽 사이드바 -->
		<nav class="col-sm-3" id="myScrollspy">
			<ul class="nav nav-pills nav-stacked">
				<li><h2>일본 호텔</h2></li>
				<c:forEach items="${japanList}" var="j">
					<li><a href="hotelList.hotel?location=${j.num}">${j.region}</a></li>
				</c:forEach>

				<li><h2>해외 호텔</h2></li>
				<c:forEach items="${foreignList}" var="f">
					<li><a class="foreign" id="${f.engNation}">${f.nation}</a></li>
					<span class="${f.engNation}"></span>
				</c:forEach>
			</ul>
		</nav>

		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 
				<a href="hotelList.hotel">호텔</a> > ${hotel.name}
			</div>
		</div>
		
		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">${hotel.name}</p>
			</div>
		</div>
		
		<div class="position formInfo">
			<!-- 호텔 정보 -->
			<!-- 업로드한 호텔(객실) 사진 -->
			<div class="photo">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img alt="" src="../hotelImg/${hotel.img}">
						</div>
						<c:forEach items="${fileList}" var="f">
							<div class="item">
								<img class="img-thumbnail" alt="" src="../upload/${f.fsname}">
							</div>
						</c:forEach>
					</div>
					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>

			<table class="notice">
				<tr>
					<td><strong>총 객실수</strong></td>
					<td>${hotel.gnum }</td>
				</tr>
				
				<tr>
					<td><strong>위치</strong></td>
					<td>${location.nation}>${location.region}</td>
				</tr>

				<tr>
					<td><strong>주소</strong></td>
					<td>${hotel.address}</td>
				</tr>
				
				<tr>
					<td><strong>체크인/아웃</strong></td>
					<td>14:00/11:00</td>
				</tr>
				<c:if test="${sessionScope.admin!=null}">
					<!-- 관리자만 수정, 삭제 가능 -->
					<tr>
						<td colspan="2"><input type="button" class="btn btn-warning" id="mod" value="수정">
						<input type="button" class="btn btn-danger" id="del" value="삭제"></td>
					</tr>
				</c:if>
			</table>
		</div>
		
		<div class="position line">
			<h4 class="size">날짜 및 객실선택</h4>
		</div>
		
		<div class="formInfo position">
		<form>
			<div class="position">
				<table class="full">
					<tr>
						<td>체크인</td>
						<td><input type="date" name="fromDate" id="pickup_date" class="form-control"></td>

						<td>체크아웃</td>
						<td><input type="date" name="toDate" id="return_date" class="form-control"></td>
						
						<td><input type="button" value="검색" id="search" class="btn"></td>
					</tr>
				</table>	
			</div>
		</form>
		
		<div class="position">
			<!-- 이거 테이블 줄무늬로 하고 싶어요 -->
			<table id="roomTable">
				<tr>
					<td>객실</td>
					<td>수용 인원수</td>
					<td>가격</td>
					<td>예약하기</td>
				</tr>
				<c:forEach items="${roomList}" var="r">
					<% if( no % 2 == 0 ){ %>
						<tr bgcolor="#f1f1f1">
					<% }else{ %>
						<tr bgcolor="white">
					<% } %>
						<td>${r.roomtype}</td>
						<td>${r.pnum }</td>
						<td>${r.price}</td>
						<td><input type="button" value="예약하기" class="book btn" id="${r.num}" name="${r.price}"></td>
					</tr>
					<% no++; %>
				</c:forEach>
			</table>
		</div>
		
		<div class="position">
			<strong>식사정보</strong>
			<hr>
			<p>
				- 조식안내<br>
				조식가능시간 : 07:00~09:30<br>
				조식장위치 : 3층 레스토랑<br>
				조식내용 : 뷔페<br>
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
			<strong>객실 시설</strong>
			<hr>
				<p>
				- 객실비품 : TV, 냉장고, 전화, 드라이기, 전기포트, 나이트웨어, 에어컨 (슬리퍼, 차 세트)<br>
				- 대여가능한물품 : 전기 스탠드, 가습기, 바지다리미<br>
				- 욕실비품 : 칫솔, 샴푸, 린스, 바디샴푸, 면도기, 빗, 비데<br>
				</p>
				<br>
				<br>
				<br>
				<br>
			<strong>부대 시설</strong>
			<hr>
				<p>
					- 부대시설 : 편의점(5분이내), 회의실, 코인세탁기, 레스토랑<br>
					조식안내 : 일식과 웨스턴 스타일의 부페를 즐기실 수 있습니다.<br>
					<br>
					크리닝 서비스, 10~20인 이용가능한 소회의실 (1층), 마사지 서비스, 전자렌지(4층), 자동판매기, FAX & 복사서비스
				</p>
			<br>
			<strong>인터넷</strong>
			<hr>
				<p>
					전 객실 유선랜 완비. 와이파이 가능(무료 - 단 개인노트북 지참)
				</p>
			<br>
			<strong>기타</strong>
			<hr>
				<p>
					- 송영유무 : 없음(X)<br>
					-주차장<br>
					주차장유무 : 없음(X)<br>
					- 배리어프리객실(문턱이 없는 방)유무 : 있음(○)
				</p>
			<br>
			<strong>룸타입</strong>
			<hr>
			<table>
				<tr>
					<td>룸타입</td><td>룸 사이즈</td><td>베드 사이즈</td>
				</tr>
				<tr>
					<td>Standard Single</td><td>12~15㎡</td><td>105cm or 120cm (no options)</td>
				</tr>
				<tr>
					<td>Standard Semi Double</td><td>12~15㎡</td><td>105cm or 120cm (no options)</td>
				</tr>
				<tr>
					<td>Standard Double</td><td>15~21㎡</td><td>140cm</td>
				</tr>
				<tr>
					<td>Standard Twin</td><td>17~18㎡</td><td>105cm*1, 120cm*1 (no options)</td>
				</tr>
				<tr>
					<td>Standard Triple</td><td>22㎡</td><td>120cm*2 + sofa bad(90cm)</td>
				</tr>
			</table>
			<br>
			<br>
			<strong>이용 시 주의사항</strong>
			<hr>
			<p>- 상기 사진은 이미지 컷으로 내용과 다를 수 있습니다.</p>
		</div>
		</div>
	</section>

	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>