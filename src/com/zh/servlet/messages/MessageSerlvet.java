package com.zh.servlet.messages;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.bean.MessageBean;
import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;


public class MessageSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		SessionUser user = new SessionUser();
		user = (SessionUser) request.getSession().getAttribute("_user");
		if(user==null)//如果用户没有登录，则跳转到登录界面
		{
			response.sendRedirect("login.jsp");
			return;
		}
		Date now = new Date();// 得到系统时间
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy/MM/dd HH:mm:ss");
		String mdata = dateFormat.format(now);

		MessageBean mb = new MessageBean();
		mb.setMdate(mdata);
		mb.setMessage(request.getParameter("mess"));
		mb.setBookid(request.getParameter("bookid"));
		mb.setUserid(Integer.valueOf(request.getParameter("userid")));

		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement( "select count(*) from orderinfo where userid=? and bookid= ?");
			pstmt.setInt(1, user.getId());
			pstmt.setString(2, request.getParameter("bookid"));
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				mb.setIsmessage(rs.getInt(1));				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
			if(mb.getIsmessage()== 0){  //需要购买此商品才能评论
			request.setAttribute("ismessage", "no_buy");
			request.getRequestDispatcher("bookinformation?bookid="+mb.getBookid()+"").forward(request, response);
		}else {
			try {
				con = Dbcp.getConnection();
				pstmt = con.prepareStatement( "select count(*) from messageinfo where userid=? and bookid= ?");
				pstmt.setInt(1, mb.getUserid());
				pstmt.setString(2, mb.getBookid());
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					mb.setIsmessage(rs.getInt(1));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				Dbcp.closePreparedStatement(pstmt);
				Dbcp.closeConnection(con);
			}
			if(mb.getIsmessage()==1){
				//out.write("您已经评论过，不可以再评论！！");
				request.setAttribute("ismessage", "message_no");
				request.getRequestDispatcher("bookinformation?bookid="+mb.getBookid()+"").forward(request, response);
			}else {
				try {
					con = Dbcp.getConnection();
					pstmt = con.prepareStatement(
						"insert into messageinfo(mdate,message,bookid,userid,ismessage) values(?,?,?,?,1)",
						Statement.RETURN_GENERATED_KEYS);
					pstmt.setString(1, mb.getMdate());
					pstmt.setString(2, mb.getMessage());
					pstmt.setString(3, mb.getBookid());
					pstmt.setInt(4, mb.getUserid());
					pstmt.executeUpdate();	// 添加留言信息
					/*pstmt.getGeneratedKeys();*/
				} catch (SQLException e) {
					e.printStackTrace();
					response.sendRedirect("error.jsp");
					return;
				} finally {
					Dbcp.closePreparedStatement(pstmt);
					Dbcp.closeConnection(con);
				}
				request.setAttribute("ismessage", "message_ok");
				request.getRequestDispatcher("bookinformation?bookid="+mb.getBookid()).forward(request, response);
			}
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
}
