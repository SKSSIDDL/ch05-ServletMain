<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO"%>
<%@ page import="kr.employee.vo.EmployeeVO"%>   
<%
	Integer user_num = (Integer)session.getAttribute("user_num");
	if(user_num == null){
		response.sendRedirect("loginForm.jsp");
	}else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보 수정</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<%
	EmployeeDAO dao = EmployeeDAO.getInstance();
	EmployeeVO vo = dao.getEmployee(user_num);
%>
	<div class="page-main">
		<h1>회원정보 수정</h1>
		<form action="modifyUser.jsp" method="post" id="modify_form">
			<ul>
				<li>
					<label for="name">이름</label>
					<input type="text" name="name" id="name" value="<%= vo.getName() %>" maxlength="10">
				</li>
				<li>
					<label for="passwd">비밀번호</label>
					<input type="password" name="passwd" id="passwd" maxlength="12">
				</li>
				<li>
					<label for="salary">급여</label>
					<input type="number" name="salary" id="salary" value="<%= vo.getSalary() %>" min="1" max="99999999">
				</li>
				<li>
					<label for="job">직업</label>
					<input type="text" name="job" id="job" value="<%= vo.getJob() %>" maxlength="15">
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="수정">
				<input type="button" value="홈으로" onclick="location.href='main.jsp'">
			</div>
		</form>
	</div>
</body>
</html>
<%		
	}
%> 