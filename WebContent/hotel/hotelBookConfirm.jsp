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
<script type="text/javascript">
	$(function(){
		var cCheck = false;
		var eCheck = false;	
		
		$("#cash_receipt").change(function() {
			if ($(this).val() == "no") {
				$("#cr_input").html("");
			} else if ($(this).val() == "1") {
				$("#cr_input").html('개인소득공제용 : 휴대전화번호 <input type="text" class="essential" name="cr_input"> ("-"생략)');
			} else if ($(this).val() == "2") {
				$("#cr_input").html('사업자지출증빙용 : 사업자등록번호 <input type="text" class="essential" name="cr_input"> ("-"생략)');
			}
		});
		
		$("#book").click(function() {
			$(".essential").change(function() {
				eCheck = false;
				var dname=$("#dname").val();
				var bank=$("#bank").val();
				if (bank == "" || dname=="") {
					eCheck = false;
				} else {
					eCheck = true;
				}
			});
			
			if(eCheck==false){
				alert("모든 필수 입력 사항을 입력 해주세요.");
			} else {
				document.frm.submit();
			}
		});
		
		$(".essential").change(function() {
			if ($(this).val() != "") {
				eCheck = true;
			} else {
				eCheck = false;
			}
		});
	});
	
</script>
<style type="text/css">
section {
	margin: 0;
	margin-top: -95px;
	width: 100%;
}

h3{
	margin: 0px;
}

table.menu {
	height: 100px;
	margin: 20px auto;
	margin-left: 2%;
}

table.select{
	float: left;
	margin: 20px auto;
	margin-left: 2%;
}

.position {
	width: 1000px;
	
}

.formInfo{
	width: 1020px;
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

select {
	width: 100px;
}
.agreeWrap {
	background-color: white;
	height: 280px;
	overflow-y: scroll;
	margin: 20px 0;
}
.btn{
	width: 150px;
	margin: 0 auto;
}

#innerTable{
	border-collapse: collapse;
	border-bottom: gray 1px solid;
	border-top: gray 1px solid;
	width: 500px;
	margin: 0 auto;
}

#innerTable tr:first-child{
	background-color: #f2f2f2
}
.indent {
	text-indent: 20px;
}

.button {
	text-align: center;
}

.noBMargin{
	margin-top: 95px;
	margin-bottom: 0px;
}
.noTMargin{
	margin-top: 0%;
}
</style>
<script>
	$(function() {
		$("#book_cancel").click(function() {
			location.href="./hotelList.hotel?location=1";
		});
		
	});
</script>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<div class="bBar">
		<div class="position noBMargin">
			<a href="../index.jsp">HOME</a> > <a href="./hotelList.hotel">호텔</a> > 호텔 예약
		</div>
		</div>
		<div class="wBar">
		<div class="position noTMargin">
			<p class="title">호텔 예약</p>
		</div>
		</div>
		<div class="formInfo position">
		<form action="./hotelBookSuccess.hotel" name="frm" id="frm" method="post">
			<div class="position">
				<div class="position titleBox">
					<h3>예약 내역 확인</h3>
				</div>
				<br>
				<p style="color:rgb(0,174,240);">아래 예약 내역을 확인 하시고 [예약하기]버튼을 클릭하여 예약요청을 완료 하시기 바랍니다.</p>
				<br>
				<div class="position titleBox">
					<h3>예약 내역</h3>
				</div>
				<table>
					<colgroup>
						<col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="35%">
					</colgroup>
					<tr>
						<td><strong>호텔명</strong></td>
						<td>
							${hname}
						</td>
					</tr>				
					<tr>
						<td><strong>체크인/아웃</strong></td>
						<td style="color:red">
							${sDate} ~ ${lDate}
							<input type="hidden" name="sDate" value="${sDate}">
							<input type="hidden" name="lDate" value="${lDate}">
						</td>
					</tr>
					<tr>
						<td><strong>룸타입/인원수</strong></td>
						<td>${room.roomtype} / ${room.pnum}
						<input type="hidden" name="gnum" value="${room.num}">
						<input type="hidden" name="goods" value="${room.goods}">
						<input type="hidden" name="pnum" value="1"></td>
					</tr>
					<tr>
						<td><strong>객실 이용자</strong></td>
						<td>
						<table id="innerTable">
							<tr>
								<td>성별</td><td>한글명</td><td>영문성</td><td>영문명</td><td>요금</td>
							</tr>
							<tr>
								<td>${gender}</td><td>${name}</td><td>${engSeong}</td><td>${engName}</td><td style="color:rgb(0,174,240);">${won}</td>
							</tr>
						</table></td>
					</tr>
				</table>
				<br>
				<br>
				<div class="position titleBox">
					<h3>추가 요청 사항</h3>
				</div>
				<p>
					${require }
				</p>
				<br>			
		</div>
		
		<div class="position">
				<div class="position titleBox">
					<h3>결제 정보</h3>
				</div>
				<table>
					<colgroup>
						<col width="15%">
						<col width="85%">
					</colgroup>			
					<tr>
						<td scope="row">원화결제금액</td>
						<td>
							<span style="color: red;" class="price">￦${won}</span>
							<input type="hidden" name="won" id="won" value="${won}">
						</td>
					</tr>
					<tr>
						<td>*전용계좌발급</td>
						<td>
							<div style="margin-left:2px;">은행선택
								<select name="bank" class="essential" id="bank" style="width: 150px; visibility: visible;">
									<option value="" selected="selected">선택</option>
									<option value="ibk">기업은행</option>
									<option value="kb">국민은행</option>
									<option value="keb">외환은행</option>
									<option value="suhyup">수협은행</option>
									<option value="nonghyup">농협중앙회</option>
									<option value="shinhan">신한은행</option>
									<option value="woori">우리은행</option>
								</select>
								 입금자명 <input type="text" name="dname" class="essential" id="dname" style="width:150px;">
							</div>
						</td>
					</tr>
					<tr>
						<td scope="row">* 현금영수증</td>
							<td>
								<div style="margin-left:2px;">
									<select id="cash_receipt" name="cash_receipt" class="essential" style="visibility: visible; width: 160px;">
										<option value="no" selected="selected">미발행</option>
										<option value="1">발행 - 개인소득공제용</option>
										<option value="2">발행 - 사업자지출증빙용</option>
									</select>
									<span id="cr_input">
										
									</span>
								</div>
							</td>
						</tr>
					<tr>
					<tr>
						<td colspan="2" style="border-width:1px 0 1px 0;">
							<ul style="padding:12px 15px 12px 25px; margin-top:10px;font-size:11px">
								<li style="color:red;">예약 접수 후 안내되는 전용 계좌로 24시간 이내에 상기 원화결제금액을 결제하여야만 예약이 진행됩니다. (미 입금 시 자동 취소)&nbsp;예약이 불가능할 때에는 전액 환불 됩니다.</li>
							</ul>
						</td>
					</tr>
				</table>
			</div>
			<div class="position" style="border: 1px solid rgb(0,174,240); padding: 20px;">
				<table>
					<tr>
						<td><strong>총 결제 예정 금액</strong></td>
						<td><strong style="color: rgb(0,174,240); font-size: 23px;">￦${won}</strong></td>
					</tr>
				</table>
			</div>
		</form>
		</div>
			<div class="position button">
				<input type="button" id="book" class="btn btn-warning" value="예약완료">
				<input type="button" id="book_cancel" class="btn btn-default" value="취소하기">
				<!-- 오빠 이거 가운데로 좀.. -->
			</div>
		
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>