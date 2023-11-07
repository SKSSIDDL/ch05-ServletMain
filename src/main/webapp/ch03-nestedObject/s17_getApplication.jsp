<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Application에 저장된 데이터 읽기</title>
</head>
<body>
<!-- application이 공유범위가 가장 넓음. 브라우저를 껐다 켜도 데이터가 남아있음. 
	 userId가 바뀔 경우(client가 바뀔 경우) 데이터가 변경되는 문제가 발생할 수 있음
	 => application은 주로 설정 정보를 관리 (session은 client 단위로 정보를 식별함)  -->
<%
	Enumeration<String> attrEnum = application.getAttributeNames();
	while(attrEnum.hasMoreElements()){
		String name = attrEnum.nextElement();
		Object value = application.getAttribute(name);
%>
	application 속성 : <b><%= name %></b> = <%= value %><br>
<%		
	}
%>
</body>
</html>