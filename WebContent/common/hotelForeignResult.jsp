<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="nav">
<c:forEach items="${regionList}" var="r">
	<li><a href="hotelList.hotel?location=${r.num}">- ${r.region}</a></li>
</c:forEach>
</ul>