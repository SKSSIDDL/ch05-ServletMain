<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager" %>    
<%@ page import="java.sql.SQLException" %>    
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>    
<%@ page import="java.sql.Date" %>
<%@ include file="dbInfo.jspf" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품목록 보기</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
	<div class="page-main">
		<h2>제품 목록</h2>
		<div class="align-right">
			<input type="button" value="제품 등록" onclick="location.href='insertTestForm.jsp'">
		</div>
<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try{
			Class.forName(driverName);
			
			conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
			
			sql = "SELECT * FROM product ORDER BY num DESC";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
%>
			<table>
				<tr>
					<th>제품번호</th>
					<th>제품명</th>
					<th>가격</th>
					<th>재고</th>
					<th>원산지</th>
				</tr>
<%			
			while(rs.next()){
				int num = rs.getInt("num");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				int stock = rs.getInt("stock");
				String origin = rs.getString("origin");
%>
				<tr>
					<td><%= num %></td>
					<td><a href="detailTest.jsp?num=<%= num %>"><%= name %></a></td>
					<td class="align-right"><%= String.format("% ,d원", price) %></td>
					<td class="align-right"><%= String.format("% ,d", stock) %></td>
					<td><%= origin %></td>
				</tr>
<%				
			}
%>
			</table>
<%
		}catch(Exception e){
%>
			<div class="result-display">
				<span>오류 발생</span>
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