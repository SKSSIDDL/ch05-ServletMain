<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 사진 업로드 폼</title>
<script type="text/javascript">
	window.onload = function(){
		let image = document.getElementById('image');
		let submit_btn = document.getElementById('submit_btn');
		
		//파일을 선택할 때
		let file = document.getElementById('file');
		//이벤트 연결
		file.onchange = function(){
			if(!file.files[0]){ //선택한 파일이 없을 경우
				image.src='/ch05-ServletMain/images/face.png';
				submit_btn.style.display='none';
				return;
			}
			
			//정상적으로 파일을 선택한 경우
			const reader = new FileReader();
			reader.readAsDataURL(file.files[0]);
			reader.onload = function(){
				image.src = reader.result;
				submit_btn.style.display=''; //none을 지우면 보여진다
			};
		};
	};
</script>
</head>
<body>
<h2>프로필 사진 업로드하기</h2>
<img id="image" src="/ch05-ServletMain/images/face.png" width="200" height="200">
	<form action="s06_profile.jsp" method="post" enctype="multipart/form-data">
		<input type="file" name="file" id="file" accept="image/png, image/jpeg, image/gif">
		<input type="submit" value="전송" style="display:none;" id="submit_btn">
	</form>
</body>
</html>