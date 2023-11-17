<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO"%>
<%@ page import="kr.employee.vo.EmployeeVO"%>    
<%
	Integer user_num = (Integer)session.getAttribute("user_num");
	if(user_num == null){
		response.sendRedirect("loginForm.jsp");
	}else{
		request.setCharacterEncoding("utf-8");
%>
	<jsp:useBean id="employee" class="kr.employee.vo.EmployeeVO"/>
	<jsp:setProperty name="employee" property="*"/>
<%
	EmployeeDAO dao = EmployeeDAO.getInstance();
	employee.setSnum(user_num);
	dao.updateEmployee(employee);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정 완료</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="page-main">
		<h1>회원정보수정 완료</h1>
		<div class="result-display">
			<div class="align-center">
				회원정보수정 완료<br>
				<button onclick="location.href='myPage.jsp'">MyPage</button>
			</div>
		</div>
	</div>
</body>
</html>
<%		
	}
%>