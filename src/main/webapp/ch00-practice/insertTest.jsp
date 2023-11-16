<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ include file = "dbInfo.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<%
	//전송된 데이터 인코딩 처리(post 방식이기 떄문에)
	request.setCharacterEncoding("uft-8");

	//전송된 데이터 반환
	String name = request.getParameter("name");
	int price = Integer.parseInt(request.getParameter("price"));
	int stock = Integer.parseInt(request.getParameter("stock"));
	String origin = request.getParameter("origin");
	
	//DB연동
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql =null;
	
	try{
		Class.forName(driverName);
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		sql = "INSERT INTO product(num,name,price,stock,origin,reg_date) VALUES(product_seq.nextval,?,?,?,?,SYSDATE)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, price);
		pstmt.setInt(3, stock);
		pstmt.setString(4, origin);
		pstmt.executeUpdate();
%>
		
		<div class="result-display">
			<div class="align-center">
				제품 등록 성공!<br>
				<input type="button" value="목록 보기" onclick="location.href='selectTest.jsp'">
			</div>
		</div>
<%		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
		if(conn!=null)try{conn.close();}catch(SQLException e){}
	}
%>
</body>
</html>