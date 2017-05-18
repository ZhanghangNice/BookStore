package com.zh.servlet.manage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.bean.BookBean;
import com.zh.bean.BookdetailBean;
import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;

public class EditBookServlet extends HttpServlet {
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
		String bookid = request.getParameter("bookid");
		
		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		BookBean book = null;
		BookdetailBean bookdetail = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("select A.bookid, A.bookname, A.author, A.publisher, A.unitprice, " +
					" A.summary, A.classid, B.edition, B.packaging, B.format, B.publdata, B.numpages, " +
					" B.language, B.authorsIntroduce, B.contentIntroduce, B.directory, B.preface " +
					" from bookinfo A, bookdetailinfo B  where A.bookid=?");
			pstmt.setString(1, bookid);      //查询与jsp传过来的bookid相等的数据
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				book = new BookBean();
				book.setBookid(rs.getString(1));
				book.setBookname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPublisher(rs.getString(4));
				book.setUnitprice(rs.getDouble(5));
				book.setSummary(rs.getString(6));
				book.setClassid(rs.getString(7));
				
				bookdetail = new BookdetailBean();
				bookdetail.setEdition(rs.getInt(8));
				bookdetail.setPackaging(rs.getString(9));
				bookdetail.setFormat(rs.getInt(10));
				bookdetail.setPubldata(rs.getString(11));
				bookdetail.setNumpages(rs.getInt(12));
				bookdetail.setLanguage(rs.getString(13));
				bookdetail.setAuthorsIntroduce(rs.getString(14));
				bookdetail.setContentIntroduce(rs.getString(15));
				bookdetail.setDirectory(rs.getString(16));
				bookdetail.setPreface(rs.getString(17));
			}
			result = "admin/manage/editbook.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		request.setAttribute("book", book);
		request.setAttribute("bookdetail", bookdetail);
		request.getRequestDispatcher(result).forward(request, response);
	}
}
