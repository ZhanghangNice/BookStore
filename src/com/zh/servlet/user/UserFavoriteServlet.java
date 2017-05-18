package com.zh.servlet.user;

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

import com.zh.bean.BookBean;
import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;

public class UserFavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		
		List<BookBean> favorites = new ArrayList<BookBean>();
		
		SessionUser user = new SessionUser();
		user = (SessionUser) request.getSession().getAttribute("_user");//获取当前登录用户id
		
		if(user==null)//如果用户没有登录，则跳转到登录界面
		{
			response.sendRedirect("login.jsp");
			return;
		}
		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("select bookinfo.bookid, bookinfo.bookname, bookinfo.author, bookinfo.publisher, " +
										 " bookinfo.unitprice, bookinfo.summary, bookinfo.bookimage " +
										" from favoriteinfo,bookinfo  " +
										" where favoriteinfo.bookid = bookinfo.bookid and favoriteinfo.userid = ? " );
			pstmt.setInt(1, user.getId());
			rs = pstmt.executeQuery();
			while(rs.next()){ 
				BookBean favorite = new BookBean();
				favorite.setBookid(rs.getString(1));
				favorite.setBookname(rs.getString(2));
				favorite.setAuthor(rs.getString(3));
				favorite.setPublisher(rs.getString(4));
				favorite.setUnitprice(rs.getDouble(5));
				favorite.setSummary(rs.getString(6));
				favorite.setBookimage(rs.getString(7));
				favorites.add(favorite);
			}
			result = "admin/users/userfavorite_table.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		request.setAttribute("favorites", favorites);
		request.getRequestDispatcher(result).forward(request, response);
	}
}

