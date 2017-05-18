<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>修改个人信息</title>
<link href="res/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="res/mycss/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
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
			 		<form action="updatauser" method="post" class="form-horizontal" id="myform">
						<div class="control-group">
							<label class="control-label">用户名：</label>
							<div class="controls">
								<label style="margin:6px 0 0 5px;">${ user.username }</label>
								<input type="text" name="username" value="${ user.username }" 
									style="display:none;"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">电话：</label>
							<div class="controls">
								<input type="text" name="tel"  value="${ user.tel }"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">性别：</label>
						    <div class="controls">
						      <label class="radio inline">
						        <input type="radio" value="男" name="sex"
						        <c:if test="${ user.sex == '男' }"> checked="checked"</c:if>>男
						      </label>
						      <label class="radio inline">
						        <input type="radio" value="女" name="sex"
						        <c:if test="${ user.sex == '女' }"> checked="checked"</c:if>>女
						      </label>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">生日：</label>
							<div class="controls">
								<input name="birthday" type="text" value="${ user.birthday }" readonly class="form_datetime">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">email：</label>
							<div class="controls">
								<input type="text" name="email"  value="${ user.email }"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">QQ：</label>
							<div class="controls">
								<input type="text" name="qq"  value="${ user.qq }"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">地址：</label>
							<div class="controls">
								<input type="text" name="addr"  value="${ user.addr }"/>
							</div>
						</div>
						<div class="control-group">
							<div class="controls  right-ci">
								<input type="submit" value="保存" class="btn btn-success btn-large btn-block"/>
							</div>
						</div>
					</form>
			 	</div>
			</div>
		</div>

<jsp:include page="${basePath}/res-jsp/footer.jsp"/>
<script type="text/javascript" src="res/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="res/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="res/js/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="res/js/validation/additional-methods.js"></script>
<script type="text/javascript" src="res/js/validation/my-form-validation.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    $('.top_active a').each(function(){  
        if($($(this))[0].href==String(window.location))  
            $(this).addClass('active');  
    });  
});
</script>
<script type="text/javascript">
    $(".form_datetime").datetimepicker({format: 'yyyy-mm-dd',
    	autoclose: true, todayBtn: true, minView:2, startDate:1900-01-01,
    	startView:4,language:'zh-CN'});
</script>
</body>
</html>