<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
<link rel="stylesheet" href="style.css" type="text/css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<div class="page-main">
		<h2>제품 등록</h2>
		<form id="myForm" action="insertTest.jsp" method="post">
			<ul>
				<li>
					<label for="name">상품명</label>
					<input type="text" name="name" id="name" size="20" maxlength="10">
				</li>
				<li>
					<label for="price">가격</label>
					<input type="text" name="price" id="price" min="1" max="999999999">
				</li>
				<li>
					<label for="stock">재고</label>
					<input type="text" name="stock" id="stock" min="1" max="999999999">
				</li>
				<li>
					<label for="origin">원산지</label>
					<input type="text" name="origin" id="origin" size="20" maxlength="10">
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="등록">
				<input type="button" value="목록" onclick="location.href='selectTest.jsp'">
			</div>
		</form>
	</div>
</body>
</html>