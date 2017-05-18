package com.zh.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.validator.GenericValidator;

import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;
import com.zh.vcode.ValidateCode;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String vcode = request.getParameter("vcode");
		String svcode = (String)request.getSession(true).getAttribute(ValidateCode.VCODE_SESSION_KEY);

		//存放错误的数组ssss
		List<String> errors = new ArrayList<String>();
		
		//验证码
		if(!vcode.toLowerCase().equals(svcode.toLowerCase())){
			errors.add("验证码错误");
			request.setAttribute("errors", errors); 
			//request.setAttribute()和getAttribute()方法传递的数据只会存在于Web容器内部
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		
		//用户名和密码
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		if(GenericValidator.isBlankOrNull(username)){
			errors.add("用户名不能为空");
		}
		if(GenericValidator.isBlankOrNull(password)){
			errors.add("密码不能为空");
		}
		if(!GenericValidator.minLength(username, 2) || !GenericValidator.maxLength(username, 16)){
			errors.add("用户名长度介于[3,16]之间");
		}
		if(!GenericValidator.minLength(password, 6) || !GenericValidator.maxLength(password, 16)){
			errors.add("密码长度介于[6,16]之间");
		}
		if(errors.size() > 0){
			request.setAttribute("errors", errors);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		
		SessionUser user = new SessionUser();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("select userid,username,permission from userinfo  where username=? and password=? LIMIT 1");
			pstmt.setString(1, username);
			pstmt.setString(2, DigestUtils.md5Hex(password));
			rs = pstmt.executeQuery();
			if(rs.next()){
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setPermission(rs.getInt(3));
				
				//HttpSession session = request.getSession(true);
				//session.setAttribute("userid", user);
				//session周期的javabean
				request.getSession().setAttribute("_user", user);
				response.sendRedirect("index.jsp");
			}else{
				errors.add("用户名或者密码错误");
				request.setAttribute("errors", errors);
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
	}

}
