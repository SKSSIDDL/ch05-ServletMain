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
<title>글수정</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<%
	//전송된 데이터 인코딩 처리(post이기 때문)
	request.setCharacterEncoding("utf-8");
	//전송된 데이터 반환
	 int num = Integer.parseInt(request.getParameter("num"));
	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String passwd = request.getParameter("passwd");
	String content = request.getParameter("content");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = null;
	
	try{
		//1단계
		Class.forName(driverName);
		//2단계
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		//sql문 작성
		sql = "UPDATE tboard SET name=?, title=?, passwd=?, content=? WHERE num=?";
		//3단계
		pstmt = conn.prepareStatement(sql);
		//?에 데이터 파인딩
		pstmt.setString(1, name);		
		pstmt.setString(2, title);		
		pstmt.setString(3, passwd);		
		pstmt.setString(4, content);
		pstmt.setInt(5,num);
		//4단계
		pstmt.executeUpdate();
%>
		<div class="result-display">
			<div class="align-center">
				글 수정 완료!<br>
				<input type="button" value="글상세" onclick="location.href='detailTest.jsp?num=<%= num %>'">
			</div>
		</div>
<%	
		
	}catch(Exception e){
%>
		<div class="result-display">
			<div class="align-center">
				오류 발생! 글수정 실패!<br>
				<input type="button" value="글수정 폼" onclick="location.href='updateTestForm.jsp?num=<%= num %>'">
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