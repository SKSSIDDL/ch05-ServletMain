<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="dbInfo.jspf" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<div class="page-main">
		<h2>제품 수정</h2>
<%
		int num = Integer.parseInt(request.getParameter("num"));

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try{
			Class.forName(driverName);
			
			conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
			
			sql = "SELECT * FROM product WHERE num=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1,num);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				String name = rs.getString("name");
				int price = rs.getInt("price");
				int stock = rs.getInt("stock");
				String origin = rs.getString("origin");
%>
			<form id="myForm" action="updateTest.jsp" method="post">
				<input type="hidden" name="num" value="<%= num %>">
				<ul>
					<li>
						<label for="name">제품명</label>
						<input type="text" name="name" id="name" value="<%= name %>" size="20" maxlength="10">
					</li>
					<li>
						<label for="price">가격</label>
						<input type="number" name="price" id="price" value="<%= price %>" min="1" max="999999999">
					</li>
					<li>
						<label for="stock">재고</label>
						<input type="number" name="stock" id="stock" value="<%= stock %>" min="1" max="999999999">
					</li>
					<li>
						<label for="origin">원산지</label>
						<input type="text" name="origin" id="origin" value="<%= origin %>" size="20" maxlength="10">
					</li>
				</ul>
				<div class="align-center">
					<input type="submit" value="수정">
					<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
				</div>
			</form>
<%				
			}else{
%>
				<div class="result-display"> 
					<div class="align-center">
						수정할 제품 정보 호출 실패!<br>
						<input type="button" value="제품 목록" onclick="location.href='selectTest.jsp'">
					</div>
				</div>
<%				
			}
		}catch(Exception e){
%>
			<div class="result-display">
				<div class="align-center"> 
					오류 발생! 수정할 제품 정보 호출 실패!<br>
					<input type="button" value="제품 목록" onclick="location.href='selectTest.jsp'">
				</div>
			</div>
<%		
			e.printStackTrace();
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException e){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
			if(conn!=null)try{conn.close();}catch(SQLException e){}
		}
%>		
	</div>
</body>
</html>