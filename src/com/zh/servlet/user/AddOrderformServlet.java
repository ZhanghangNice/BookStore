package com.zh.servlet.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.bean.SessionUser;
import com.zh.process.RandomNumberGenerator;
import com.zh.util.Dbcp;


public class AddOrderformServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		SessionUser user = new SessionUser();
		user = (SessionUser) request.getSession().getAttribute("_user");//获取当前登录用户id
		if(user==null)//如果用户没有登录，则跳转到登录界面
		{
			response.sendRedirect("login.jsp");
			return;
		}
		
		RandomNumberGenerator order = new RandomNumberGenerator();
		String   orderid = order.generateNumber();
		String   pay = request.getParameter("pay");
		String   receiver = request.getParameter("receiver"); //收货人
		String   address = request.getParameter("address");
		String   contact = request.getParameter("contact");  
		String   orderremark = request.getParameter("orderremark");

		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			if(request.getParameter("temp").equals("0"))
			{
				pstmt = con.prepareStatement("select A.bookid, A.quantity " +
						" FROM shopcarinfo A WHERE A.userid = ? ");
				pstmt.setInt(1, user.getId());
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					pstmt = con.prepareStatement("insert into orderinfo(orderid, userid, bookid, quantity, ordertime, receiver, address, contact, orderremark, pay) values(?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
					pstmt.setString(1, orderid);
					pstmt.setInt(2, user.getId());
					pstmt.setString(3, rs.getString(1));
					pstmt.setInt(4, rs.getInt(2));
					SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					pstmt.setString(5, time.format(new Date()));
					pstmt.setString(6, receiver);
					pstmt.setString(7, address);
					pstmt.setString(8, contact);
					pstmt.setString(9, orderremark);
					pstmt.setString(10, pay);
					pstmt.executeUpdate();
					pstmt = con.prepareStatement("delete from shopcarinfo  where userid=? and bookid=?");
					pstmt.setInt(1, user.getId());
					pstmt.setString(2, rs.getString(1));
					pstmt.executeUpdate();
					pstmt = con.prepareStatement("update bookinfo set buynum=buynum+? where bookid=?");
					pstmt.setInt(1, rs.getInt(2));
					pstmt.setString(2, rs.getString(1));
				}
			}else{
				pstmt = con.prepareStatement("insert into orderinfo(orderid, userid, bookid, quantity, ordertime, receiver, address, contact, orderremark, pay) values(?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
				pstmt.setString(1, orderid);
				pstmt.setInt(2, user.getId());
				pstmt.setString(3, request.getParameter("bookid"));
				pstmt.setInt(4, Integer.valueOf(request.getParameter("quantity")));
				SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				pstmt.setString(5, time.format(new Date()));
				pstmt.setString(6, receiver);
				pstmt.setString(7, address);
				pstmt.setString(8, contact);
				pstmt.setString(9, orderremark);
				pstmt.setString(10, pay);
				pstmt.executeUpdate();
				pstmt = con.prepareStatement("update bookinfo set buynum=buynum+? where bookid=?");
				pstmt.setInt(1, Integer.valueOf(request.getParameter("quantity")));
				pstmt.setString(2, request.getParameter("bookid"));
			}
			result = "admin/users/ordersucceed.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		response.sendRedirect(result);
	}
}

