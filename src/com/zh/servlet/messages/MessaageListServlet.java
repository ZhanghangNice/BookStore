package com.zh.servlet.messages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.bean.GainMessageBean;
import com.zh.bean.Pagination;
import com.zh.util.Dbcp;
/**
 * 留言列表
 * @author Administrator
 *
 */
public class MessaageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String bookid = request.getParameter("bookid");
		
		List<GainMessageBean> messages = new ArrayList<GainMessageBean>();
		Pagination p=new Pagination();
		p.setRows(10);
		if(request.getParameter("page") == null)
		{
			p.setPage(1);
		}else{
			p.setPage(Integer.valueOf(request.getParameter("page")));
		}	
		Connection con=null;
		PreparedStatement pstmt= null;
		ResultSet rs=null;
		String result = null;
		try {
			con=Dbcp.getConnection();
			pstmt=con.prepareStatement("select count(*) from messageinfo where bookid = ?");
			pstmt.setString(1, bookid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				p.setCount(rs.getInt(1));
				p.setTotal(p.getCount() % p.getRows() == 0 ? p.getCount()/p.getRows() : (p.getCount()/p.getRows() + 1));
			}
			Dbcp.closePreparedStatement(pstmt);
			request.setAttribute("pagination", p);
			
			pstmt=con.prepareStatement("select userinfo.username,messageinfo.mdate,messageinfo.message,messageinfo.userid,messageinfo.thumbnum,messageinfo.mid from messageinfo"
					+ " LEFT JOIN userinfo on messageinfo.userid = userinfo.userid"
					+ " where bookid=?"
					+ " order by mid desc"
					+ " limit ?,?");
			pstmt.setString(1, bookid);
			pstmt.setInt(2, (p.getPage() - 1) * p.getRows());	//除去前几页的总记录条数
			pstmt.setInt(3, p.getRows());	//这一页显示的条数
			rs=pstmt.executeQuery();
			while(rs.next()){
				 GainMessageBean messagebean=new GainMessageBean();
				 messagebean.setName(rs.getString(1));
				 messagebean.setDate(rs.getString(2));
				 messagebean.setMessage(rs.getString(3));
				 messagebean.setUserid(rs.getString(4));
				 messagebean.setThumbnum(rs.getInt(5));
				 messagebean.setMid(rs.getString(6));
				 messages.add(messagebean);
				 }
			result ="message_list.jsp?bookid="+bookid;
			} catch (SQLException e) {
				e.printStackTrace();
				result = "error.jsp";
			}finally {
				Dbcp.closePreparedStatement(pstmt);
				Dbcp.closeConnection(con);
			}
			request.setAttribute("messages", messages);
			request.getRequestDispatcher(result).forward(request, response);
		
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
