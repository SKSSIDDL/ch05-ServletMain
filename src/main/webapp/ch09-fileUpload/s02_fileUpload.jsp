<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %> <%-- 얘를 이용해서 upload 처리함 --%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> <%-- 파일이 중복됐을 때 덮어씌우지 않게 파일명을 바꿔서 보호 (동일 파일 보호) --%>
<%@ page import="java.io.File" %> <%-- java file객체로 변환시켜서 용량 구하려고 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 처리</title>
</head>
<body>
<%
   //파일 업로드 경로
   String saveFolder = "/upload"; // 상대경로를 넣어서 절대경로를 구하려고 함
   String encType = "utf-8"; //인코딩 타입
   int maxSize = 5*1024*1024;//파일의 최대 업로드 사이즈(5mb)
   
   //파일 업로드 절대 경로 구하기
   String realFolder = application.getRealPath(saveFolder); //application.getRealPath로 해당 context에 있는 경로 넣어줌
   out.println("파일 업로드 절대 경로 : " + realFolder + "<br>");
   out.println("------------------------------------<br>");
   
   //파일 업로드 할 때에는 request.getParameter가 동작을 안함 (이름 같은거 빼낼 때 multi.getParameter 써야함)
   //그래서 통째로 request를 넘기고  MultipartRequest를 사용해야함
   
   //파일 업로드 처리 및 정보 읽기
   MultipartRequest multi = new MultipartRequest(request, //request 통째로 넘기기
                                    realFolder, //upload 절대경로
                                    maxSize, //파일 최대 업로드 사이즈
                                    encType, //인코딩 타입
                           new DefaultFileRenamePolicy()); //이미 업로드된 파일과 동일한 파일명일 경우 파일명 교체
   
   out.println("작성자 : " + multi.getParameter("user") + "<br>");
   out.println("제목 : " + multi.getParameter("title") + "<br>");
   out.println("------------------------------------<br>");
   
   //파일 정보 읽어오기
   //전송전 원래의 파일 이름 (defaultfilerenamepolicy가 이름을 변경했을 수도 있어서 originalname을 찾는거임)
   String original = multi.getOriginalFileName("uploadFile"); //파라미터 name이 식별자가 됨
   //서버에 저장된 파일 이름
   String filename = multi.getFilesystemName("uploadFile");
   out.println("전송전 원래의 파일 이름 : " + original + "<br>");
   out.println("서버에 저장된 파일 이름 : " + filename + "<br>");
   
   //전송된 file의 컨텐트 타입 / 문서 타입도 알아낼 수 있음 (zip,img,..)
   //upload를 금지하는 타입이 있는데 우선 타입을 알아보고 처리할 수 있게끔 함 (컨텐트 타입에 따라 처리 달리 할 수 있음)
   String type = multi.getContentType("uploadFile");
   out.println("컨텐트 타입 : " + type + "<br>");
   
   //파일의 용량 구하기 (용량구하는 메서드가 별도로 없어서 file로 변환)
   File file = multi.getFile("uploadFile");
   out.println("파일 용량 : " + file.length() + "bytes");
   
%>
</body>
</html>