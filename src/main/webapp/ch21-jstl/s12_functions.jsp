<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>functions 라이브러리</title>
</head>
<body>
<c:set var="str1" value=" Functions <태그>를 사용합니다. "/>
<c:set var="str2" value="사용"/>
<c:set var="tokens" value="10,20,30-40,50,60,70,80.90,100"/>

문자열의 길이 : ${fn:length(str1)}<br><%-- 공백 포함 24 --%>
대문자로 변경 : ${fn:toUpperCase(str1)}<br>
소문자로 변경 : ${fn:toLowerCase(str1)}<br>
인덱스 3 ~ 6전까지 문자열 추출 : ${fn:substring(str1,3,6)}<br>
문자열에서 원래 문자를 지정한 문자로 대체 : ${fn:replace(str1," ","-")} <%-- 공백을 -으로 대체 --%><br>
문자열의 앞뒤 공백 제거 : ${fn:trim(str1)}<br>
지정한 문자의 인덱스 구하기 : ${fn:indexOf(str1,str2)}<br> <%--str1에서 str2를 찾기 --%>
문자열에서 지정한 문자를 구분자로 문자열을 잘라내기 : ${fn:split(tokens,',')}<br><br>
<c:forEach var="array" items="${fn:split(tokens,',-.')}"> <%-- 여러 개 처리 가능 --%>
	${array}<br>
</c:forEach>

</body>
</html>