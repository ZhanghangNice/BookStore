<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="count" class="com.zh.process.ComputerVisitor"  scope="session" />
<link rel="stylesheet" href="res/go-top/css/style.css">
<div class="footer">
	<hr class="featurette-divider-f">
	<div class="container marketing">
		<footer>
			<p>
				&copy; 2016 Company &middot; 版权所有，翻版必究&nbsp;&nbsp;&nbsp;&nbsp;
				您是第<jsp:getProperty name="count" property="number" />个访问者，欢迎光临
			</p>
			<address>
				<a style="text-decoration: none;">1196997178@qq.com</a>
			</address>
		</footer>
	</div>
</div>
<a href="#0" class="cd-top"></a>
<script type="text/javascript" src="res/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="res/go-top/js/main.js"></script>
<script type="text/javascript" src="res/bootstrap/js/bootstrap.min.js"></script>