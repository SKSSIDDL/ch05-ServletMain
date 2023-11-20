<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>catch 태그</title>
</head>
<body>
<%-- catch 태그내에 예외가 발생할 가능성이 있는 코드 작성 --%>
<c:catch var="ex">
	name 파라미터의 값 = <%= request.getParameter("name") %>
	<%
		if(request.getParameter("name").equals("test")){ //null 예외발생
	%>
			${param.name}은 test입니다.
	<%		
		}
	%>
</c:catch>
<p>
<c:if test="${ex != null}">
	예외가 발생했습니다.<br>
	${ex} <%-- 예외 발생문구 --%>
</c:if>
</p>
</body>
</html>