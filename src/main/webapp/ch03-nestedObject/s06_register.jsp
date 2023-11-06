<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원가입</h2>
	이름 : <%= request.getParameter("name") %><br>
	ID : <%= request.getParameter("id") %><br>
	비밀번호 : <%= request.getParameter("password") %><br>
	전화번호 : <%= request.getParameter("phone") %><br>
	취미 : 
<%
		String[] values = request.getParameterValues("hobby");
		if(values!=null){
			for(int i=0; i<values.length; i++){
%>
				<%= values[i] %>
<%				
				if(i<values.length-1) out.print(",");
			}
		}
%>
	<br>
	자기소개 : <%= request.getParameter("content") %>
</body>
</html>