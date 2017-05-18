package com.zh.servlet.search;

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
import com.zh.util.Dbcp;

public class UnitpriceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		String unitprice1 = request.getParameter("unitprice1");
		String unitprice2 = request.getParameter("unitprice2");
		if(unitprice1==null)
		{
			unitprice1 = "0";
		}if(unitprice2==null)
		{
			unitprice2 = "99999999";
		}
		request.setAttribute("search_unitprice1", unitprice1);
		request.setAttribute("search_unitprice2", unitprice2);
		
		List<BookBean> books = new ArrayList<BookBean>();
		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("select bookid, bookname, author, unitprice, bookimage from bookinfo " +
										 " where unitprice  between ? and ? ");
			pstmt.setString(1, unitprice1);
			pstmt.setString(2, unitprice2);
			rs = pstmt.executeQuery();
			while(rs.next()){
				BookBean book = new BookBean();
				book.setBookid(rs.getString(1));
				book.setBookname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setUnitprice(rs.getDouble(4));
				book.setBookimage(rs.getString(5));
				books.add(book);
			}
			result = "search.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		request.setAttribute("books", books);
		request.getRequestDispatcher(result).forward(request, response);
	}
}
