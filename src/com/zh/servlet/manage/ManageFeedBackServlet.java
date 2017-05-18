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

import com.zh.bean.FeedBackBean;
import com.zh.bean.Pagination;
import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;

public class ManageFeedBackServlet extends HttpServlet {
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
		List<FeedBackBean> feedbacks = new ArrayList<FeedBackBean>();
		
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
			con = Dbcp.getConnection();
			//查询记录总数
			pstmt = con.prepareStatement("select count(*) from feedbackinfo");
			rs = pstmt.executeQuery();
			if(rs.next()){
				p.setCount(rs.getInt(1));
				p.setTotal(p.getCount() % p.getRows() == 0 ? p.getCount()/p.getRows() : (p.getCount()/p.getRows() + 1));
			}
			Dbcp.closePreparedStatement(pstmt);
			request.setAttribute("pagination", p);
			
			//查询分页数据
			pstmt = con.prepareStatement(" select A1.type, A1.link, A1.content, A1.phone, A1.img, A1.time, A1.id " +
										" from  feedbackinfo A1   order by A1.id ASC "+
										" limit ?,? ");
			pstmt.setInt(1, (p.getPage() - 1) * p.getRows());
			pstmt.setInt(2, p.getRows());
			rs = pstmt.executeQuery();
			while(rs.next()){
				FeedBackBean feedBack = new FeedBackBean();
				feedBack.setType(rs.getString(1));
				feedBack.setLink(rs.getString(2));
				feedBack.setContent(rs.getString(3));
				feedBack.setPhone(rs.getString(4));
				feedBack.setImg(rs.getString(5));
				feedBack.setTime(rs.getString(6));
				feedBack.setId(rs.getInt(7));
				feedbacks.add(feedBack);
			}
			result = "admin/manage/managefeedback_table.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		request.setAttribute("feedbacks", feedbacks);
		request.getRequestDispatcher(result).forward(request, response);
	}
}
