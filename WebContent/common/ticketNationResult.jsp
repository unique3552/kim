<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="nav">
<c:forEach items="${requestScope.nation}" var="ar">
	<li><a href="./ticketList.ticket?location=${ar.num}&curPage=1" style="color: white;">- ${ar.nation}</a></li>
</c:forEach>
</ul>