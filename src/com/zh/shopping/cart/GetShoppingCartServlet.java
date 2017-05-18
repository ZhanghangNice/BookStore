package com.zh.shopping.cart;

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

import com.zh.bean.CartBean;
import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;

public class GetShoppingCartServlet extends HttpServlet {
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
		user = (SessionUser) request.getSession().getAttribute("_user");//获取当前登录用户id
		if(user==null)//如果用户没有登录，则跳转到登录界面
		{
			response.sendRedirect("login.jsp");
			return;
		}
		List<CartBean> carts = new ArrayList<CartBean>();
		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("select A.bookid, B.bookname, A.quantity, B.author, B.unitprice, B.bookimage " +
					" FROM shopcarinfo A, bookinfo B WHERE A.bookid = B.bookid AND A.userid = ? ");
			pstmt.setInt(1, user.getId());
			ResultSet rs = pstmt.executeQuery();
			Integer tempInteger = 1;
			while(rs.next()){
				CartBean cart = new CartBean();
				cart.setCount(tempInteger++);
				cart.setBookid(rs.getString(1));
				cart.setBookname(rs.getString(2));
				cart.setQuantity(rs.getInt(3));
				cart.setAuthor(rs.getString(4));
				cart.setUnitprice(rs.getDouble(5));
				cart.setBookimage(rs.getString(6));
				carts.add(cart);
			}
			result = "admin/users/shoppingcart_table.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		request.setAttribute("carts", carts);
		request.getRequestDispatcher(result).forward(request, response);
	}
}
