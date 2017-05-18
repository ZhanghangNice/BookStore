package com.zh.servlet.manage;

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
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.zh.bean.SessionUser;
import com.zh.util.Dbcp;


public class AddEbookServlet extends HttpServlet {
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
		SessionUser user = new SessionUser();
		user = (SessionUser) request.getSession().getAttribute("_user");
		if(user==null)
		{
			response.sendRedirect("login.jsp");
			return;
		}
		
		String  ebookname = null;
		String  author = null;
		Double  unitprice = null;
		String  summary = null;
		String  ebooktxt = null;
		String  ebookimage = null;
		String  eclassid = null;
		String  link = null;
		
		//保存电子书
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		String result = null;
		InputStream is = null;
		OutputStream os = null;
		try {
			List<FileItem> files = upload.parseRequest(request);
			for(FileItem item : files){
				if(item.isFormField()){
					String name = item.getFieldName();  
					String value =  new String((item.getString("iso8859-1")).getBytes("iso8859-1"),"UTF-8");
			        if (name.equals("bookname")) {
			        	ebookname = value;
			        }if (name.equals("author")) {
			        	author = value;
			        }if (name.equals("unitprice")) {
			        	unitprice = Double.valueOf(value);
			        }if (name.equals("summary")) {
			        	summary = value;
			        }if (name.equals("classid")) {
			        	eclassid = value;
			        }if (name.equals("link")) {
			        	link = value;
			        }
				}else{
					String fieldName = item.getFieldName();
					if(fieldName.equals("ebooktxt"))
					{
						String fileName = URLEncoder.encode(item.getName(), "UTF-8");
						fileName = URLDecoder.decode(fileName, "UTF-8");
						ebooktxt = fileName;
						if(!ebooktxt.equals(""))
						{
							File file = new File(getServletContext().getRealPath("/")+"\\res\\ebook\\ebooktxt\\" + fileName);
							is = item.getInputStream();
							os = new FileOutputStream(file);
							byte[] buffer = new byte[1024];
							while(is.read(buffer) != -1){
								os.write(buffer);
							}
						}
					}if(fieldName.equals("ebookimage")){
						String fileName = URLEncoder.encode(item.getName(), "UTF-8");
						fileName = URLDecoder.decode(fileName, "UTF-8");
						ebookimage = fileName;
						
						File file = new File(getServletContext().getRealPath("/")+"\\res\\ebook\\ebookimage\\" + fileName);
						is = item.getInputStream();
						os = new FileOutputStream(file);
						byte[] buffer = new byte[1024];
						while(is.read(buffer) != -1){
							os.write(buffer);
						}	
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "admin/manage/addebook.jsp?return=0";
		} finally {
			is.close();
			os.close();
		}
		//保存电子书信息
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			pstmt = con.prepareStatement("insert into ebookinfo(ebookname,author,unitprice, " +
					" summary,ebooktxt,ebookimage,eclassid,link) values(?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, ebookname);
			pstmt.setString(2, author);
			pstmt.setDouble(3, unitprice);
			pstmt.setString(4, summary);
			pstmt.setString(5, ebooktxt);
			pstmt.setString(6, ebookimage);
			pstmt.setString(7, eclassid);
			pstmt.setString(8, link);
			pstmt.executeUpdate();
			
			result = "admin/manage/addebook.jsp?return=1";
		} catch (Exception e) {
			e.printStackTrace();
			result = "admin/manage/addebook.jsp?return=0";
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
		response.sendRedirect(result);
	}
}
