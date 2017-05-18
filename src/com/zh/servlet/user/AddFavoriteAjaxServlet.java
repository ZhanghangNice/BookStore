package com.zh.servlet.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;


public class AddFavoriteAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		SessionUser user = new SessionUser();
		user = (SessionUser) request.getSession().getAttribute("_user");//获取当前登录用户id
		if(user==null)//如果用户没有登录，则跳转到登录界面
		{
			response.sendRedirect("login.jsp");
			return;
		}
		String  bookid = request.getParameter("bookid");
		String result = null;
		Boolean temp = true;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement(" select bookid from favoriteinfo   where userid = ? ");
			pstmt.setInt(1, user.getId());
			rs = pstmt.executeQuery();
			while(rs.next()){
				if(bookid.equals(rs.getString(1)))
				{
					temp = false;
				}
			}
			if(temp)
			{
				pstmt = con.prepareStatement("insert into favoriteinfo (userid,bookid) values(?,?)", Statement.RETURN_GENERATED_KEYS);
				pstmt.setInt(1, user.getId());
				pstmt.setString(2, bookid);
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
			response.sendRedirect(result);
			return;
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
	}
}



