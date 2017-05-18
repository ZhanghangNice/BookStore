package com.zh.servlet.manage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;

public class UpdateBookServlet extends HttpServlet {
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
		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("update bookinfo  set " 
										+ "bookid=?, bookname=?,author=?,publisher=?,unitprice=?,summary=?,classid=?" 
										+ "where bookid=?");
			pstmt.setString(1, request.getParameter("bookid"));
			pstmt.setString(2, request.getParameter("bookname"));
			pstmt.setString(3, request.getParameter("author"));
			pstmt.setString(4, request.getParameter("publisher"));
			pstmt.setDouble(5, Double.valueOf(request.getParameter("unitprice")).doubleValue());
			pstmt.setString(6, request.getParameter("summary"));
			pstmt.setString(7, request.getParameter("classid"));
			pstmt.setString(8, request.getParameter("bookid"));
			pstmt.executeUpdate();
			
			pstmt = con.prepareStatement("update bookdetailinfo  set " +
					 " edition=?, packaging=?, format=?, publdata=?, numpages=?, language=?, " +
					 " authorsIntroduce=?, contentIntroduce=?, directory=?, preface=?" +
					 " where bookid=?");
			pstmt.setInt(1, Integer.valueOf(request.getParameter("edition")));
			pstmt.setString(2, request.getParameter("packaging"));
			pstmt.setInt(3, Integer.valueOf(request.getParameter("format")));
			pstmt.setString(4, request.getParameter("publdata"));
			pstmt.setInt(5, Integer.valueOf(request.getParameter("numpages")));
			pstmt.setString(6, request.getParameter("language"));
			pstmt.setString(7, request.getParameter("authorsIntroduce"));
			pstmt.setString(8, request.getParameter("contentIntroduce"));
			pstmt.setString(9, request.getParameter("directory"));
			pstmt.setString(10, request.getParameter("preface"));
			pstmt.setString(11, request.getParameter("bookid"));
			pstmt.executeUpdate();
			result = "admin/manage/managebook.jsp?edit=1";
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		response.sendRedirect(result);
	}
}
