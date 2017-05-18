package com.zh.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.digest.DigestUtils;

import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;

public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		SessionUser user = new SessionUser();
		user = (SessionUser) request.getSession().getAttribute("_user");
		if(user==null)
		{
			response.sendRedirect("login.jsp");
			return;
		}
		
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("password");
		
		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("select password from userinfo  where userid=? and password=?");
			pstmt.setInt(1, user.getId());
			pstmt.setString(2, DigestUtils.md5Hex(oldpassword));
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){          //查找
				pstmt = con.prepareStatement("update userinfo  set password=? where userid=?");
				pstmt.setString(1, DigestUtils.md5Hex(newpassword));
				pstmt.setInt(2, user.getId());
				pstmt.executeUpdate();
				result="exitlogin?return=1";
			}else{
				result="admin/users/changepassword.jsp?return=0";
			}
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
