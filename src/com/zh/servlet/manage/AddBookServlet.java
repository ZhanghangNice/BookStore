package com.zh.servlet.manage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.bean.BookBean;
import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;


public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SessionUser user = new SessionUser();
		user = (SessionUser) request.getSession().getAttribute("_user");
		if(user==null)
		{
			response.sendRedirect("login.jsp");
			return;
		}
		String  booid = null;
		String  bookname = null;
		String  author = null;
		String  publisher = null;
		Double  unitprice = null;
		String  bookimage = null;
		String  summary = null;
		String  classid = null;
		
		List<BookBean> books = (List<BookBean>) request.getAttribute("books");
		for(BookBean i : books){
			booid = i.getBookid();
			bookname = i.getBookname();
			author = i.getAuthor();
			publisher = i.getPublisher();
			unitprice = i.getUnitprice();
			bookimage = i.getBookimage();
			summary = i.getSummary();
			classid = i.getClassid();
		}
		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("insert into bookinfo(bookid,bookname,author,publisher,unitprice,bookimage,classid,summary) values(?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, booid);
			pstmt.setString(2, bookname);
			pstmt.setString(3, author);
			pstmt.setString(4, publisher);
			pstmt.setDouble(5, unitprice);
			pstmt.setString(6, bookimage);
			pstmt.setString(7, classid);
			pstmt.setString(8, summary);
			pstmt.executeUpdate();
			result = "admin/manage/book.jsp?return=1";
		} catch (Exception e) {
			e.printStackTrace();
			result = "admin/manage/book.jsp?return=0";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		response.sendRedirect(result);
	}
}
