<%@page import="javax.naming.PartialResultException"%>
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
<title>제품 삭제</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try{
		Class.forName(driverName);
		
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		sql = "DELETE FROM product WHERE num=?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1,num);
		
		pstmt.executeUpdate();
%>
		<div class="result-display">
			<div class="align-center">
				제품 삭제 완료!<br>
				<input type="button" value="제품목록" onclick="location.href='selectTest.jsp'">
			</div>
		</div>
<%		
	}catch(Exception e){
%>
		<div class="result-display">
			<div class="align-center">
				오류 발생! 제품 삭제 실패!<br>
				<input type="button" value="제품목록" onclick="location.href='selectTest.jsp'">
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