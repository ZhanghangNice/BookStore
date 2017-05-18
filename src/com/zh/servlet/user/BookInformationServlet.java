package com.zh.servlet.user;

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
import com.zh.util.Dbcp;

public class BookInformationServlet extends HttpServlet {
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
		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		BookBean book = null;
		BookdetailBean bookdetail = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("select A.bookid, A.bookname, A.author, A.publisher, " +
					" A.unitprice, A.summary, A.bookimage, A.buynum, A.classid, " +
					" B.edition, B.packaging, B.format, B.publdata, B.numpages, B.language, " +
					" B.authorsIntroduce, B.contentIntroduce, B.directory, B.preface, B.bigImage " +
					" from bookinfo A, bookdetailinfo B  where " +
					" A.bookid = B.bookid AND A.bookid=? ");
			pstmt.setString(1, bookid);          //查询与jsp传过来的bookid相等的数据
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				book = new BookBean();
				bookdetail = new BookdetailBean();
				
				book.setBookid(rs.getString(1));
				book.setBookname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPublisher(rs.getString(4));
				book.setUnitprice(rs.getDouble(5));
				book.setSummary(rs.getString(6));
				book.setBookimage(rs.getString(7));
				book.setBuynum(rs.getInt(8));
				book.setClassid(rs.getString(9));
				
				bookdetail.setEdition(rs.getInt(10));
				bookdetail.setPackaging(rs.getString(11));
				bookdetail.setFormat(rs.getInt(12));
				bookdetail.setPubldata(rs.getString(13));
				bookdetail.setNumpages(rs.getInt(14));
				bookdetail.setLanguage(rs.getString(15));
				
				String  temp = rs.getString(16);
				if(temp.equals(" "))
					{temp = "抱歉，暂无介绍";}
				bookdetail.setAuthorsIntroduce(temp);
				
				temp = rs.getString(17);
				if(temp.equals(" "))
					{temp = "抱歉，暂无简介";}
				bookdetail.setContentIntroduce(temp);
				
				temp = rs.getString(18);
				if(temp.equals(" "))
					{temp = "抱歉，暂无目录";}

				bookdetail.setDirectory(temp.length()>500?temp.substring(0, 398)+"...":temp);
				
				temp = rs.getString(19);
				if(temp.equals(" "))
					{temp = "抱歉，暂无前言";}
				bookdetail.setPreface(temp.length()>500?temp.substring(0, 398)+"...":temp);
				
				bookdetail.setBigImage(rs.getString(20));
			}
			result = "bookinformation.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		request.setAttribute("bookdetail", bookdetail);
		request.setAttribute("book", book);
		request.getRequestDispatcher(result).forward(request, response);
	}
}
