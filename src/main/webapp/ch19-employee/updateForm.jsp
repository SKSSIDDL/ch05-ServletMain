<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>
<%
	Integer user_num = (Integer)session.getAttribute("user_num");
	if(user_num==null){
		response.sendRedirect("loginForm.jsp");
	}else{
		int num = Integer.parseInt(request.getParameter("num"));
		StoryDAO dao = StoryDAO.getInstance();
		StoryVO vo = dao.getStory(num);	
		if(user_num!=vo.getSnum()){
			response.sendRedirect("notice.jsp");
		}else{
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript">
window.onload=function(){
	const myForm = document.getElementById('update_form');
	myForm.onsubmit=function(){
		let items = document.querySelectorAll('input[type="text"],input[type="password"],textarea');
		for(let i=0;i<items.length;i++){
			if(items[i].value.trim()==''){
				let label = document.querySelector('label[for="'+items[i].id+'"]');
				alert(label.textContent + ' 항목은 필수 입력');
				items[i].value = '';
				items[i].focus();
				return false;
			}	
		}
	};
};
</script>
</head>
<body>
<div class="page-main">
	<h1>글 수정</h1>
	<form id="update_form" action="update.jsp" method="post">
		<input type="hidden" name="num" value="<%= num %>">
		<ul>
			<li>
				<label for="title">제목</label>
				<input type="text" name="title" id="title" size="30" value="<%= vo.getTitle() %>" maxlength="50">
			</li>
			<li>
				<label for="content">내용</label>
				<textarea rows="5" cols="40" name="content" id="content"><%= vo.getContent() %></textarea>
			</li>
		</ul>
		<div class="align-center">
			<input type="submit" value="글수정">
			<input type="button" value="목록" onclick="location.href='list.jsp'">
		</div>
	</form>
</div>
</body>
</html>
<%
		}
	}
%>


