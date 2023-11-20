<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<c:redirect url="s01_set.jsp">
	<%--      파라미터네임          값       --%>
	<c:param name="id" value="dragon"/>
	<c:param name="name" value="peter"/>
</c:redirect>
<%-- redirect는 주소를 get 방식으로 전달함 --%>