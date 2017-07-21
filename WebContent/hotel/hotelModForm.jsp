<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/section.css">
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/footer.css">
<%@ include file="/sub/temp/bootStrap.jspf"%>
<title>어라운드 무비</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var count = 0;
		var form = $("#uForm")[0];
		var pnum = $("#pnum").val();

		$("#fAdd").click(function() {
			if (count < 6) {
				count++;
				$("#fileInput").append('<input class="btn btn-warning" type="file" name="f'+count+'" id="f'+count+'" class="f">');
			}
		});

		$("#fDel").click(function() {
			if (count > 0) {
				$("#f" + count).remove();
				count--;
			}
		});

		$("#fResult").on("click", ".del", function() {
			var unum = $(this).attr("id");
			$.post("../file/fileDelete.file", {
				pnum : pnum,
				unum : unum
			}, function(data) {
				$("#fResult").html(data);
			});
		});

		$("#upload").click(function() {
			var formData = new FormData(form);
			$.ajax({
				method : "post",
				url : "../file/fileUpload.file",
				data : formData,
				processData : false,
				contentType : false,
				success : function(data) {
					$("#fResult").html(data);
				}
			});
		});
	});
</script>
<style type="text/css">
table.notice {
	width: 750px;
	margin-left: 0%;
}

table.search {
	width: 500px;
	margin: 0px auto;
	float: none;
}

.position {
	width: 1000px;
	margin: 10px auto;
}

tr.top {
	font-weight: bold;
}

td {
	font-size: 16px;
	text-align: center;
	padding: 10px 20px 10px 20px;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf"%>

	<section>
		<div class="position">
			<h2>호텔정보 수정</h2>
		</div>

		<div class="position">
			<form action="./hotelMod.hotel" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="num" value="${hotel.num}">

				<table class="notice">
					<tr>
						<td>호텔명</td>
						<td colspan="2"><input class="form-control" type="text" value="${hotel.name}" name="name"></td>
					</tr>

					<tr>
						<td>객실수</td>
						<td colspan="2"><input class="form-control" type="number" value="${hotel.gnum }" name="gnum"></td>
					</tr>

					<tr>
						<td>위치 번호</td>
						<td colspan="2"><input class="form-control" type="number" name="location" value="${hotel.location}"></td>
					</tr>

					<tr>
						<td>주소</td>
						<td colspan="2"><input class="form-control" type="text" name="address" value="${hotel.address}"></td>
					</tr>

					<tr>
						<td>호텔 메인사진</td>
						<!-- 수정할 파일 첨부 -->
						<td><input class="btn btn-warning" type="file" name="f1"></td>
						<td><button class="btn btn-success">수정 완료</button></td>
				</table>
			</form>

			<!-- 호텔 첨부 파일(객실 사진 등) 추가 -->
			<table class="notice">
				<tr><td>
					<div id="fResult">
						<c:forEach items="${fileList}" var="f">
							<a href="../upload/${f.fsname}">${f.oname}</a>
							<input class="btn btn-danger" type="button" value="첨부파일 삭제" id="${f.num}" class="del">
						</c:forEach>
					</div>
				</td></tr>
				
				<tr><td>
					<input class="btn btn-primary" type="button" id="fAdd" value="파일 개수 더하기">
					<input class="btn btn-danger" type="button" id="fDel" value="파일 개수 줄이기">
				</td></tr>
			</table>
			
			<form action="" id="uForm">
				<table class="notice">
					<tr><td>
						<input type="hidden" value="${hotel.fnum}" name="pnum" id="pnum">
						<div id="fileInput"></div>
					</td></tr>

					<tr><td>
						<input class="btn btn-warning" type="button" value="첨부파일 업로드" id="upload">
					</td></tr>
				</table>
			</form>
		</div>
	</section>


	<%@ include file="/sub/temp/footer.jspf"%>
</body>
</html>