<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.HashMap" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서</title>
</head>
<body>
<%
	
	int[] orderArray = {4000,5000,6000};
	int total = 0;
	String orderName = ""; //주문 내역
	
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
	
	//전송된 데이터 반환
	int food_c0 = Integer.parseInt(request.getParameter("food_c0"));
	int food_c1 = Integer.parseInt(request.getParameter("food_c1"));
	int food_c2 = Integer.parseInt(request.getParameter("food_c2"));
	
	if(food_c0 >0){
		total += orderArray[0] * food_c0;
		orderName += "짜장면 " + food_c0 + "개<br>"; 
	}
	if(food_c1 >0){
		total += orderArray[1] * food_c1;
		orderName += "짬뽕 " + food_c1 + "개<br>"; 
	}
	if(food_c2 >0){
		total += orderArray[2] * food_c2;
		orderName += "볶음밥 " + food_c2 + "개<br>"; 
	}
%>

<%= orderName %>
총 지불 금액 : <%= String.format("%,d원",total) %>
	
</body>
</html>