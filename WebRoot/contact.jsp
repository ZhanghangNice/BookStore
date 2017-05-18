<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>联系我们-熊猫书城</title>
<link href="res/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="res/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="res/mycss/home.css"  rel="stylesheet">
<jsp:include page="res-jsp/web_ico.jsp"/>
<style type="text/css">
</style>
</head>
<body>
	<jsp:include page="res-jsp/navigation.jsp"/>

	<div class="row-fluid">
		<div class="span8 offset3" style="margin-top:140px; min-height:400px;">
			<div class="content">
				<h4>联系电话：139-7159-7910</h4><br> 
				<h4>服务邮箱：1196997178@qq.com</h4><br>
				<h4>联系地址：湖北省武汉市东湖风景区 </h4><br>
				<h4 style="color:red;">备注：网站还在完善中，如有不便，还望海涵。</h4>
				<br>
				<%--<h1 style="color:red;">非管理员不要点击下面按钮</h1>
				<a href="addBookClass" class="btn btn-info">添加图书类型数据</a>
				<a class="btn" href="addBookInfo">添加图书基本数据</a>
				<a class="btn" href="addBookDetailInfo">添加图书详细数据</a>
				<a class="btn" href="addEbookInfo">添加电子书数据</a>--%>
			</div>
		</div>
	</div>
<jsp:include page="res-jsp/footer.jsp"/>
</body>
</html>
