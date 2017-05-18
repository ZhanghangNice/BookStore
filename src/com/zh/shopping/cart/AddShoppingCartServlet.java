package com.zh.shopping.cart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;


public class AddShoppingCartServlet extends HttpServlet {
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
		}
		else {
			String  bookid = request.getParameter("bookid");
			Integer  quantity = Integer.valueOf(request.getParameter("quantity"));
			Integer  quantityold = null;
			
			Integer temp = 0;
			String result = null;
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con = Dbcp.getConnection();
				pstmt = con.prepareStatement(" select bookid, quantity from shopcarinfo where userid = ? ");
				pstmt.setInt(1, user.getId());
				rs = pstmt.executeQuery();
				while(rs.next()){
					if(++temp>=10){
						response.sendRedirect("admin/users/shoppingcart.jsp?return=0");
						return;
					}
					if(bookid.equals(rs.getString(1)))
					{
						quantityold = Integer.valueOf(rs.getString(2));
					}
				}
				if(quantityold!=null)
				{
					pstmt = con.prepareStatement("update shopcarinfo set quantity=? where userid=? and bookid=?");
					pstmt.setInt(1, quantity+quantityold);
					pstmt.setInt(2, user.getId());
					pstmt.setString(3, bookid);
					pstmt.executeUpdate();
				}
				else {
					pstmt = con.prepareStatement("insert into shopcarinfo (userid,bookid,quantity) values(?,?,?)", Statement.RETURN_GENERATED_KEYS);
					pstmt.setInt(1, user.getId());
					pstmt.setString(2, bookid);
					pstmt.setInt(3, quantity);
					pstmt.executeUpdate();
				}
				result = "admin/users/shoppingcart.jsp";
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
}


