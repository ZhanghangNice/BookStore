<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>个人订单</title>
<link href="res/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="res/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="res/mycss/home.css" rel="stylesheet">
<link href="res/mycss/user.css" rel="stylesheet" >
<jsp:include page="${basePath}/res-jsp/web_ico.jsp"/>
</head>
<body>
 	<jsp:include page="${basePath}/res-jsp/navigation.jsp"/>
 	<div class="row">
 		<div class="myspan">
		 	<div class="mynavigation-left">
		 		<jsp:include page="navigation_left.jsp"/>
		    </div>
		 	<div class="myuser-right">	
				<div class="mynavbar">
  					<div class="navbar-inner">
    					<a class="brand" href="admin/users/orderform.jsp">
    						<i class="icon-align-justify"></i>订单详细信息
    					</a>
    				</div>
    			</div>
    			<c:import url="/userorderform"/>		
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