package com.zh.servlet.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;

public class UpdataUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		SessionUser user = new SessionUser();
		user = (SessionUser) request.getSession().getAttribute("_user");
		if(user==null)
		{
			response.sendRedirect("login.jsp");
			return;
		}
		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("update userinfo   set " +
					"username=?,tel=?,email=?,qq=?,addr=?,sex=?,birthday=?  where userid=?");
			pstmt.setString(1, request.getParameter("username"));
			pstmt.setString(2, request.getParameter("tel"));
			pstmt.setString(3, request.getParameter("email"));
			pstmt.setString(4, request.getParameter("qq"));
			pstmt.setString(5, request.getParameter("addr"));
			pstmt.setString(6, request.getParameter("sex"));
			pstmt.setString(7, request.getParameter("birthday"));
			pstmt.setInt(8, user.getId());
			pstmt.executeUpdate();
			result = "userinformation?temp=1";
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		request.getRequestDispatcher(result).forward(request, response);
	}
}
