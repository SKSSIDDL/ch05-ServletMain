<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 4개 기본객체와 영역</title>
</head>
<body>
page 영역의 msg1 = <%= pageContext.getAttribute("msg1") %><br> <!-- null -->
<!-- 서비스 객체인 것 처럼 공유범위가 1대 1로 대응한다.(같은 페이지에서만 읽을 수 있음) -->
request 영역의 msg2 = <%= request.getAttribute("msg2") %><br> <!-- null -->
<!-- page영역과 request영역은 같은 페이지에서만 사용할 수 있음(request가 page보다 공유 범위가 넓음) -->
session 영역의 msg3 = <%= session.getAttribute("msg3") %><br> <!-- 가을 -->
<!-- session은 브라우저가 열려있을 동안 공유함 -->
</body>
</html>