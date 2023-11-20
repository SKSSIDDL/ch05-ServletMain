package kr.web.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DetailAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//request에 데이터 저장
		request.setAttribute("message", "상세페이지 입니다.");
		
		//JSP에 경로 반환
		return "/ch22-mvc/detail.jsp";
	}

}
