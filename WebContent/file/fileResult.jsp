<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${fileList}" var="f">
		<a href="../upload/${f.fsname}">${f.oname}</a>
		<input type="button" value="첨부파일 삭제" id="${f.num}" class="del">
</c:forEach>