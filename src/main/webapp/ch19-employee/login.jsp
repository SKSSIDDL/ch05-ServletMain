<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.employee.dao.EmployeeDAO"%>
<%@ page import="kr.employee.vo.EmployeeVO"%>   
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");

	//전송된 데이터 반환
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	EmployeeDAO dao = EmployeeDAO.getInstance();
	//id 존재 여부 확인
	EmployeeVO vo = dao.checkEmployee(id);
	boolean check = false;
	
	if(vo != null){
		check = vo.isCheckedPassword(passwd);
	}
	if(check){
		session.setAttribute("user_num", vo.getSnum());
		session.setAttribute("user_id", id);
		response.sendRedirect("main.jsp");
	}else{
%>
		<script>
			alert('아이디 또는 비밀번호가 불일치합니다.');
			history.go(-1); //전 페이지로
		</script>
<%		
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>