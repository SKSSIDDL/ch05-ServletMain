<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 출력</title>
</head>
<body>
name 파라미터 값 : <%= request.getParameter("name").toUpperCase() %>
<!-- 에러 페이지를 지정할 때 우선순위가 존재, errorPage->exception-type->error-code이기 때문에 null 에러 발생 -->
<!-- 404는 주소에 없는 주소를 입력하면 확인할 수 있음 -->
</body>
</html>