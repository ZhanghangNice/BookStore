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

import com.zh.bean.OrderformBean;
import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;

public class UserOrderformServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		
		List<OrderformBean> orderforms = new ArrayList<OrderformBean>();
		
		SessionUser user = new SessionUser();
		user = (SessionUser) request.getSession().getAttribute("_user");//获取当前登录用户id
		if(user==null)//如果用户没有登录，则跳转到登录界面
		{
			response.sendRedirect("login.jsp");
			return;
		}
		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("select A1.address, A1.contact, A1.courier, A1.orderid, A1.orderremark, A1.ordertime, "+
									" A1.quantity, A1.receiver, A2.bookname, A2.bookimage, A2.unitprice, A2.bookid, A1.pay "+
									" from  orderinfo  A1, bookinfo A2 where A1.bookid = A2.bookid AND A1.userid = ?" );
			pstmt.setInt(1, user.getId());
			rs = pstmt.executeQuery();
			while(rs.next()){
				OrderformBean orderform= new OrderformBean();
				orderform.setAddress(rs.getString(1));
				orderform.setContact(rs.getString(2));
				orderform.setCourier(rs.getString(3));
				orderform.setOrderid(rs.getString(4));
				orderform.setOrderremark(rs.getString(5));
				orderform.setOrdertime(rs.getString(6));
				orderform.setQuantity(rs.getInt(7));
				orderform.setReceiver(rs.getString(8));
				orderform.setBookname(rs.getString(9));
				orderform.setBookimage(rs.getString(10));
				orderform.setUnitprice(rs.getDouble(11));
				orderform.setBookid(rs.getString(12));
				orderform.setPay(rs.getString(13));
				orderforms.add(orderform);
			}
			result = "admin/users/orderform_table.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		request.setAttribute("orderforms", orderforms);
		request.getRequestDispatcher(result).forward(request, response);
	}
}

