package kr.web.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DispatcherServlet extends HttpServlet{
	@Override
	public void doGet(HttpServletRequest request,
					  HttpServletResponse response)throws ServletException,IOException{
		requestPro(request,response);
	}
	
	@Override
	public void doPost(HttpServletRequest request,
					   HttpServletResponse response)throws ServletException,IOException{
		requestPro(request,response);
	}
	
	//requestPro는 내부에서만 호출 -> public대신 private으로
	private void requestPro(HttpServletRequest request,
							HttpServletResponse response)throws ServletException,IOException{
		Action com = null; //model 클래스
		String view = null; //jsp 경로
		
		String command = request.getRequestURI(); //context루트부터 구해짐(ch05-ServletMain~)
		System.out.println("1 command : " + command);
		//context루트 제거하고 추출(list.do, write.do, detail.do)
		if(command.indexOf(request.getContextPath())==0) {
			command = command.substring(request.getContextPath().length());
			System.out.println("2 command : " + command);
		}
		
		// /.do = 개별적으로 호출하기 위해 개별 주소를 부여
		if(command == null || command.equals("/list.do")) {
			com = new ListAction();
		}else if(command.equals("/write.do")) {
			com = new WriteAction();
		}else if(command.equals("/detail.do")) {
			com = new DetailAction();
		}else if(command.equals("/update.do")) {
			com = new UpdateAction();
		}else if(command.equals("/delete.do")) {
			com = new DeleteAction();
		}
		
		try {
			//메서드 호출 결과 JSP 경로를 view에 저장
			view = com.execute(request, response); //ListAction의 메서드 호출
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		//forward 방식으로 view(JSP) 호출(forward 방식은 redirect와 달리 주소를 바꾸지 않음)
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
}
