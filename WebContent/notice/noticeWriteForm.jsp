
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style type="text/css">
h3{
	margin: 0;
}
.formInfo{
	width: 1020px;
}

table.notice {
	width: 980px;
	margin-left: 0%;
}

#se{
	width: 830px;
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
	width: auto;
}

span {
	cursor: pointer;
}

#write{
	background-color: rgb(0,174,240);
	color: white;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
	$("#fAdd").click(function(){
		if(count<5){
			count++;
			$("#fileInput").append('<input type="file" class="btn btn-warning" name="f'+count+'" id="f'+count+'">');
		}
	});
	
	$("#fDel").click(function(){
		if(count>0){
			$("#f"+count).remove();
			count--;
		}
	});
	
	var check=false;
	
	$("#write").click(function(){
		if($("#title").val()==''){
			alert("제목을 입력하세요.");
			check=false;
		}else{
			check=true;
		}
		
		if(check){
			editor_object.getById["se"].exec("UPDATE_CONTENTS_FIELD", []);
			document.frm.submit();
		}
	});
	
});
</script>
</head>
<body>

	<%@ include file="/sub/temp/header.jspf" %>
	
	<section>
		<div class="bBar">
			<div class="position noBMargin">
				<a href="../index.jsp">HOME</a> > 
				<a href="noticeList.notice">공지사항</a> > 공지사항 작성
			</div>
		</div>

		<div class="wBar">
			<div class="position noTMargin">
				<p class="title">공지사항 작성</p>
			</div>	
		</div>
		
		<div class="position formInfo">
			<form name="frm" id="frm" action="noticeWrite.notice" method="post" enctype="multipart/form-data">
				<table class="notice">
					<tr class="top">
						<td>제목</td>
						<td><input class="form-control" type="text" id="title" name="title"></td>
					</tr>
				
					<tr class="top">
						<td>작성자</td>
						<td><input class="form-control" type="text" name="writer" value="${sessionScope.admin.id}" readonly="readonly"></td>
					</tr>
			
					<tr><td colspan="2">
						<input class="btn btn-primary" type="button" value="파일 추가" id="fAdd">
						<input class="btn btn-danger" type="button" value="파일 삭제" id="fDel">
						<div id="fileInput"></div>			
					</td></tr>
				
					<tr><td colspan="2">
						<textarea id="se" name="contents"></textarea>
					<td></tr>
			
					<tr><td colspan="2">
						<!-- <input type="button" id="savebutton write" class="btn btn-success" value="write"> -->
						<input class="btn" type="button" value="작성 완료" id="write">
					</td></tr>
				</table>
			</form>
		</div>
	</section>
	
	<%@ include file="/sub/temp/footer.jspf" %>

</body>
</html>