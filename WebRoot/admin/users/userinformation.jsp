<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>个人用户中心</title>
<link href="res/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="res/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="res/mycss/home.css" rel="stylesheet">
<link href="res/mycss/user.css" rel="stylesheet" >
<jsp:include page="${basePath}/res-jsp/web_ico.jsp"/>
</head>
<style>
.table th, .table td{
	text-align:left;
}
</style>
<body>
 	<jsp:include page="${basePath}/res-jsp/navigation.jsp"/>
 	<div class="row">
 		<div class="myspan">
		 		<div class="mynavigation-left">
		 			<jsp:include page="navigation_left.jsp"/>
			    </div>
			 	<div class="myuser-right">
			 		<table class="table">
			 		<col width="120px">
				 		<thead>
						    <tr class="success">
						      <th>个人资料</th>
						    </tr>
						</thead>
						<tbody>
						<tr>
    						<td>用户名:</td>
    						<td>${requestScope.user.username}</td>
  						</tr>	
  						<tr>
    						<td>电话:</td>
    						<td>${requestScope.user.tel}</td>
  						</tr>
  						<tr>
    						<td>性别:</td>
    						<td>${requestScope.user.sex}</td>
  						</tr>
  						<tr>
    						<td>生日:</td>
    						<td>${requestScope.user.birthday }</td>
  						</tr>
  						<tr>
    						<td>email:</td>
    						<td>${requestScope.user.email}</td>
  						</tr>
  						<tr>
    						<td>QQ:</td>
    						<td>${requestScope.user.qq}</td>
  						</tr>
  						<tr>
    						<td>地址:</td>
    						<td>${requestScope.user.addr}</td>
  						</tr>
  						<tr>
    						<td></td>
    						<td><a href="userinformation?temp=0">修改</a></td>
  						</tr>
  						</tbody>
					</table>
			 	</div>
			</div>
		</div>
<jsp:include page="${basePath}/res-jsp/footer.jsp"/>
<script type="text/javascript">
$(document).ready(function(){
    $('.top_active a').each(function(){  
        if($($(this))[0].href==String(window.location))  
            $(this).addClass('active');  
    });  
});
</script>
</body>
</html>