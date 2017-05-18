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

public class AddBookDeInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String[] sqlString = new String[40];
		
		sqlString[0] = "INSERT INTO `bookdetailinfo` VALUES ('9787010060064', '1', '平装', '16', '2007-01-01', '421', '中文简体', '  ', ' ', ' ', ' ', 'daguojueqi.jpg')";
		sqlString[1] = "INSERT INTO `bookdetailinfo` VALUES ('9787020095193', '1', '精装', '32', '2014-01-01', '7209', '中文简体', ' ', ' ', ' ', ' ', 't015b06966b6604d764.jpg')";
		sqlString[2] = "INSERT INTO `bookdetailinfo` VALUES ('9787100112758', '1', '平装', '32', '2015-10-01', '338', '中文简体', ' ', ' ', ' ', ' ', 'chixudelunxian.jpg')";
		sqlString[3] = "INSERT INTO `bookdetailinfo` VALUES ('9787108041531', '1', '平装', '16', '2013-01-01', '754', '中文简体', ' ', ' ', ' ', ' ', 'dengxiaopingshidai.jpg')";
		sqlString[4] = "INSERT INTO `bookdetailinfo` VALUES ('9787111499503', '1', '精装', '16', '2015-04-01', '285', '中文简体', ' ', ' ', ' ', ' ', 'hulianwangjia.jpg')";
		sqlString[5] = "INSERT INTO `bookdetailinfo` VALUES ('9787121259586', '1', '平装', '16', '2015-06-01', '780', '中文简体', ' ', ' ', ' ', ' ', 'androidjiangyi.jpg')";
		sqlString[6] = "INSERT INTO `bookdetailinfo` VALUES ('9787121273087', '1', '平装', '16', '2015-10-01', '284', '中文简体', ' ', ' ', ' ', ' ', '5625f8b1N5f5b7446.jpg')";
		sqlString[7] = "INSERT INTO `bookdetailinfo` VALUES ('9787122239211', '1', '平装', '16', '2015-08-01', '162', '中文简体', ' ', ' ', ' ', ' ', '55c02b33N1d33d522.jpg')";
		sqlString[8] = "INSERT INTO `bookdetailinfo` VALUES ('9787213066856', '1', '平装', '16', '2015-06-01', '404', '中文简体', ' ', ' ', ' ', ' ', '560609sdd69831a098.jpg')";
		sqlString[9] = "INSERT INTO `bookdetailinfo` VALUES ('9787214067821', '1', '平装', '16', '2011-03-01', '296', '中文简体', ' ', ' ', ' ', ' ', '56800asrf6dsfwe611.jpg')";
		sqlString[10] = "INSERT INTO `bookdetailinfo` VALUES ('9787220096600', '1', '平装', '16', '2016-01-01', '648', '中文简体', ' ', ' ', ' ', ' ', '5664eeb2N1fb4f0d3.jpg')";
		sqlString[11] = "INSERT INTO `bookdetailinfo` VALUES ('9787229063962', '1', '平装', '16', '2013-06-01', '216', '中文简体', ' ', ' ', ' ', ' ', '56d3f8dbNcb9815dc.jpg')";
		sqlString[12] = "INSERT INTO `bookdetailinfo` VALUES ('9787300215143', '1', '平装', '16', '2015-08-01', '928', '中文简体', ' ', ' ', ' ', ' ', '563ff1dfN3132d5d8.jpg')";
		sqlString[13] = "INSERT INTO `bookdetailinfo` VALUES ('9787505135062', '1', '精装', '16', '2015-09-01', '256', '中文简体', ' ', ' ', ' ', '  ', '569de896Nde7951a3.jpg')";
		sqlString[14] = "INSERT INTO `bookdetailinfo` VALUES ('9787506341271', '1', '平装', '16', '2007-10-01', '528', '中文简体', ' ', ' ', ' ', '  ', '5681df0bNc03f96be.jpg')";
		sqlString[15] = "INSERT INTO `bookdetailinfo` VALUES ('9787508643298', '1', '平装', '16', '2014-03-01', '536', '中文简体', ' ', ' ', ' ', ' ', '569sdatew32sdtftwes.jpg')";
		sqlString[16] = "INSERT INTO `bookdetailinfo` VALUES ('9787508647074', '1', '平装', '16', '2014-10-01', '688', '中文简体', ' ', ' ', ' ', ' ', '5423f489N6ec65c16.jpg')";
		sqlString[17] = "INSERT INTO `bookdetailinfo` VALUES ('9787508651903', '1', '精装', '32', '2015-07-01', '618', '中文简体', ' ', ' ', ' ', ' ', '562ASCEeAADIiK4561.jpg')";
		sqlString[18] = "INSERT INTO `bookdetailinfo` VALUES ('9787508653594', '1', '精装', '32', '2015-09-01', '307', '中文简体', ' ', ' ', ' ', ' ', '55d3d674N4efb3b8a.jpg')";
		sqlString[19] = "INSERT INTO `bookdetailinfo` VALUES ('9787508656441', '1', '平装', '16', '2016-01-01', '288', '中文简体', ' ', ' ', ' ', ' ', '565d0e9eN1876bbd7.jpg')";
		sqlString[20] = "INSERT INTO `bookdetailinfo` VALUES ('9787508657493', '1', '平装', '16', '2016-01-01', '320', '中文简体', ' ', ' ', ' ', ' ', '5678dbceN467ebacd.jpg')";
		sqlString[21] = "INSERT INTO `bookdetailinfo` VALUES ('9787510446627', '1', '精装', '16', '2014-03-01', '1556', '中文简体', ' ', ' ', ' ', ' ', '5603rBEhU1NVwAM7.jpg')";
		sqlString[22] = "INSERT INTO `bookdetailinfo` VALUES ('9787512370524', '1', '平装', '16', '2015-02-01', '385', '中文简体', ' ', ' ', ' ', ' ', '560b34d6Na862a09c.jpg')";
		sqlString[23] = "INSERT INTO `bookdetailinfo` VALUES ('9787513318020', '1', '精装', '16', '2015-07-01', '532', '中文简体', ' ', ' ', ' ', ' ', '569c738aN5cb3c711.jpg')";
		sqlString[24] = "INSERT INTO `bookdetailinfo` VALUES ('9787514611946', '1', '平装', '16', '2015-10-01', '200', '中文简体', ' ', ' ', ' ', ' ', '563b4c4eNe10970d6.jpg')";
		sqlString[25] = "INSERT INTO `bookdetailinfo` VALUES ('9787535481108', '1', '平装', '16', '2015-09-01', '280', '中文简体', ' ', ' ', ' ', ' ', '55efa840Na5b5a5f0.jpg')";
		sqlString[26] = "INSERT INTO `bookdetailinfo` VALUES ('9787535483133', '1', '平装', '16', '2015-11-01', '260', '中文简体', ' ', ' ', ' ', ' ', '565fae7dN0ffa34a5.jpg')";
		sqlString[27] = "INSERT INTO `bookdetailinfo` VALUES ('9787535732309', '1', '平装', '16', '2012-01-01', '243', '中文简体', ' ', ' ', ' ', ' ', '5673c32dNe3c9c23c.jpg')";
		sqlString[28] = "INSERT INTO `bookdetailinfo` VALUES ('9787543095984', '1', '平装', '16', '2015-11-01', '256', '中文简体', ' ', ' ', ' ', ' ', '5636fc80N869ba869.jpg')";
		sqlString[29] = "INSERT INTO `bookdetailinfo` VALUES ('9787543096158', '1', '平装', '32', '2016-01-01', '272', '中文简体', ' ', ' ', ' ', ' ', '565d0786Nd0bcfb5e.jpg')";
		sqlString[30] = "INSERT INTO `bookdetailinfo` VALUES ('9787547711101', '1', '平装', '16', '2014-01-01', '7400', '中文简体', ' ', ' ', ' ', ' ', '1385370967887fkzpi.jpg')";
		sqlString[31] = "INSERT INTO `bookdetailinfo` VALUES ('9787549107124', '1', '平装', '16', '2012-01-01', '216', '中文简体', ' ', ' ', ' ', ' ', '534debb664c7f.jpg')";
		sqlString[32] = "INSERT INTO `bookdetailinfo` VALUES ('9787550015371', '1', '精装', '16', '2016-01-01', '531', '中文简体', ' ', ' ', ' ', ' ', '5684df41Nf4bca89a.jpg')";
		sqlString[33] = "INSERT INTO `bookdetailinfo` VALUES ('9787550015432', '1', '平装', '16', '2015-11-01', '364', '中文简体', ' ', ' ', ' ', ' ', '56553658N9c654dcc.jpg')";
		sqlString[34] = "INSERT INTO `bookdetailinfo` VALUES ('9787550015500', '1', '平装', '32', '2016-01-01', '568', '中文简体', ' ', ' ', ' ', ' ', '566131e9N0526fb1e.jpg')";
		sqlString[35] = "INSERT INTO `bookdetailinfo` VALUES ('9787550226029', '1', '盒装', '16', '2014-04-01', '96', '中文简体', ' ', ' ', ' ', ' ', '5540a92bNa22d6b8b.jpg')";
		sqlString[36] = "INSERT INTO `bookdetailinfo` VALUES ('9787550248083', '1', '平装', '16', '2015-05-01', '304', '中文简体', ' ', ' ', ' ', ' ', '555e96e0Nbae014db.jpg')";
		sqlString[37] = "INSERT INTO `bookdetailinfo` VALUES ('9787550263802', '1', '平装', '32', '2015-12-01', '416', '中文简体', ' ', ' ', ' ', ' ', '5670d5c7Nfee121a2.jpg')";
		sqlString[38] = "INSERT INTO `bookdetailinfo` VALUES ('9787564075859', '1', '精装', '16', '2013-09-01', '230', '中文简体', ' ', ' ', ' ', ' ', '56668956N968c59cc.jpg')";
		sqlString[39] = "INSERT INTO `bookdetailinfo` VALUES ('9787505736139', '1', '平装', '16', '2016-01-01', '304', '中文简体', ' ', ' ', ' ', ' ', '56e918feN41d55751.jpg')";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = Dbcp.getConnection();
			for(int i=0; i<40; i++)
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
