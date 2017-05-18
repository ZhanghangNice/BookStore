package com.zh.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import com.zh.bean.UserBean;
import com.zh.util.Dbcp;

public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		UserBean user = new UserBean();
		user.setUsername(request.getParameter("username"));
		user.setPassword(DigestUtils.md5Hex(request.getParameter("password")));
		user.setTel(request.getParameter("tel"));
		
		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("insert into userinfo(username,password,tel) values(?,?,?)", Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, user.getUsername());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getTel());
			pstmt.executeUpdate();
			result = "login.jsp?return=1";
		} catch (Exception e) {
			e.printStackTrace();
			result="error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		request.getRequestDispatcher(result).forward(request, response);
	}
}
