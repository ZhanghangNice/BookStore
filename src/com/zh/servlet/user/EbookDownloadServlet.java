package com.zh.servlet.user;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.util.Dbcp;

public class EbookDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String  ebooktxt = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement(" select ebookinfo.ebooktxt from  ebookinfo where id=?");
			pstmt.setString(1, request.getParameter("id"));
			rs = pstmt.executeQuery();
			while(rs.next()){
				ebooktxt = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		
		String filename = ebooktxt;
		InputStream is = null;
		OutputStream os = null;
		try {
			//要下载的文件
			File file = new File(getServletContext().getRealPath("/")+"\\res\\ebook\\ebooktxt\\" + filename);
			//文件名编码，解决中文乱码问题
			filename = URLEncoder.encode(file.getName(), "UTF-8");
			//文件下载响应参数及响应头
			response.setContentType("application/msword");
			response.addHeader("Content-Disposition", "attachment;filename=" + filename);
			response.setContentLength((int)file.length());
			
			is = new FileInputStream(file);
			//获取输出流
			os = response.getOutputStream();
			byte[] buffer = new byte[1024];
			while(is.read(buffer) != -1){
				os.write(buffer);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
			return;
		} finally {
			is.close();
			os.flush();
			os.close();
		}
	}

}
