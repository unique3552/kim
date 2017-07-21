<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>어라운드 무비</title>
<%@ include file="/sub/temp/bootStrap.jspf"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	$(function() {
		/* alert("gg");
		$("input:radio[name='bank']").click(function() {
			
			alert($("input:radio[name='bank']").val());
		}); */
		
		var check=false;
		
		$("#next").click(function(){
			if($(".check").is(":checked")){
				check=true;
			}else{
				check=false;
			}
			
			if(check){
				document.frm.submit();
			}else{
				alert("카드 종류를 선택 해주세요.");
			}
		});
		
		$("#cancel").click(function(){
			self.close();
		});
	});

</script>
<style type="text/css">
#card {
	width: 360px;
	height: 300px;
	margin: 20px;
}
.bank {
	width: 110px;
	margin: 10px 0;
	float: left;
}
.bank label {
	font-size: small;
}

.button {
	text-align: center;
}
</style>
</head>
<body>
	<h2>신용카드</h2>
	<form action="./memberPayCardInput.book" name="frm" method="post">
		<div id="card">
			<div class="bank">
				<input type="radio" name="bank" class="check" value="shinhan"><label>신한</label>
			</div>
			<div class="bank">
				<input type="radio" name="bank" class="check" value="samsung"><label>삼성</label>
			</div>
			<div class="bank">
				<input type="radio" name="bank" class="check" value="hana"><label>하나</label>
			</div>
			<div class="bank">
				<input type="radio" name="bank" class="check" value="keb"><label>하나(외환)</label>
			</div>
			<div class="bank">
				<input type="radio" name="bank" class="check" value="lotte"><label>롯데</label>
			</div>
			<div class="bank">
				<input type="radio" name="bank" class="check" value="kb"><label>KB국민</label>
			</div>
			<div class="bank">
				<input type="radio" name="bank" class="check" value="nonghyup"><label>NH채움</label>
			</div>
			<div class="bank">
				<input type="radio" name="bank" class="check" value="bc"><label>비씨</label>
			</div>
			<div class="bank">
				<input type="radio" name="bank" class="check" value="unionpay"><label>은련(해외카드)</label>
			</div>
			<div class="bank">
				<input type="radio" name="bank" class="check" value="woori"><label>우리</label>
			</div>
			<div>
			
			
			
			</div>
		</div>
	
		<div>
			<p>결제 금액 : ${requestScope.price} 원</p>
		</div>
		
		<input type="hidden" name="price" value="${requestScope.price}">
		<input type="hidden" name="name" value="${requestScope.name}">
		<input type="hidden" name="point" value="${requestScope.point}">
		<input type="hidden" name="num" value="${requestScope.num}">
		<input type="hidden" name="day" value="${requestScope.day}">
		<div class="button">
			<input type="button" class="btn" value="취소" id="cancel">
			<input type="button" class="btn btn-danger" id="next" value="다음단계">
		</div>
	</form>
</body>
</html>