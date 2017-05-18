<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme() +"://" +request.getServerName() +":" +request.getServerPort() +path +"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>欢迎注册-熊猫书城</title>
<link href="res/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="res/mycss/register.css" rel="stylesheet">
<jsp:include page="res-jsp/web_ico.jsp"/>
</head>
<body>
	<div class="content">
		<div class=navbar>
			<a href="index.jsp" style="text-decoration: none;">
				<img border="0" src="res/images/book_logo.png" width="50" height="50">
				<span class="logo-text">熊猫书城</span>
			</a>
			<div class="trigger">
				<span>我已经注册，现在就</span> 
				<a href="login.jsp" style="text-decoration: none;">登录</a>
			</div>
		</div>
		<div class="login-panel">
			<div class="container">
				<div class="form">
					<form action="register" method="post" class="form-horizontal" id="myform">
						<div class="control-group">
							<label class="control-label">用户名：</label>
							<div class="controls">
								<input type="text" name="username" id="username"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">密&emsp;码：</label>
							<div class="controls">
								<input type="password"  name="password" id="password"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">确认密码：</label>
							<div class="controls">
								<input type="password" name="re_password" id="re_password" />
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">电&emsp;话：</label>
							<div class="controls">
								<input type="text" name="tel"/>
							</div>
						</div>
						<div class="left">
							<label for="protocol">
								<input type="checkbox" class="checkbox" onClick="check_a()" id="ch" >
								我已阅读并同意
								<a style="text-decoration:none;" 
									title="熊猫书城用户注册协议"  
			      					data-container="body" 
			      					data-toggle="popover" 
			      					data-placement="top" 
			      					data-content="1.您同意熊猫书城的注册协议请勾选后再进行注册。
			      					2.如果您不同意请关闭窗口，退出本站。">
									《熊猫书城用户注册协议》
								</a>
							</label>
						</div>
						<div class="zhuce">
								<input id="c_input" type="submit" name="register" value="立即注册"class="btn btn-success btn-block btn-large" disabled="disabled"/>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="res-jsp/footer01.jsp"/>
<script type="text/javascript" src="res/js/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="res/js/validation/additional-methods.js"></script>
<script type="text/javascript" src="res/js/validation/my-form-validation.js"></script>
<script type="text/javascript">
	function check_a() {
		//判断checkbox有没有被选中
		if (document.getElementById("ch").checked == true) {
			document.getElementById("c_input").disabled = "";
		} else {
			document.getElementById("c_input").disabled = "disabled";
		}
	}
	$(function() {
		$("[data-toggle='popover']").popover();
	});
</script>
</body>
</html>