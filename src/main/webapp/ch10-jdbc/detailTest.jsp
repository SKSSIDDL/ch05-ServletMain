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
<title>글상세 정보 보기</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
	<div class="page-main">
		<h2>글상세 정보</h2>
<%
		int num = Integer.parseInt(request.getParameter("num"));
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try{
			//1단계: 드라이버 로드
			Class.forName(driverName);
			
			//2단계: connection객체 생성
			conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
			
			//SQL문 작성
			sql = "SELECT * FROM tboard WHERE num=?";
			
			//3단계: preparedstatement객체 생성
			pstmt = conn.prepareStatement(sql);
			
			//?에 데이터 바인딩
			pstmt.setInt(1,num);
			
			//4단계: sql문 실행
			rs = pstmt.executeQuery();
			if(rs.next()){
				String name = rs.getString("name");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Date reg_date = rs.getDate("reg_date");
%>
			<ul>
				<li>글번호 : <%= num %></li>
				<li>제목 : <%= title %></li>
				<li>작성자 : <%= name %></li>
				<li>작성일 : <%= reg_date %></li>
			</ul>
			<hr width="100%" size="1" noshade="noshade">
			<p>
				<%= content %>
			</p>
			<hr width="100%" size="1" noshade="noshade">
			<div class="align-right">
				<input type="button" value="수정" onclick="location.href='updateTestForm.jsp?num=<%= num %>'">
				<input type="button" value="삭제" onclick="location.href='deleteTestForm.jsp?num=<%= num %>'">
				<input type="button" value="게시판 목록" onclick="location.href='selectTest.jsp'">
			</div>
<%			
			}else{
%>
			<div class="result-display">
				<div class="align-center">
					글상세 정보가 없습니다.<br>
					<input type="button" value="게시판 목록" onclick="location.href='selectTest.jsp'">
				</div>
			</div>
<%				
			}
			
		}catch(Exception e){
%>
			<div class="result-display">
				<div class="align-center">
					오류 발생! 글상세 정보 호출 실패!<br>
					<input type="button" value="게시판 목록" onclick="location.href='selectTest.jsp'">
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