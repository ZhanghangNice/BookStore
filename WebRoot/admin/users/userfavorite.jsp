<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>个人收藏</title>
<link href="res/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="res/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="res/mycss/home.css" rel="stylesheet">
<link href="res/mycss/user.css" rel="stylesheet">
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
    					<a class="brand" href="admin/users/userfavorite.jsp">
    						<img src="res/images/webico/favorite.png" height="20" width="20">收藏夹
    					</a>
    				</div>
    				<c:import url="/userfavorite"/>
    			</div>
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
<script type="text/javascript">
$(function(){
	$("#chkAll").click(function(){
		if(this.checked){
			$("table tr td input[type=checkbox]").attr("checked",true);
		}else{
			$("table tr td input[type=checkbox]").attr("checked",false);
		}
	});
	
/* 	var x=20; var y=30;
	$("table tr td img").mousemove(function(e){
		$("#imgTip")
		.attr("src", this.src)
		.css({"top":(e.pageY +y) + "px", "left":(e.pagX +x) + "px", "position":"absolute"})
		.show(3000);
	});
	$("table tr td img").mouseout(function(){
		$("#imgTip").hide();
	}); */
	
});
</script>
<script type="text/javascript">
$(function(){
	$('.adel').click(function(){
		var href =  $(this).attr('href1');
		var result = confirm('您确定要全部删除吗？');
		if(result){
			window.top.location.href=href;
		}
	});
});
</script>
</body>
</html>