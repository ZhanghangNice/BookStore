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

import com.zh.bean.EbookBean;
import com.zh.bean.Pagination;
import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;

public class ManageEBookServlet extends HttpServlet {
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
		List<EbookBean> ebooks = new ArrayList<EbookBean>();
		
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
			pstmt = con.prepareStatement("select count(*) from ebookinfo");
			rs = pstmt.executeQuery();
			if(rs.next()){
				p.setCount(rs.getInt(1));
				p.setTotal(p.getCount() % p.getRows() == 0 ? p.getCount()/p.getRows() : (p.getCount()/p.getRows() + 1));
			}
			Dbcp.closePreparedStatement(pstmt);
			request.setAttribute("pagination", p);
			
			//查询分页数据
			pstmt = con.prepareStatement("select ebookinfo.id, ebookinfo.ebookname, ebookinfo.author, ebookinfo.unitprice, " +
					" ebookinfo.summary, ebookinfo.ebookimage, ebookinfo.ebooktxt, bookclassinfo.classname from ebookinfo " 
										+ " left join bookclassinfo  on bookclassinfo.classid = ebookinfo.eclassid "
										+ " order by id ASC "
										+ " limit ?,? ");
			pstmt.setInt(1, (p.getPage() - 1) * p.getRows());
			pstmt.setInt(2, p.getRows());
			rs = pstmt.executeQuery();
			while(rs.next()){
				EbookBean ebook = new EbookBean();
				ebook.setId(rs.getInt(1));
				ebook.setEbookname(rs.getString(2));
				ebook.setAuthor(rs.getString(3));
				ebook.setUnitprice(rs.getDouble(4));
				ebook.setSummary(rs.getString(5));
				ebook.setEbookimage(rs.getString(6));
				ebook.setEbooktxt(rs.getString(7));
				ebook.setClassid(rs.getString(8));
				ebooks.add(ebook);
			}
			result = "admin/manage/manageEbook_table.jsp";
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
