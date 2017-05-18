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

import com.zh.bean.Pagination;
import com.zh.bean.SessionUser;
import com.zh.bean.UserBean;
import com.zh.util.Dbcp;

public class ManageUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		SessionUser userid = new SessionUser();
		userid = (SessionUser) request.getSession().getAttribute("_user");
		if(userid==null)
		{
			response.sendRedirect("login.jsp");
			return;
		}
		List<UserBean> users = new ArrayList<UserBean>();
		
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
			pstmt = con.prepareStatement("select count(*) from userinfo");   //查询记录总数
			rs = pstmt.executeQuery();
			if(rs.next()){
				p.setCount(rs.getInt(1));
				p.setTotal(p.getCount() % p.getRows() == 0 ? p.getCount()/p.getRows() : (p.getCount()/p.getRows() + 1));
			}
			Dbcp.closePreparedStatement(pstmt);
			request.setAttribute("pagination", p);
			
			//查询分页数据
			pstmt = con.prepareStatement("select userid,username,tel,email,qq,addr,sex,birthday,permission from  userinfo" 
										+ " order by userid ASC" 
										+ " limit ?,?");
			pstmt.setInt(1, (p.getPage() - 1) * p.getRows());
			pstmt.setInt(2, p.getRows());
			rs = pstmt.executeQuery();
			while(rs.next()){
				UserBean user = new UserBean();
				user.setUserid(rs.getInt(1));
				user.setUsername(rs.getString(2));
				user.setTel(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setQq(rs.getString(5));
				user.setAddr(rs.getString(6));
				user.setSex(rs.getString(7));
				user.setBirthday(rs.getString(8));
				user.setPermission(rs.getBoolean(9));
				users.add(user);
			}
			result = "admin/manage/manageuser_table.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		
		request.setAttribute("users", users);
		request.getRequestDispatcher(result).forward(request, response);
	}
}
