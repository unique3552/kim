<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:forEach items="${regionList}" var="r">
		<table class="element result">
			<tr>
				<td class="resultTd"><a class="region" id="${r.num}">${r.region}</a></td>
			</tr>
		</table>
	</c:forEach>
