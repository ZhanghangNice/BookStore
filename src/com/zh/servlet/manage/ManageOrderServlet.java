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

import com.zh.bean.OrderformBean;
import com.zh.bean.Pagination;
import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;

public class ManageOrderServlet extends HttpServlet {
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
		List<OrderformBean> orders = new ArrayList<OrderformBean>();
		
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
			pstmt = con.prepareStatement("select count(*) from orderinfo");
			rs = pstmt.executeQuery();
			if(rs.next()){
				p.setCount(rs.getInt(1));
				p.setTotal(p.getCount() % p.getRows() == 0 ? p.getCount()/p.getRows() : (p.getCount()/p.getRows() + 1));
			}
			Dbcp.closePreparedStatement(pstmt);
			request.setAttribute("pagination", p);
			
			//查询分页数据
			pstmt = con.prepareStatement(" select A1.address, A1.contact, A1.courier, A1.orderid, A1.orderremark, "+
										" A1.ordertime, A1.quantity, A1.receiver, A2.bookname, A2.bookimage, " +
										" A2.unitprice, A3.username, A3.userid, A1.id, A1.pay "+
										" from  orderinfo  A1, bookinfo A2, userinfo A3 "+
										" WHERE  A1.userid = A3.userid AND A1.bookid = A2.bookid "+
										" order by ordertime ASC "+
										" limit ?,?");
			pstmt.setInt(1, (p.getPage() - 1) * p.getRows());
			pstmt.setInt(2, p.getRows());
			rs = pstmt.executeQuery();
			while(rs.next()){
				OrderformBean order = new OrderformBean();
				order.setAddress(rs.getString(1));
				order.setContact(rs.getString(2));
				order.setCourier(rs.getString(3));
				order.setOrderid(rs.getString(4));
				order.setOrderremark(rs.getString(5));
				order.setOrdertime(rs.getString(6));
				order.setQuantity(rs.getInt(7));
				order.setReceiver(rs.getString(8));
				order.setBookname(rs.getString(9));
				order.setBookimage(rs.getString(10));
				order.setUnitprice(rs.getDouble(11));
				order.setUsername(rs.getString(12));
				order.setUserid(rs.getInt(13));
				order.setId(rs.getInt(14));
				order.setPay(rs.getString(15));
				orders.add(order);
			}
			result = "admin/manage/manageorder_table.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		request.setAttribute("orders", orders);
		request.getRequestDispatcher(result).forward(request, response);
	}
}
