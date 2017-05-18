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


public class AddBookDetailServlet extends HttpServlet {
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
		user = (SessionUser) request.getSession().getAttribute("_user");
		if(user==null)
		{
			response.sendRedirect("login.jsp");
			return;
		}
		if(!ServletFileUpload.isMultipartContent(request)){
			response.sendRedirect("admin/manage/addbookdetail.jsp?return=0");
			return;
		}
		
		String   bookid = null;
		Integer  edition = null;
		String   packaging = null;
		Integer  format = null;
		String   publdata = null;
		Integer  numpages = null;
		String   language = null;
		String   authorsIntroduce = null;
		String   contentIntroduce = null;
		String   directory = null;
		String   preface = null;
		String   bigImage = null;
		
		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		String result = null;
		InputStream is = null;
		OutputStream os = null;
		try {
			@SuppressWarnings("unchecked")
			List<FileItem> files = upload.parseRequest(request);
			for(FileItem item : files){
				if(item.isFormField()){
					String name = item.getFieldName();  
					String value =  new String((item.getString("iso8859-1")).getBytes("iso8859-1"),"UTF-8");
			        if (name.equals("bookidA")) {        
			        	bookid = value;
			        }if (name.equals("edition")) {
			        	edition = Integer.valueOf(value);
			        }if (name.equals("packaging")) {
			        	packaging = value;
			        }if (name.equals("format")) {
			        	format = Integer.valueOf(value);
			        }if (name.equals("publdata")) {
			        	publdata = value;
			        }if (name.equals("numpages")) {
			        	numpages = Integer.valueOf(value);
			        }if (name.equals("language")) {
			        	language = value;
			        }if (name.equals("authorsIntroduce")) {
			        	authorsIntroduce = value;
			        }if (name.equals("contentIntroduce")) {
			        	contentIntroduce = value;
			        }if (name.equals("directory")) {
			        	directory = value;
			        }if (name.equals("preface")) {
			        	preface = value;
			        }
				}else{
					String fileName = URLEncoder.encode(item.getName(), "UTF-8");
					fileName = URLDecoder.decode(fileName, "UTF-8");
					bigImage = fileName;
					
					File file = new File(getServletContext().getRealPath("/")+"\\res\\images\\bookdetailimage\\" + fileName);
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
			pstmt = con.prepareStatement("insert into bookdetailinfo( " +
					" bookid ,edition , packaging, format, publdata, numpages, language, " +
					" authorsIntroduce, contentIntroduce, directory, preface ,bigImage) " +
					" values(?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, bookid);
			pstmt.setInt(2, edition);
			pstmt.setString(3, packaging);
			pstmt.setInt(4, format);
			pstmt.setString(5, publdata);
			pstmt.setInt(6, numpages);
			pstmt.setString(7, language);
			pstmt.setString(8, authorsIntroduce);
			pstmt.setString(9, contentIntroduce);
			pstmt.setString(10, directory);
			pstmt.setString(11, preface);
			pstmt.setString(12, bigImage);
			pstmt.executeUpdate();
			result = "admin/manage/addbookdetail.jsp?return=1";
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
