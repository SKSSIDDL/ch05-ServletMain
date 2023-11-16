<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   Integer user_num = (Integer)session.getAttribute("user_num");
   if(user_num==null){ //로그인이 되지 않은 경우
      response.sendRedirect("loginForm.jsp");
   }else{ //로그인된 경우
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴 폼</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript">
window.onload = function(){
   let form = document.getElementById('delete_form');
   //이벤트 연결
   form.onsubmit=function(){
      let id = document.getElementById('id');
      if(id.value.trim()==''){ // 순수 자바스크립트기 때문에 val이 아닌 value라고 하는 것
         alert('아이디를 입력하세요');
         id.value = '';
         id.focus();
         return false;
      }
      let passwd = document.getElementById('passwd');
      if(passwd.value.trim()==''){
         alert('비밀번호를 입력하세요');
         passwd.value = '';
         passwd.focus();
         return false;
      }
      //비밀번호 확인
      let cpasswd = document.getElementById('cpasswd');
      if(cpasswd.value.trim()==''){
         alert('비밀번호 확인을 입력하세요');
         cpasswd.value = '';
         cpasswd.focus();
         return false;
      }
      //비밀번호와 비밀번호확인 일치 여부 체크
      if(passwd.value != cpasswd.value){
         alert('비밀번호와 비밀번호 확인이 불일치합니다.');
         cpasswd.value = ''; //비밀번호 확인 초기화
         cpasswd.focus();
         return false;
      }
   };
};
</script>
</head>
<body>
<div class="page-main">
   <h1>회원탈퇴</h1>
   <form id="delete_form" action="deleteUser.jsp" method="post">
   <ul>
      <li>
         <label for="id">아이디</label>
         <input type="text" name="id" id="id" maxlength="12">
      </li>
      <li>
         <label for="passwd">비밀번호</label>
         <input type="password" name="passwd" id="passwd" maxlength="12">
      </li>
      <li>
         <%-- 엣지 브라우저에서 지원하는 기능 (별도로 구현해줘야함) --%>
         <label for="cpasswd">비밀번호 확인</label>
         <input type="password" name="cpasswd" id="cpasswd" maxlength="12">
      </li>
   </ul>
   <div class="align-center">
      <input type="submit" value="회원탈퇴">
      <input type="button" value="홈으로" onclick="location.href='main.jsp'">
   </div>
   </form>
</div>
</body>
</html>
<%
   }
%>