<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎登录-熊猫书城</title>
<link href="res/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="res/mycss/login.css"   rel="stylesheet">
<jsp:include page="res-jsp/web_ico.jsp"/>
</head>
<body>
	<div class=navbar>
		<a href="index.jsp" style="text-decoration: none;">
			<img border="0" src="res/images/book_logo.png" width="50" height="50">
			<span class="logo-text">熊猫书城</span>
		</a>
		<div class="trigger">
			<a href="register.jsp" style="text-decoration: none;">免费注册</a>	
		</div>
	</div>
	<div class="login-panel">
		<div class="container">
				<div class="form">
					<form action="login" method="post" class="form-horizontal">
						<div class="control-group">
							<label class="control-label">用户名：</label>
							<div class="controls">
								<input type="text" name="username" placeholder="请输入用户名"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">密&nbsp;&nbsp;&nbsp;码：</label>
							<div class="controls">
								<input type="password" name="password" placeholder="请输入密码"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">验证码：</label>
							<div class="controls">
								<input type="text" name="vcode" style="width: 100px;"/>
								<img alt="" src="vcode.jpg" class="vcode">
							</div>
						</div>
						<div class="control-group left">
	    					<label class="control-label">
	      						<input type="checkbox" checked/>记住登录状态
	    					</label>
	    					<div class="wang">
	    						<a href="register.jsp" style="text-decoration: none;">忘记密码？</a>
	    					</div>
    					</div>
						<div class="denglu">
							<button type="submit" class="btn btn-success btn-block btn-large">
							登&nbsp;&nbsp;&nbsp;&nbsp;陆</button>
						</div>
					</form>
				</div>
			</div>
	</div>
	
<div class="modal hide fade login-errors">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3>错误信息</h3>
	</div>
	<div class="modal-body">
		<ul>
			<c:forEach items="${requestScope.errors}" var="i">
				<li>${ i }</li>
			</c:forEach>
		</ul>
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
	</div>
</div>
<div id="myModal_yes" class="modal hide fade">
	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h3>友情提示</h3>
  	</div>
	<div class="modal-body">
		<h4 style="color:#6C9A12;">您的密码已修改成功！</h4>
		<h4 style="margin-left:300px; color:#6C9A12;">您可以用新密码登录了!</h4>
	</div>
	<div class="modal-footer">
    	<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
</div>
<jsp:include page="res-jsp/footer01.jsp"/>
<script type="text/javascript"> 
	$(function() {
		(function($) {
			$.getUrlParam = function(name) {
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
				var r = window.location.search.substr(1).match(reg);
				if (r != null)
					return unescape(r[2]);
				return null;
			};
		})(jQuery);
		var returnvar = $.getUrlParam('return');
		if(returnvar!==null)
		{
			if (returnvar == 1) {
				$('#myModal_yes').modal({backdrop: 'static', keyboard: false});
			}
		}
	});
</script>
<script type="text/javascript">
$(function(){
	if($('.login-errors .modal-body li').length > 0){
		$('.login-errors').modal();
	}
}); 
</script>
<!-- 点击验证码切换 -->
<script type="text/javascript">
$(function(){
	$('.login-panel form .vcode').click(function(){
		$(this).attr('src', 'vcode.jpg?_' + new Date());
	});
});
</script>
</body>
</html>