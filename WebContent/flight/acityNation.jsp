<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<%@ include file="/sub/temp/bootStrap.jspf" %>
<style>
	body{
		font-family:NanumGothic,’나눔고딕’,ng,sans-serif;
	}
</style>
<title>주요 도시 리스트</title>
<script type="text/javascript">
	$(function(){
		$(".nation").click(function(){
			var engNation=$(this).attr("id");
			$.post("./acityRegion.flight",{
				engNation:engNation
			},function(data){
				$("#result").html(data);
			});
		});
		$("#result").on("click",".region",function(){
			var num=$(this).attr("id");
			var region=$(this).text();
			var acity=window.opener.$("#acity");
			acity.html('<input type="text" class="form-control" value="'+region+'" id="search"><input type="hidden" name="acity" value="'+num+'">');
			window.close();
		});
	});
</script>
<style>
	body{
		background-color: #f0f0f0;
	}
	.position{
		width: 378px;
		background-color: white;
		border: none;
		padding: 5px;
	}
	.element {
	   width: 92px;
	   height: 30px;
	   border-bottom: 0.1px solid #66c2ff;
	   border-right:0.1px solid #66c2ff;
	   float: left;
	}
	td{
		text-align: center;
		background-color: rgb(0,174,240);
		vertical-align: middle;
	}
	.list{
		height: 130px;
	}
	h4{
		font-weight: bold;
		color:rgb(44,65,98);
	}
	.nation{
		color: white;
		font-weight: bold;
		cursor: pointer;
	}
	.region{
		color: rgb(0,174,240);
		cursor: pointer;
	}
	#result{
		height: 68px;
	}
	.result{
		border:none;
	}
	.resultTd{
		text-align: center;
		background-color: white;
		vertical-align: middle;
	}
</style>
</head>
<body>
	<div class="position">
		<h4>주요 도시 리스트</h4>
	</div>
	
	<div class="position list">
		<c:forEach items="${nationList}" var="n" varStatus="status">
			<table class="element">
				<tr>
					<td><a class="nation" id="${n.engNation}">${n.nation}</a></td>
				</tr>
			</table>
		</c:forEach>
	</div>
	<div class="position" id="result">
		
	</div>
</body>
</html>