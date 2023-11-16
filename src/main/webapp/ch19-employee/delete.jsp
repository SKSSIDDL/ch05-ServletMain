<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.story.dao.StoryDAO" %>
<%@ page import="kr.story.vo.StoryVO" %>   
<%
	request.setCharacterEncoding("utf-8");

	//전송된 데이터 반환
	int num = Integer.parseInt(request.getParameter("num"));
	String passwd = request.getParameter("passwd");
	
	StoryDAO dao = StoryDAO.getInstance();
	//비밀번호 인증하기
	StoryVO vo = dao.getStory(num);
	boolean check = false;
	if(vo!=null){
		//비밀번호 일치 여부 체크
		//check = vo.isCheckedPassword(passwd);
	}
	if(check){//인증 성공
		dao.delete(num);
%>  
	<script>
		alret('글 삭제를 완료했습니다.');
		location.replace('list.jsp');
	</script>
<%
	}else{
%>
	<script>
		alert('비밀번호 불일치');
		history.go(-1);
	</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>