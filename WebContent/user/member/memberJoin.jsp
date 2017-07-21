<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/section.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css">
<%@ include file="/sub/temp/bootStrap.jspf" %>
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/member.css">
<link rel="styleSheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/book.css">
<title>어라운드 무비</title>
<script type="text/javascript">
   $(function() {   
      var check = false;
      var idcheck = false;
      var idcheck2 = false;
      var pwcheck = false;
      
      $("#id").keyup(function() {
         check = false;
         
         var pattern = /^[A-Za-z0-9]{4,12}$/;
         var id = document.frm.id.value;
         if(!pattern.test(id)) {
            idcheck2 = false;
         } else {
            idcheck2 = true;
         }
         
         $.post("./memberIdCheck.member", {
            id: $("#id").val()
         },
         function(data) {
            if (data == 0) {
               $("#id_result").html("이미 존재하는 아이디입니다.");
               check = false;
               idcheck = false;
            } else if ((data == 1) && (idcheck2 == true)) {
               $("#id_result").html("사용 가능한 아이디입니다.");
               check = true;   
               idcheck = true;
            } else {
               $("#id_result").html("");
               check = false;
               idcheck = false;
            }            
         });   
         
         
      });
      
      $("#id").blur(function() {
         var pattern = /^[A-Za-z0-9]{4,12}$/;
         var id = document.frm.id.value;
         if(!pattern.test(id)) {
            $("#id_result").html("아이디는 4~12자리의 영문(대소문자 구별), 숫자 조합으로 입력해주세요.");
            idcheck2 = false;
         } else {
            $("#id_result").html("");
            idcheck2 = true;
         }
      });
      
      $("#pw").keyup(function() {
         check = false;
         var pw = $("#pw").val();
         var pw2 = $("#pw2").val();
         
         if (pw2 != "") {
            if (pw != pw2) {
               $("#pw_result").html("비밀번호가 다릅니다.");
               check = false;
            } else {
               $("#pw_result").html("");
               check = true;
            }
         }
      });
      
      $("#pw").blur(function() {
         var pattern = /^[A-Za-z0-9]{8,14}$/;
         var pw = document.frm.pw.value;
         if(!pattern.test(pw)) {
            $("#pw_result2").html("비밀번호는 8~14자리의 영문(대소문자 구별), 숫자 조합으로 입력해주세요.");
            pwcheck = false;
         } else {
            pwcheck = true;
         }
      });
      
      $("#pw2").keyup(function() {
         check = false;
         var pw = $("#pw").val();
         var pw2 = $("#pw2").val();
         
         if (pw != pw2) {
            $("#pw_result").html("비밀번호가 다릅니다.");
            check = false;
         } else {
            $("#pw_result").html("");
            check = true;
         }
      });
      
      
      $("#frm").on("click", "#btn", function() {
         $(".essential").change(function() {
            check = false;
            var essential = $(this).val();
            if (essential == "") {
               check = false;
            } else {
               check = true;
            }
         });
         
         if ($("#nation").val() == "") {
            check = false;
         }      
         
         if (check == false) {
            $("#message").html("모든 항목을 입력 해 주세요.");
         } else if (check == true && idcheck == false)  {
            $("#message").html("아이디를 체크 해주세요.");
         } else if (idcheck2 == false) {
            $("#message").html("아이디는 4~12자리의 영문(대소문자 구별), 숫자 조합으로 입력해주세요.");
         } else if (pwcheck == false) {
            $("#message").html("비밀번호는 8~14자리의 영문(대소문자 구별), 숫자 조합으로 입력해주세요.");
         } else {
            document.frm.submit("./memberJoin.member");
         }
      })
      
   });
</script>
<style>
   #btn{
      background-color: rgb(255,192,0);
      color: white;
      width: 150px;
   }
</style>
</head>
<body>

   <%@ include file="/sub/temp/header.jspf" %>
   
   <section>
      <div class="bBar">
      <div class="position noBMargin">
         <a href="../../index.jsp">HOME</a> > 회원 가입
      </div>
      </div>
      <div class="wBar">
      <div class="position noTMargin">
         <p class="title">회원 정보 입력</p>
      </div>
      </div>
      
      
      <form action="./memberJoin.member" method="post" name="frm" id="frm">
      <div class="position formInfo">
         <table class="list">
            
            <tr>
               <td class="info">아이디</td>
               <td class="data"><input type="text" name="id" id="id" class="form-control" required></td>
               <td><p id="id_result" class="show"></p></td>
            </tr>
            <tr>
               <td class="info">패스워드</td>
               <td class="data"><input type="password" name="pw" id="pw" class="form-control" required></td>
               <td><p id="pw_result2" class="show"></p></td>
            </tr>
            <tr>
               <td class="info">패스워드 재확인</td>
               <td class="data"><input type="password" name="pw2" id="pw2" class="form-control" required></td>
               <td><p id="pw_result" class="show"></p></td>
            </tr>
            <tr>
               <td class="info">이름</td>
               <td class="data"><input type="text" name="name" class="form-control" required></td>
            </tr>
            <tr>
               <td class="info">연락처</td>
               <td class="data"><input type="text" name="phone" class="form-control" required></td>
            </tr>
            <tr>
               <td class="info">국적</td>
               <td class="data">
                  <select name="nation" id="nation" class="essential form-control">
                     <option value="" selected>선택</option>
                     <option value="kor">대한민국</option>
                     <option value="jap">일본</option>
                     <option value="chi">중국</option>
                  </select>
               </td>
            </tr>
            <tr><td colspan="3"><span id="message"></span></td></tr>
            <tr>
               <td colspan="3"><input type="button" id="btn" class="btn" value="회원가입"></td>
            </tr>
         </table>
      </div>
      </form>
   </section>
   <%@ include file="/sub/temp/footer.jspf" %>
</body>
</html>