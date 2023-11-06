package kr.web.ch02;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board")
public class BoardServlet extends HttpServlet{
	@Override
	public void doPost(HttpServletRequest request,
					   HttpServletResponse response)throws ServletException,IOException {
		/*
		 * [실습]
		 * name,title,content 전송된 데이터를 반환 받아서 출력
		 * [출력예시]
		 * 이름 : 홍길동
		 * 제목 : 11월의 더위
		 * 내용 : 겨울답지 않은 겨울이네요~
		 */
		
		response.setContentType("text/html;charset=utf-8");
		
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>게시판</title></head>");
		out.println("<body>");
		out.println("이름 : "+name+"<br>");
		out.println("제목 : "+title+"<br>");
		out.println("내용 : "+content+"<br>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
