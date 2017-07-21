<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$("#numberChoice").change(function() {
			var number = $(this).val();
			var price = ${requestScope.ticketDTO.price};
			$("#price").html(number * price + " 원");
			$("#total").html(number * price);
			$("#pnum").val(number);
		});
		
		$("#buyBtn").click(function() {
			$.post("./ticketBook.ticket", {
				
			});
		});
	});
</script>

<ul class="choiceBox">
	<li>
		${requestScope.ticketDTO.kind}
		<div style="width: 300px;">
			<select id="numberChoice">
			<option value="0" selected="selected">인원</option>
				<c:forEach begin="1" end="20" var="number">
					<option value="${number}">${number}</option>
				</c:forEach>
			</select>
		</div>
		<div id="price" style="width: 150px;">
			0 원
		</div>
	</li>
</ul>

<form action="./ticketBook.ticket" name="frm" method="post">
	<input type="hidden" name="pnum" id="pnum">
	<input type="hidden" name="num" value="${requestScope.ticketDTO.num}">
</form>