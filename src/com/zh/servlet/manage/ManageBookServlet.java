package com.zh.servlet.manage;

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
import com.zh.bean.Pagination;
import com.zh.util.Dbcp;

public class ManageBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		List<BookBean> books = new ArrayList<BookBean>();
		
		Pagination p = new Pagination();
		if(request.getParameter("page") != null){
			p.setPage(Integer.valueOf(request.getParameter("page")));
		}
		if(request.getParameter("rows") != null){
			p.setRows(Integer.valueOf(request.getParameter("rows")));
		}
		
		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Dbcp.getConnection();  //查询记录总数
			pstmt = con.prepareStatement("select count(*) from bookinfo");
			rs = pstmt.executeQuery();
			if(rs.next()){
				p.setCount(rs.getInt(1));
				p.setTotal(p.getCount() % p.getRows() == 0 ? p.getCount()/p.getRows() : (p.getCount()/p.getRows() + 1));
			}
			Dbcp.closePreparedStatement(pstmt);
			request.setAttribute("pagination", p);
			
			//查询分页数据
			pstmt = con.prepareStatement("select bookinfo.bookid, bookinfo.bookname, bookinfo.author, bookinfo.publisher, bookinfo.unitprice, bookinfo.summary, bookinfo.bookimage, bookclassinfo.classname from bookinfo " 
										+ " left join bookclassinfo  on bookclassinfo.classid = bookinfo.classid "
										+ " order by bookid ASC " 
										+ " limit ?,?");
			pstmt.setInt(1, (p.getPage() - 1) * p.getRows());
			pstmt.setInt(2, p.getRows());
			rs = pstmt.executeQuery();
			while(rs.next()){
				BookBean book = new BookBean();
				book.setBookid(rs.getString(1));
				book.setBookname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPublisher(rs.getString(4));
				book.setUnitprice(rs.getDouble(5));
				book.setSummary(rs.getString(6));
				book.setBookimage(rs.getString(7));
				book.setClassid(rs.getString(8));
				books.add(book);
			}
			result = "admin/manage/managebook_table.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			result = "index.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		request.setAttribute("books", books);
		request.getRequestDispatcher(result).forward(request, response);
	}
}
