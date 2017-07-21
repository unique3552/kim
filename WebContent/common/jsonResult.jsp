<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String result = "{";
	result = result + "\"check\":\"" + request.getAttribute("check") + "\"";
	result = result + "}";
%>
<%= result %>