<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
.car {
	width: 400px;
}

.bg {
	background-color: #e6e6e6;
}
</style>
<c:forEach items="${requestScope.rentCarList}" var="rentCarList">
	<table class="select car" id="${rentCarList.num}">
		<tr>
			<td colspan="4">
				<a>
					<img width="300px" height="200px" src="${pageContext.request.contextPath}/resources/img/rentCar/${rentCarList.img}">
				</a>
			</td>
		</tr>
		<tr>
			<td colspan="4">${rentCarList.name}</td>
		</tr>
		<tr>
			<td class="bg">하루 요금</td>
			<td>${requestScope.unit}${rentCarList.price}</td>
			<td class="bg">총 요금</td>
			<td>${requestScope.unit}${rentCarList.price * requestScope.diff}</td>
		</tr>
	</table>
</c:forEach>

<form action="./rentCarBook.rentCar" name="frm" method="post">

	<input type="hidden" name="pDate" value="${requestScope.pDate}">
	<input type="hidden" name="rDate" value="${requestScope.rDate}">
	<input type="hidden" name="diff" value="${requestScope.diff}">
	<input type="hidden" name="num">
</form>