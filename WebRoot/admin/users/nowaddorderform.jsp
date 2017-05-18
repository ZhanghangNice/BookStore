<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.zh.process.RandomNumberGenerator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>订单信息核对</title>
<link href="res/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="res/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="res/mycss/home.css" rel="stylesheet">
<link href="res/mycss/userorder.css" rel="stylesheet" >
<jsp:include page="${basePath}/res-jsp/web_ico.jsp"/>
</head>
<body>
 	<jsp:include page="${basePath}/res-jsp/navigation.jsp"/>
 	<div class="row">
 		<div class="myspan">
	 		<div class="current">
	 			<img alt="" src="res/images/webico/115.png">
	 		</div>
			<div class="myuser-order">
				<span class="tit-txt">填写并核对订单信息 ：</span>
				<form action="addorderform?temp=1" method="post"  class="form-horizontal" id="myform">
				<div class="checkout-steps">
					<div class="step-tit"><h5>收货人信息</h5></div>
						<div class="control-group shouName">
							<label class="control-label">收货姓名：</label>
							<div class="controls">
								<input type="text" name="receiver" id="receiver"/>
							</div>
						</div>
						<div class="control-group lian">
							<label class="control-label">手机号码：</label>
							<div class="controls">
								<input type="text" name="contact"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">收货地址：</label>
							<div class="controls">
								<input type="text" name="address" class="input-xxlarge"/>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">备注：</label>
							<div class="controls">
								<textarea id="orderremark" name="orderremark" style="margin: 0px; height: 80px; width: 600px;"></textarea>
							</div>
						</div>
						
						<hr>
						<div class="step-tit"><h5>支付方式</h5></div>
						 <div class="payment-list">
							<div class="control-group">
						      <label class="radio inline">
						        <input type="radio" value="支付宝支付" name="pay" checked="checked">支付宝支付
						      </label>
						      <label class="radio inline">
						        <input type="radio" value="微信支付" name="pay">微信支付
						      </label>
						      <label class="radio inline">
						        <input type="radio" value="银行卡支付" name="pay" disabled="disabled">银行卡支付
						      </label>
						      <label class="radio inline">
						      <h5>暂不支持银行卡付款</h5>
						      </label>
							</div>
						</div>
							
						<hr>
						<div class="step-tit"><h5>送货清单</h5></div>
							<table class="table table-striped table-hover">
								<col width="150px">
								<col width="150px">
								<col width="100px">
								<col width="100px">
								<col width="200px">
								<col>
								<thead>
									<tr>
										<th>图书展示</th>
										<th>图书信息</th>
										<th>单价</th>
										<th>数量</th>
										<th>出版社</th>
										<th>介绍</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${requestScope.orbooks}" var="j">
										<tr>
											<td><a href="bookinformation?bookid=${ j.bookid }">
												<img src="res/images/bookimage/${ j.bookimage} " width="80" height="80"></a>
											</td>
											<td>${ j.bookname }<br>
												${ j.author }
											</td>
											<td>${ j.unitprice}</td>
											<td> &times; ${ j.quantity }</td>
											<td>${ j.publisher }</td>
											<td>${ j.summary }
												<input name="bookid" value="${ j.bookid }" type="text" style="display:none"/>
												<input name="quantity" value="${ j.quantity }" type="text" style="display:none"/>
											</td>
										</tr>
									</c:forEach>
								</tbody>	
							</table>
						<hr>
						<div class="step-tit"><h5>发票信息</h5></div>
						<div class="invoice-cont">
							<span class="mr10"> 普通发票（电子） &nbsp; </span><span class="mr10"> 个人 &nbsp; </span>
						</div>
						
						<hr>
						<div class="step-tit"><h5>服务</h5></div>
						<div class="invoice-cont">
							<span>熊猫书城负责发货并为您提供售后服务保障</span><br><br>
							<span style="color:red;"><strong>支持七天包退</strong></span>
						</div>
					</div>
					<div class="order-summary">
						<div><span>总金额： </span>￥<strong><%=request.getAttribute("sum") %></strong></div>
						<div><span>优惠： </span>￥<strong style="color:#FC0;">&minus;0</strong></div>
						<div><span>运费： </span>￥<strong style="color:#F60;">&minus;<%=request.getAttribute("postage") %></strong></div>
						<div class="summary">
							<span class="yt">应付总额：</span>
							<div class="ee">￥<strong class="sums"><%=request.getAttribute("sumA") %></strong></div>
						</div>
						<div class="tijiao">
							<input type="submit" value="提交订单" class="btn btn-large btn-success"/>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
<jsp:include page="${basePath}/res-jsp/footer.jsp"/>
<script type="text/javascript" src="res/js/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="res/js/validation/additional-methods.js"></script>
<script type="text/javascript" src="res/js/validation/my-form-validation.js"></script>
<script type="text/javascript">
$(function(){
		$(".input-xxlarge").blur(function(){
			$(this).val($(".input-xxlarge").val().replace(/(^\s+)|(\s+$)/g, ""));
		});
	});
$(function(){
		$("#receiver").blur(function(){
			$(this).val($("#receiver").val().replace(/(^\s+)|(\s+$)/g, ""));
		});
	});
$(function(){
		$("#orderremark").blur(function(){
			$(this).val($("#orderremark").val().replace(/(^\s+)|(\s+$)/g, ""));
		});
	});
</script>
</body>
</html>
