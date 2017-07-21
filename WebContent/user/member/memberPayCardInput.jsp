<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>어라운드 무비</title>
<%@ include file="/sub/temp/bootStrap.jspf"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
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
		
		var h = today.getHours();
		if (h < 10) {
			h = "0" + h;
		}
		var min = today.getMinutes();
		if (min < 10) {
			min = "0" + min;
		}
		var s = today.getSeconds();
		if (s < 10) {
			s = "0" + s;
		}
				
		$("#pay_date").html("결제일자 : "+y+"-"+m+"-"+d+" "+h+":"+min+":"+s);
		
		var bank;
		
		if ('${requestScope.bank}' == "shinhan") {
			bank = "신한";
		} else if ('${requestScope.bank}' == ("samsung")) {
			bank = "삼성";
		} else if ('${requestScope.bank}' == ("hana")) {
			bank = "하나";
		} else if ('${requestScope.bank}' == ("keb")) {
			bank = "하나(외환)";
		} else if ('${requestScope.bank}' == ("lotte")) {
			bank = "롯데";
		} else if ('${requestScope.bank}' == ("kb")) {
			bank = "KB국민";
		} else if ('${requestScope.bank}' == ("nonghyup")) {
			bank = "NH채움";
		} else if ('${requestScope.bank}' == ("bc")) {
			bank = "비씨";
		} else if ('${requestScope.bank}' == ("unionpay")) {
			bank = "은련";
		} else if ('${requestScope.bank}' == ("woori")) {
			bank = "우리";
		}
		
		
		$("#bank").html(bank + "카드 결제");
		
		var check = false;
		$("#card_num").focus(function() {
			$(this).css("background-color", "yellow");	
		});
		
		$("#card_num").keyup(function() {
			if ($("#card_num").val() != "") {
				check = true;
			} else {
				check = false;
			}
		});		
		
		$("#next_btn").click(function() {
			if (check == false) {
				alert("카드 번호를 확인해 주세요.");
			} else {
				document.frm.submit();
			}
		});
		
		$("#cancel").click(function(){
			self.close();
		});
	});
</script>
<style type="text/css">
#wrap {
	background-color: lightgray;
	margin: 20px;
	padding: 3px 20px;
}
#bank, #card_wrap {
	margin-left: 20px;
	margin-bottom: 20px;
}
ul li {
	list-style-image: url(../../resources/img/warning.jpg)
}
.button {
	text-align: center;
}
</style>
</head>
<body>
	<h2>신용카드</h2>
	<div id="wrap">
		<p>가맹점명 : 어라운드 무비</p>
		<p>결제상품 : R${requestScope.day}-${requestScope.num}</p>
		<p>결제금액 : ${requestScope.price - requestScope.point} 원</p>
		<p id="pay_date"></p>
	</div>
		<p id="bank"></p>
		<p id="card_wrap">카드번호 : <input type="password" id="card_num" value="" placeholder="하이픈(-) 없이 16자리 입력" pattern="[0-9]{16}" required></p>
	<hr>
	
	<ul>
		<li>안전한 금융거래를 위해 유의사항을 확인 해 주세요.<br>
		<a href="">유의사항 보기 ></a></li>
		<li>아멕스 브랜드로 발급된 카드로 결제 시 카드번호 15자리로 입력해 주세요.</li>
	</ul>
	
	<form action="./memberPayInput.book" method="post" name="frm">
		<div>
			<input type="hidden" name="price" value="${requestScope.price}">
			<input type="hidden" name="point" value="${requestScope.point}">
			<input type="hidden" name="name" value="${requestScope.name}">
			<input type="hidden" name="bank" value="${requestScope.bank}">
			<input type="hidden" name="num" value="${requestScope.num}">
			<input type="hidden" name="day" value="${requestScope.day}">
			
			<div class="button">
				<input type="button" class="btn" value="취소" id="cancel">
				<input type="button" class="btn btn-danger" id="next_btn" value="다음단계">
			</div>
		</div>
	</form>
</body>
</html>