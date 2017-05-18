package com.zh.servlet.messages;

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

public class HotBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			List<BookBean> books = new ArrayList<BookBean>();
		
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				con = Dbcp.getConnection();
				pstmt = con.prepareStatement("select bookid,bookname from bookinfo  order by buynum desc limit 0,30 ");
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					BookBean book=new BookBean();
					book.setBookid(rs.getString(1));
					book.setBookname(rs.getString(2));
					books.add(book);
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally{
				Dbcp.closePreparedStatement(pstmt);
				Dbcp.closeConnection(con);
			}
			request.setAttribute("books", books);
			request.getRequestDispatcher("hotbook.jsp").forward(request, response);
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
