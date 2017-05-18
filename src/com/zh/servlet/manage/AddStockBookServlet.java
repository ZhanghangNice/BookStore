package com.zh.servlet.manage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;

//添加进货信息
public class AddStockBookServlet extends HttpServlet {
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
		if(user==null)
		{
			response.sendRedirect("login.jsp");
			return;
		}
		String   s_price = request.getParameter("stockprice");
		Double   stockprice = Double.valueOf(s_price).doubleValue();
		String   s_quantity = request.getParameter("stockquantity");
		Integer  stockquantity = new Integer(s_quantity);   //数量
		
		String result = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			//查询图书信息表，是否存在此书
			/*pstmt = con.prepareStatement("select bookid from  bookinfo   where bookid=?");
			pstmt.setString(1, bookid);
			ResultSet resultSet = pstmt.executeQuery();
			if(!resultSet.next()){
				request.getRequestDispatcher("admin/manage/book.jsp?error=0").forward(request, response);
			}*/
			pstmt = con.prepareStatement("insert into stockinfo(stockid,userid,bookid,stockprice,stockquantity,stockdate,stockremark) values(?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, request.getParameter("stockid"));
			pstmt.setInt(2, user.getId());
			pstmt.setString(3, request.getParameter("bookid"));
			pstmt.setDouble(4, stockprice);
			pstmt.setInt(5, stockquantity);
			/*SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			pstmt.setString(6, time.format(new Date()));*/
			pstmt.setString(6,request.getParameter("stockdate"));
			pstmt.setString(7, request.getParameter("stockremark"));
			pstmt.executeUpdate();
			
			result = "admin/manage/stockbook.jsp?return=1";
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
