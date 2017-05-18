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
<link href="res/mycss/question.css"  rel="stylesheet">
<jsp:include page="res-jsp/web_ico.jsp"/>
</head>
<body>
	<jsp:include page="res-jsp/navigation.jsp"/>

	<div class="row-fluid">
		<div class="span8 offset2" style="margin-top:140px;">
			<div class="content">
					<div class="question" id="question">
						<div class="question-list">
							<h3>热门回答</h3>
							<dl class="mod-item">
								<dt class="vm-question">购买图书可以开票么？</dt>
								<dd class="vm-answer">当然可以，只要是在熊猫书城购买的图书都是可以开发票的。</dd>
							</dl>
							<dl class="mod-item">
								<dt class="vm-question">此书是正版图书吗？</dt>
								<dd class="vm-answer">亲，肯定是正版的，熊猫书城都是在正规渠道进货，</dd>
							</dl>
							<dl class="mod-item">
								<dt class="vm-question">包邮么？</dt>
								<dd class="vm-answer">亲，在熊猫书城购买图书满百都是包邮哦。</dd>
							</dl>
							<dl class="mod-item">
								<dt class="vm-question">可以货到付款么？</dt>
								<dd class="vm-answer">抱歉，本公司暂时还没有开通此项服务，给您带来不便了。不过可以分期付款的哦。</dd>
							</dl>
							<dl class="mod-item">
								<dt class="vm-question">怎样才算购买成功？</dt>
								<dd class="vm-answer">
									由于系统设置为付款后减库存，所以拍下并不代表购买成功。为了确保购买成功，建议拍下后尽快完成付款。
								</dd>
							</dl>
						</div>
					</div>
			</div>
		</div>
	</div>
<jsp:include page="res-jsp/footer.jsp"/>
</body>
</html>
