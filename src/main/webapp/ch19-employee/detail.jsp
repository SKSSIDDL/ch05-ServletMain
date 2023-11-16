<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>     
<%
	int num = Integer.parseInt(request.getParameter("num"));
	StoryDAO dao = StoryDAO.getInstance();
	StoryVO vo = dao.getStory(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원이야기 상세</title>
</head>
<body>
	<div class="page-main">
		<h1>사원이야기 상세</h1>
		<ul>
			<li>글번호 : <%= vo.getNum() %></li>
			<li>제목 : <%= vo.getTitle() %></li>
			<%-- <li>작성자 : <%= vo.getName() %></li> --%>
		</ul>
		<hr size="1" noshade="noshade" width="100%">
		<p>
			<%= vo.getContent() %>
		</p>
		<div class="align-right">
			작성일 : <%= vo.getReg_date() %>
			<input type="button" value="수정" onclick="location.href='updateForm.jsp?num=<%=vo.getNum()%>'">
			<input type="button" value="삭제" onclick="location.href='deleteForm.jsp?num=<%=vo.getNum()%>'">
			<input type="button" value="목록" onclick="location.href='list.jsp'">      
		</div>
		
	</div>
</body>
</html>