package com.zh.servlet;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Exit extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public void init(ServletConfig config) throws ServletException{
		super.init(config);
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer temp = Integer.valueOf(request.getParameter("return"));
		if(temp==1){  //修改密码后返回登录页面，重新登录
			HttpSession session = request.getSession();
			session.invalidate();                     //销毁用户的session
			response.sendRedirect("login.jsp?return=1");
		}else {
			HttpSession session = request.getSession();
			session.invalidate();                     //销毁用户的session
			response.sendRedirect("index.jsp");
		}
	}
}
