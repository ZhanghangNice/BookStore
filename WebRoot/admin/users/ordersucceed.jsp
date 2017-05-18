<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.zh.process.RandomNumberGenerator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>订单提交成功，正在跳转···</title>
<link href="res/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="res/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="res/mycss/home.css" rel="stylesheet">
<jsp:include page="${basePath}/res-jsp/web_ico.jsp"/>
<style type="text/css">
.row{
	margin:0px;
}
.myspan{
	margin-top:130px;
	width:1200px;
	min-height:0px;
	float:none;
	margin-left:auto;
	margin-right:auto;
}
.current{
	width:700px;
	height:50px;
	margin-left:auto;
	margin-right:auto;
}
.succeed{
	height:240px;
	text-align:center;
}
h3{
	margin-top:80px;
}
h4{
	margin-top:50px;
}
</style>
</head>
<body>
 	<jsp:include page="${basePath}/res-jsp/navigation.jsp"/>
 	<div class="row">
 		<div class="myspan">
	 		<div class="current">
	 			<img alt="" src="res/images/webico/114.png">
	 		</div>
	 		<div class="succeed">
	 			<h3 style="color:#7ABD54;">您的订单提交成功！</h3>
	 			<h4>网页将在<span id="tiao">3</span>
	 			秒后<a href="admin/users/orderform.jsp">跳转</a>，正在跳转···</h4>
	 		</div>
			
		</div>
	</div>
<jsp:include page="${basePath}/res-jsp/footer.jsp"/>
<script language="javascript"> 
function countDown(secs){ 
	tiao.innerText=secs; 
	if(--secs>=0) 
		setTimeout("countDown("+secs+")",1000); 
	else
		window.location.href="admin/users/orderform.jsp";
	}
	
	countDown(3);
</script> 
</body>
</html>
