<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ include file="dbInfo.jspf" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");

	//전송된 데이터 반환
	int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	int stock = Integer.parseInt(request.getParameter("stock"));
	String origin = request.getParameter("origin");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try{
		Class.forName(driverName);
		
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		sql = "UPDATE product SET name=?, price=?, stock=?, origin=? WHERE num=?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setInt(2, price);
		pstmt.setInt(3, stock);
		pstmt.setString(4, origin);
		pstmt.setInt(5, num);
		
		pstmt.executeUpdate();
%>
		<div class="result-display">
			<div class="align-center">
				제품 수정 완료!<br>
				<input type="button" value="제품상세" onclick="location.href='detailTest.jsp?num=<%= num %>'">
			</div>
		</div>
<%		
		
	}catch(Exception e){
%>
		<div class="result-display">
			<div class="align-center">
				오류 발생! 제품 수정 실패!<br>
				<input type="button" value="제품수정" onclick="location.href='updateTestForm.jsp?num=<%= num %>'">
			</div>
		</div>
<%		
		e.printStackTrace();
	}finally{
		if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
		if(conn!=null)try{conn.close();}catch(SQLException e){}
	}
%>
</body>
</html>