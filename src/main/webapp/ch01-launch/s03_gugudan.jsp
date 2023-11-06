<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습]구구단 5단</title>
</head>
<body>
<!-- [출력예시]
5단
---------
5 * 1 = 5
5 * 2 = 10
5 * 3 = 15
 -->
 
<%
	out.println("5단<br>");
	out.println("-------------<br>");

	int dan = 5;
	for(int i=1; i<=9; i++){
		out.println(dan +"*"+ i +"="+ dan*i +"<br>");
	}
%>
</body>
</html>