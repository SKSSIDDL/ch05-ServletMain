<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.DriverManager" %>    
<%@ page import="java.sql.SQLException" %>    
<%@ page import="java.sql.Connection" %>    
<%@ page import="java.sql.PreparedStatement" %>    
<%@ page import="java.sql.ResultSet" %>    
<%@ include file="dbInfo.jspf" %>    
<%
	//전송된 데이터 인코딩 처리
	request.setCharacterEncoding("utf-8");
	
	//전송된 데이터 반환
	String id = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try{
		Class.forName(driverName);
		
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		
		sql = "SELECT id FROM people WHERE id=?"; //id가 있는지 없는지만 검사
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		//JSON문자열로 만드기
		if(rs.next()){ //아이디 중복
%>
		{"result":"idDuplicated"}
<%			
		}else{ //아이디 미중복
%>
		{"result":"idNotFound"}
<%			
		}
		
	}catch(Exception e){
%>
		{"result":"failure"}
<%		
		e.printStackTrace();
	}finally{
		if(rs!=null)try{rs.close();}catch(SQLException e){}
		if(pstmt!=null)try{pstmt.close();}catch(SQLException e){}
		if(conn!=null)try{conn.close();}catch(SQLException e){}
	}
%>