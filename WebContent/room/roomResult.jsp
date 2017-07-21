<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% int no = 0; %>
<table>
	<tr>
		<td>객실</td>
		<td>수용 인원수</td>
		<td>가격</td>
		<td>예약하기</td>
	</tr>
	<col>
	<c:forEach items="${roomList}" var="r">
		<% if( no % 2 == 0 ){ %>
				<tr bgcolor="#f1f1f1">
		<% }else{ %>
				<tr bgcolor="white">
		<% } %>
			<td>${r.roomtype}</td>
			<td>${r.pnum }</td>
			<td>${r.price*diff}</td>
			<td><input type="button" value="예약하기" class="book btn" id="${r.num}" name="${r.price*diff}"></td>
		</tr>
		<% no++; %>
	</c:forEach>
</table>