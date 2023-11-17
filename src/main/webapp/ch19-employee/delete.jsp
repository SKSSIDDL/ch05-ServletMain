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
	StoryVO db_vo = dao.getStory(num);
	if(user_num!=db_vo.getSnum()){
		response.sendRedirect("notice.jsp");
	}else{
	dao.delete(num);
%>
	<script>
		alert('글 삭제를 완료했습니다.');
		location.replace('list.jsp');
	</script>
<%	
		}
	}
%>
