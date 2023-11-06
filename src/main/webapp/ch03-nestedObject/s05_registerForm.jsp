<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[실습]회원가입</title>
</head>
<body>
<%--
[실습]회원가입 폽
input type="text" =>이름(name), ID(id),전화번호(phone),
input type="password"비밀번호(password),
input type="checkbox"취미(hobby - (checkbox)영화보기, 음악감상,등산,낚시,춤),
textarea - 자기소개

[출력예시]
이름 : 홍길동
ID : dragon
비밀번호 : 1234
전화번호 : 010-1234-5678
취미 : 영화보기, 춤
자기소개 : 서울에서 태어나서 서울에서 거주
 --%>
 	<form action="s06_register.jsp" method="post">
 		<ul>
 			<li>
 				<label for="name">이름</label>
 				<input type="text" name="name" id="name" size="10">
 			</li>
 			<li>
 				<label for="id">아이디</label>
 				<input type="text" name="id" id="id" size="30">
 			</li>
 			<li>
 				<label for="password">비밀번호</label>
 				<input type="password" name="password" id="password" size="30">
 			</li>
 			<li>
 				<label for="phone">전화번호</label>
 				<input type="text" name="phone" id="phone" size="30">
 			</li>
 			<li>
 				<label>취미</label>
 				<input type="checkbox" name="hobby" value="영화보기">영화보기
 				<input type="checkbox" name="hobby" value="음악감상">음악감상
 				<input type="checkbox" name="hobby" value="등산">등산
 				<input type="checkbox" name="hobby" value="낚시">낚시
 				<input type="checkbox" name="hobby" value="춤">춤
 			</li>
 			<li>
 				<label for="content">자기소개</label>
 				<textarea rows="5" cols="60" name="content" id="content"></textarea>
 			</li>
 		</ul>
 		<input type="submit" value="전송">
 		
 		<%--
 		이름 : <input type="text" name="name"><br>
 		ID : <input type="text" name="id"><br>
 		비밀번호 : <input type="password" name="password"><br>
 		전화번호 : <input type="text" name="phone"><br>
 		취미 : 
 		<input type="checkbox" name="hobby" value="영화보기">영화보기
 		<input type="checkbox" name="hobby" value="음악감상">음악감상
 		<input type="checkbox" name="hobby" value="등산">등산
 		<input type="checkbox" name="hobby" value="낚시">낚시
 		<input type="checkbox" name="hobby" value="춤">춤
 		<br>
 		자기소개 : <textarea name="introduce"></textarea>
 		<br>
 		<input type="submit" value="전송">
 		 --%>
 		
 	</form>
</body>
</html>