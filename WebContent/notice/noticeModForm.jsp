<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book.css">
<%@ include file="/sub/temp/bootStrap.jspf" %>
<title>어라운드 무비</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		//전역변수선언
	    var editor_object = [];
	     
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: editor_object,
	        //teatarea ID
	        elPlaceHolder: "se",
	        sSkinURI: "../SE2/SmartEditor2Skin.html", 
	        htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,             
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : true,     
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true, 
	        }
	    });
	    
	    var count=0;
		var form=$("#uForm")[0];
		var pnum=$("#pnum").val();
		
		$("#fResult").on("click",".del",function(){
			var unum=$(this).attr("id");
			$.post("../file/fileDelete.file",{
				unum:unum,
				pnum:pnum
			},function(data){
				$("#fResult").html(data);
			});
		});
		
		$("#fAdd").click(function(){
			if(count<5){
				count++;
				$("#fileInput").append('<input type="file" class="btn btn-warning" name="f'+count+'" id="f'+count+'" class="f">');
			}
		});
		
		
		$("#fDel").click(function(){
			if(count>0){
				$("#f"+count).remove();
				count--;
			}
		});
		
		$("#upload").click(function(){
			var formData=new FormData(form);
			$.ajax({
				method : "post",
				url : "../file/fileUpload.file",
				processData : false,
				data: formData,
				contentType: false,
				success:function(data){
					$("#fResult").html(data);
				}
			});
		});
		
		$("#submit").click(function(){
			editor_object.getById["se"].exec("UPDATE_CONTENTS_FIELD", []);
			document.frm.submit();
		});
		
	});
</script>
<style type="text/css">
h3{
	margin: 0;
}
.formInfo{
	width: 1020px;
}

#se{
	width: 940px;
}

table.notice {
	width: 980px;
	margin: 20px auto;
}

table.search {
	width: 500px;
	margin: 0px auto;
	float: none;
}

.position {
	width: 1000px;
}

tr.top {
	font-weight: bold;
}

td {
	font-size: 15px;
	text-align: center;
	padding: 10px 20px 10px 20px;
}

span {
	cursor: pointer;
}

.green{
	font-weight: bold;
	background-color: rgb(44,65,98);
	color:white;
	border-radius: 3px;
}
</style>
</head>
<body>
	<%@ include file="/sub/temp/header.jspf" %>

	
	<section>
		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 
				<a href="noticeList.notice">공지사항</a> > 공지사항 ${notice.num} 수정
			</div>
		</div>

		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">공지사항 ${notice.num} 수정</p>
			</div>	
		</div>
		
		<div class="position formInfo">
			<form action="./noticeMod.notice" name="frm" method="post">
				<input type="hidden" name="num" value="${notice.num}">
			
				<table class="notice">
					<tr style="border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;">
						<td>제목</td>
						<td><input class="form-control" type="text" name="title" value="${notice.title}"></td>
					</tr>

					<tr style="border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;">
						<td>작성자</td>
						<td><input class="form-control" type="text" value="${notice.writer}" readonly="readonly"></td>
					</tr>

					<tr style="border-top: 1px solid #e6e6e6;
	border-bottom: 1px solid #e6e6e6;">
						<td>작성날짜</td>
						<td><input class="form-control" type="date" name="reg_date" value="${notice.reg_date}" readonly="readonly"></td>
					</tr>

					<tr>
						<td colspan="2" class="green">내용</td>
					</tr>

					<tr>
						<td colspan="2"><textarea id="se" cols="90px" name="contents">${notice.contents}</textarea></td>
					</tr>
				</table>
			</form>
			
			
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
						<input type="hidden" value="${notice.fnum}" name="pnum" id="pnum">
						<div id="fileInput"></div>
					</td></tr>

					<tr><td>
						<input class="btn btn-warning" type="button" value="첨부파일 업로드" id="upload">
					</td></tr>
					
					<tr><td>
						<input class="btn btn-success" type="button" value="수정 완료" id="submit">
					</td></tr>
				</table>
			</form>
		</div>
	</section>

	<%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>