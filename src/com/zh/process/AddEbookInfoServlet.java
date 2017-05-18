package com.zh.process;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zh.util.Dbcp;

public class AddEbookInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String[] sqlString = new String[22];
		
		sqlString[1] = "INSERT INTO `bookclassinfo`  VALUES ('A', '马列主义、毛泽东思想、邓小平理论')";
		sqlString[2] = "INSERT INTO bookclassinfo  VALUES ('B', '哲学、宗教')";
		sqlString[3] = "INSERT INTO bookclassinfo  VALUES ('C', '社会科学总论')";
		sqlString[4] = "INSERT INTO bookclassinfo  VALUES ('D', '政治、法律')";
		sqlString[5] = "INSERT INTO bookclassinfo  VALUES ('E', '军事')";
		sqlString[6] = "INSERT INTO bookclassinfo  VALUES ('F', '经济')";
		sqlString[7] = "INSERT INTO bookclassinfo  VALUES ('G', '文化、科学、教育、体育')";
		sqlString[8] = "INSERT INTO bookclassinfo  VALUES ('H', '语言文字')";
		sqlString[9] = "INSERT INTO bookclassinfo  VALUES ('I', '文学')";
		sqlString[10] = "INSERT INTO bookclassinfo  VALUES ('J', '艺术')";
		sqlString[11] = "INSERT INTO bookclassinfo  VALUES ('K', '历史、地理')";
		sqlString[12] = "INSERT INTO bookclassinfo  VALUES ('N', '自然科学总论')";
		sqlString[13] = "INSERT INTO bookclassinfo  VALUES ('O', '数理科学、化学')";
		sqlString[14] = "INSERT INTO bookclassinfo  VALUES ('P', '天文学、地球科学')";
		sqlString[15] = "INSERT INTO bookclassinfo  VALUES ('Q', '生物科学')";
		sqlString[16] = "INSERT INTO bookclassinfo  VALUES ('R', '医药、卫生')";
		sqlString[17] = "INSERT INTO bookclassinfo  VALUES ('S', '农业科学')";
		sqlString[18] = "INSERT INTO bookclassinfo  VALUES ('T', '工业技术')";
		sqlString[19] = "INSERT INTO bookclassinfo  VALUES ('U', '交通运输')";
		sqlString[20] = "INSERT INTO bookclassinfo  VALUES ('V', '航空/航天')";
		sqlString[21] = "INSERT INTO bookclassinfo  VALUES ('X', '环境科学、安全科学')";
		sqlString[0] = "INSERT INTO bookclassinfo  VALUES ('Z', '综合性图书')";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			for(int i=0; i<22; i++)
			{
				pstmt = con.prepareStatement(sqlString[i], Statement.RETURN_GENERATED_KEYS);
				pstmt.executeUpdate();
			}
			response.sendRedirect("contact.jsp?return=yes");
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		} finally {
			Dbcp.closePreparedStatement(pstmt);
			Dbcp.closeConnection(con);
		}
	}
}
