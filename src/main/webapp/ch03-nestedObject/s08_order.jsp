<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	//가격 정보
	HashMap<String,Integer> map = new HashMap<String,Integer>();
	map.put("가방",200000);
	map.put("신발",100000);
	map.put("옷",50000);
	map.put("식사권",150000);
	
	//배송비
	int delivery_fee = 5000;
	//합계
	int sum = 0;
%>
	<h2>주문서</h2>
	이름 : <%= request.getParameter("name") %><br>
	희망 배송일: <%= request.getParameter("order_date") %><br>
	구매 상품 : 
<%
	String[] items = request.getParameterValues("item");
	if(items!=null){
		for(int i=0; i<items.length; i++){
			sum += map.get(items[i]); //상품의 가격 누적
			if(i>0) out.print(",");
%>
			<%= items[i] %>			
<%			
		} //end of for
		
		//배송비 처리
		if(sum<300000) sum+= delivery_fee;
		else delivery_fee=0;
%>
		<br>
		배송비 : <%= String.format("%,d원",delivery_fee) %><br>
		총 구매 금액(배송비 포함) : <%= String.format("%,d원",sum) %>
<%
	}
%>			
	
</body>
</html>