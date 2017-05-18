<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>修改密码</title>
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
			    	<form action="changepassword" method="post"  class="form-horizontal" id="myform">
						<div class="control-group">
							<label class="control-label">旧密码：</label>
							<div class="controls">
								<input type="password" name="oldpassword"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">新密码：</label>
							<div class="controls">
								<input type="password" name="password" id="password"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">确认密码：</label>
							<div class="controls">
								<input type="password" name="re_password"/>
							</div>
						</div>
						<div>
							<div class="controls right-ci">
								<input type="submit" value="修改" class="btn btn-large btn-block btn-success"/>
							</div>
						</div>
					</form>	
			   </div>
		</div>
	</div>
<div id="myModal_no" class="modal hide fade">
	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h3>友情提示</h3>
  	</div>
	<div class="modal-body">
		<h4 style="color:red;">对不起，中途可能出了点问题，密码修改失败了！</h4>
		<h4 style="margin-left:280px;color:#FF0033;">可能是您的旧密码填写错了。</h4>
	</div>
	<div class="modal-footer">
    	<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
</div>
<jsp:include page="${basePath}/res-jsp/footer.jsp"/>
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
			if (returnvar == 0) {
				$('#myModal_no').modal();
			}
		}
	});
</script>
</body>
</html>
