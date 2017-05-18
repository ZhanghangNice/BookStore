package com.zh.servlet.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.zh.util.Dbcp;

public class FeedBackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)){
			response.sendRedirect("feedback.jsp?return=0");
			return;
		}
		
		String   type = null;
		String   link = null;
		String   content = null;
		String   phone = null;
		String   img = null;
		
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		String result = null;
		InputStream is = null;
		OutputStream os = null;
		try {
			List<FileItem> files = upload.parseRequest(request);
			for(FileItem item : files){
				//判断FileItem对象里封装的数据还是一般普通文本表单字段还是一个文件表单字段
				if(item.isFormField()){
					String name = item.getFieldName();  //获得这个参数名
					String value =  new String((item.getString("iso8859-1")).getBytes("iso8859-1"),"UTF-8");
			        if (name.equals("type")) {        //根据判断获得参数值，并赋给已声明的变量
			        	type = value;
			        }
			        if (name.equals("link")) {
			        	link = value;
			        }
			        if (name.equals("content")) {
			        	content = value;
			        }
			        if (name.equals("phone")) {
			        	phone = value;
			        }
				}else{
					String fileName = URLEncoder.encode(item.getName(), "UTF-8");
					fileName = URLDecoder.decode(fileName, "UTF-8");
					img = fileName;
					
					File file = new File(getServletContext().getRealPath("/")+"\\res\\images\\feedback\\" + fileName);
					is = item.getInputStream();
					os = new FileOutputStream(file);
					byte[] buffer = new byte[1024];
					while(is.read(buffer) != -1){
						os.write(buffer);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "error.jsp";
		} finally {
			is.close();
			os.close();
		}
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("insert into feedbackinfo(type,link,content,phone,img,time) values(?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, type);
			pstmt.setString(2, link);
			pstmt.setString(3, content);
			pstmt.setString(4, phone);
			pstmt.setString(5, img);
			SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			pstmt.setString(6, time.format(new Date()));
			pstmt.executeUpdate();
			
			result = "feedback.jsp?return=1";
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
