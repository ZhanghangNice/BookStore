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

import com.zh.bean.EbookBean;
import com.zh.util.Dbcp;

public class EbookBaiduServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		List<EbookBean> ebooks = new ArrayList<EbookBean>();
		
		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Dbcp.getConnection(); //百度精选
			pstmt = con.prepareStatement(" select ebookinfo.ebookname, ebookinfo.author, ebookinfo.unitprice, ebookinfo.ebookimage, " +
										 "  ebookinfo.ebooktxt, ebookinfo.link, ebookinfo.downloads from  ebookinfo " 
										+ " order by id ASC " 
										+ " limit 0,12 ");
			rs = pstmt.executeQuery();
			while(rs.next()){
				EbookBean ebook = new EbookBean();
				ebook.setEbookname(rs.getString(1));
				ebook.setAuthor(rs.getString(2));
				ebook.setUnitprice(rs.getDouble(3));
				ebook.setEbookimage(rs.getString(4));
				ebook.setEbooktxt(rs.getString(5));
				ebook.setLink(rs.getString(6));
				ebook.setDownloads(rs.getInt(7));
				ebooks.add(ebook);
			}
			result = "ebook_table.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		request.setAttribute("ebooks", ebooks);
		request.getRequestDispatcher(result).forward(request, response);
	}
}

