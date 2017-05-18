<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>意见反馈-熊猫书城</title>
<link href="res/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="res/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="res/mycss/home.css"  rel="stylesheet">
<jsp:include page="res-jsp/web_ico.jsp"/>
<style type="text/css">
input.error:focus,.error:focus {
transition:border linear 0.2s,box-shadow linear .2s;
outline:none;
border-color:red;
box-shadow:0 0 8px red;
}
 #link-error,#phone-error,#content-error, #img-error {
   width: auto;
   color:red;
   margin-left:320px;
   margin-top:-35px;
   background: #fff;
   position: absolute;
}
</style>
</head>
<body>
	<jsp:include page="res-jsp/navigation.jsp"/>
	<div class="row-fluid">
		<div class="span8 offset2" style="margin-top:140px;">
			<div class="content">
				<h3>尊敬的熊猫书城用户，您好：</h3>
				<p style="text-indent:2em;">
					感谢您对我们的支持与关注，我们将竭诚为您提供最详实、准确的信息，以满足网友的需求。但百密总有一疏，无论您对页面布局是否喜欢；
					数据信息是否有误，配图正确与否，都希望得到您客观的评价，虚心接受您最诚挚的意见和建议，对您留下的宝贵意见我们将第一时间给予解答并修正，
					并根据反馈意见的重要程度，给予一定奖励，送上我们的精美纪念品一份。
				</p>
			</div>
			<div class="span4 offset3">
				<form action="feedback" method="post" enctype="multipart/form-data" id="feedback">
					<label>问题类型:</label> 
					<label class="radio inline">
						<input type="radio" name="type" value="数据" checked>数据 
					</label>
					<label class="radio inline"> 
						<input type="radio" name="type"value="图片">图片 
					</label> 
					<label class="radio inline"> 
						<input type="radio" name="type" value="页面">页面 
					</label>
					<div>
						<label>链接地址:</label>
						<input style="width:300px" type="text" name="link" id="link">
					</div>
					<div>
						<label>问题描述:</label>
						<textarea style="width:300px; height:100px;" name="content" id="content"></textarea>
					</div>
					<div>
						<label>上传图片:</label> 
						<input name="img" type="file" id="img" accept=".jpg,.png,.gif"/>
					</div>
					<div>
						<label>联系方式:<span style="color:#989898">email或者电话，方便进一步沟通</span></label> 
						<input style="width:300px;" type="text" name="phone" >
					</div>
					<input class="btn btn-large" value=" 提  交  " type="submit">
				</form>
			</div>
		</div>
	</div>
<div id="myModal_yes" class="modal hide fade">
	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h3>友情提示</h3>
  	</div>
	<div class="modal-body">
		<p>您的建议我们已经收到!
		<p style="margin-left:200px;">谢谢您的宝贵意见!</p>
		<p style="margin-left:400px;">祝您身体健康！</p>
	</div>
	<div class="modal-footer">
    	<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
</div>
<div id="myModal_no" class="modal hide fade">
	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    	<h3>友情提示</h3>
  	</div>
	<div class="modal-body">
		<p>对不起，您的反馈中途丢失了！
		<p style="margin-left:280px;">请重新填写，我们一定会认真对待的！</p>
	</div>
	<div class="modal-footer">
    	<button class="btn" data-dismiss="modal" aria-hidden="true">关闭</button>
  </div>
</div>
<jsp:include page="res-jsp/footer.jsp"/>
<script type="text/javascript" src="res/js/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="res/js/validation/additional-methods.js"></script>
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
				$('#myModal_yes').modal();
			} else {
				$('#myModal_no').modal();
			}
		}
	});
	$(function(){
		$("#content").blur(function(){
			$(this).val($("#content").val().replace(/(^\s+)|(\s+$)/g, ""));
		});
	});
</script>
<script type="text/javascript">
$().ready(function() {
  $("#feedback").validate({
    rules : {
		link : {
			required : true,
			url:true,
			maxlength : 200,
		},
		content : {
			required : true,
			maxlength : 500,
		},
		img : {
			required : true,
			accept: "gif|png|jpeg",
		},
		phone : {
			required : true,
			phone : true,
			maxlength : 50
		},
    },
	messages : {
		link : {
			required : "请填写链接地址",
			url : "请输入正确的网址",
			maxlength : "您输入的网址太长了"
		},
		content : {
			required : "请简单描述问题",
			maxlength : "您输入的内容太多了"
		},
		img : {
			required : "请上传图片",
			accept : "图片格式只能是.gif/.png/.jpg",
			maxlength : "图片的名字太长了"
		},
		phone : {
			required : "请输入联系方式",
			maxlength : "长度不能超过50",
		}
	},

  });
});
</script>
</body>
</html>