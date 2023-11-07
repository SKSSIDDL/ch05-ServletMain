<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 목록</title>
</head>
<body>
쿠키 목록<br>
<%
	//클라이어으로부터 전송된 쿠키 정보를 반환
	Cookie[] cookies = request.getCookies();
	if(cookies!=null && cookies.length>0){
		for(int i=0; i<cookies.length; i++){
%>
		<%-- 쿠키명 = 쿠키값 --%>
		<%= cookies[i].getName() %> = 
		<%= URLDecoder.decode(cookies[i].getValue(),"UTF-8") %><br>

<%		
		}
	}else{
%>
쿠키가 존재하지 않습니다.
<%	
	}
%>
<!-- 브라우저가 꺼지면 쿠키정보가 사라짐. 브라우저를 다 끄고 실행할 경우 쿠키가 존재하지 않다고 뜸 -->
</body>
</html>