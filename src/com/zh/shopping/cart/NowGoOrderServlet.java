package com.zh.shopping.cart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.bean.BookBean;
import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;

public class NowGoOrderServlet extends HttpServlet {
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
		List<BookBean> orbooks = new ArrayList<BookBean>();
		String result = null;
		Connection con = null;
		Double sum = 0.00;
		Double sumA = 0.00;
		DecimalFormat df = new DecimalFormat("#.00"); 
		Integer postage = 20;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("select B.bookid, B.bookname, B.author, B.unitprice, B.bookimage, " +
					" B.publisher, B.summary FROM bookinfo B WHERE B.bookid = ? ");
			pstmt.setString(1, request.getParameter("bookid"));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				BookBean orbook = new BookBean();
				orbook.setBookid(rs.getString(1));
				orbook.setBookname(rs.getString(2));
				orbook.setAuthor(rs.getString(3));
				orbook.setUnitprice(rs.getDouble(4));
				sum += rs.getDouble(4)*Integer.valueOf(request.getParameter("quantity"));
				orbook.setBookimage(rs.getString(5));
				orbook.setPublisher(rs.getString(6));
				orbook.setSummary(rs.getString(7));
				orbook.setQuantity(Integer.valueOf(request.getParameter("quantity")));
				orbooks.add(orbook);
			}
			result = "admin/users/nowaddorderform.jsp";
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		if(sum>=100.00)
		{
			sumA = sum-20.00;
			request.setAttribute("sumA", df.format(sumA));
			request.setAttribute("sum", df.format(sum));
			request.setAttribute("postage", postage);
		}
		else{
			sumA=sum;
			postage=0;
			request.setAttribute("sumA", df.format(sumA));
			request.setAttribute("sum", df.format(sum));
			request.setAttribute("postage", postage);
		}
		request.setAttribute("orbooks", orbooks);
		request.getRequestDispatcher(result).forward(request, response);
	}
}
