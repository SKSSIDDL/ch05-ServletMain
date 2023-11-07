<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer = "1kb" autoFlush="false" %>    
<!-- 흘러넘치면 에러가 나기 때문에 autoFlush는 false로 하지 않는다 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>autoFlush 속성값 false 예제</title>
</head>
<body>
<%
	for(int i=0; i<1000; i++){
%>
1234
<%		
	}
%>
</body>
</html>