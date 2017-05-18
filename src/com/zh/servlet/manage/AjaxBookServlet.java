package com.zh.servlet.manage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.util.Dbcp;

public class AjaxBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		String bookid = request.getParameter("bookid");
		String bookidA = request.getParameter("bookidA");
		String ebookid = request.getParameter("ebookid");
		String username = request.getParameter("username");
		
		PrintWriter out = response.getWriter();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			if(bookid!=null)
			{
				pstmt = con.prepareStatement("select * from bookinfo  where bookid=?");
				pstmt.setString(1, bookid);
			}if(bookidA!=null)
			{
				pstmt = con.prepareStatement("select bookid from  bookdetailinfo where bookid=?");
				pstmt.setString(1, bookidA);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()){
					out.write("true");
					return;
				}
				pstmt = con.prepareStatement("select * from bookinfo  where bookid=?");
				pstmt.setString(1, bookidA);
				rs = pstmt.executeQuery();
				if(rs.next()){
					out.write("false");
					return;
				}else {
					out.write("true");
					return;
				}
			}if(ebookid!=null)
			{
				pstmt = con.prepareStatement("select * from ebookinfo  where ebookid=?");
				pstmt.setString(1, ebookid);
			}
			if(username!=null)
			{
				pstmt = con.prepareStatement("select * from userinfo  where username=?");
				pstmt.setString(1, username);
			}
			ResultSet rs1 = pstmt.executeQuery();
			if(rs1.next()){
				out.write("true");
			}else {
				out.write("false");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("login.jsp");
			return;
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
			out.close();
		}
	}
}
