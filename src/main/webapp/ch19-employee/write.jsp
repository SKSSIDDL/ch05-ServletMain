<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="story" class="kr.story.vo.StoryVO"/>
<jsp:setProperty property="*" name="story"/>
<%
	//클라이언트의 ip 주소 저장
	story.setIp(request.getRemoteAddr());

	StoryDAO dao = StoryDAO.getInstance();
	dao.insert(story);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원이야기 등록 완료</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
<div class="page-main">
	<h1>사원이야기 등록 완료</h1>
	<div class="result-display">
		<div class="align-center">
			사원이야기에 글을 등록했습니다.<br>
			<button onclick="location.href='list.jsp'">목록</button>
		</div>
	</div>
</div>
</body>
</html>