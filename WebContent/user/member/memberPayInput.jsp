<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>어라운드 무비</title>
<%@ include file="/sub/temp/bootStrap.jspf"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var vcheck = false;
		var icheck = false;
		var ccheck = false;
		var pcheck = false;
		
		$("#valid_1").change(function() {
			if ($(this).val() != "") {
				vcheck = true;
			} else {
				vcheck = false;
			}
		});
		
		$("#valid_2").change(function() {
			if ($(this).val() != "") {
				vcheck = true;
			} else {
				vcheck = false;
			}
		});
		
		$("#id_num_1").change(function() {
			if ($(this).val() != "") {
				icheck = true;
			} else {
				icheck = false;
			}
		});
		
		$("#id_num_2").change(function() {
			if ($(this).val() != "") {
				icheck = true;
			} else {
				icheck = false;
			}
		});
		
		$("#card").change(function() {
			if ($(this).val() != "") {
				ccheck = true;
			} else {
				ccheck = false;
			}
		});
		
		$("#password").change(function() {
			if ($(this).val() != "") {
				pcheck = true;
			} else {
				pcheck = false;
			}
		});
		
		$("#next_btn").click(function() {
			if (vcheck == false) {
				alert("유효기간을 확인해 주세요.");
			} else if (icheck == false) {
				alert("주민등록번호를 확인해 주세요.");
			} else if (ccheck == false) {
				alert("카드고유확인번호를 확인해 주세요.");
			} else if (pcheck == false) {
				alert("카드비밀번호를 확인해 주세요.");
			} else {
				alert("결제완료");
				opener.name = "paySuccess";
				document.frm.target = opener.name;
				document.frm.action = "./memberPaySuccess.book";
				document.frm.submit();
				window.close();
			}
		});
		
		$("#cancel").click(function(){
			self.close();
		});
	});
</script>
<style type="text/css">
span {
	font-size: small;
	margin: 20px 10px;
}
#wrap {
	margin: 20px 10px;
	width: 360px;
	height: 200px;		
}
table {
	font-size: 15px;
}
.button {
	text-align: center;
}
</style>
</head>
<body>
	<h2>신용카드</h2>
	<span>*본인 확인을 위해 정확한 정보를 입력하여 주시기 바랍니다.</span>
	<div id="wrap">
		<table>
			<tr>
				<td>카드번호</td>
				<td>****-****-****-****</td>
			</tr>
			<tr>
				<td>유효기간</td>
				<td>(YYYY/MM) <input type="text" value="" id="valid_1" style="width: 50px;">년 <input type="text" value="" id="valid_2" style="width: 50px;">월</td>
			</tr>
			<tr>
				<td>주민등록번호</td>
				<td><input type="text" value="" id="id_num_1" style="width: 60px;"> - <input type="password" value="" id="id_num_2" style="width: 70px;"></td>
			</tr>
			<tr>
				<td>카드고유확인번호</td>
				<td><input type="password" value="" id="card" style="width: 50px;"> 뒷면 뒤 3자리</td>
			</tr>
			<tr>
				<td>카드비밀번호</td>
				<td><input type="password" value="" id="password" style="width: 50px;"> 4자리</td>
			</tr>
		</table>
	</div>
	
	<form method="post" name="frm">
		<div>
			<input type="hidden" name="price" value="${requestScope.price}">
			<input type="hidden" name="point" value="${requestScope.point}">
			<input type="hidden" name="name" value="${requestScope.name}">
			<input type="hidden" name="bank" value="${requestScope.bank}">
			<input type="hidden" name="num" value="${requestScope.num}">
			<input type="hidden" name="day" value="${requestScope.day}">
			<div class="button">
				<input type="button" class="btn" value="취소" id="cancel">
				<input type="button" class="btn btn-danger" id="next_btn" value="결제하기">
			</div>
		</div>
	</form>
</body>
</html>