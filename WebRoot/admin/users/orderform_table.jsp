<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.zh.bean.BookBean"%>
<%@page import="java.util.List"%>

<table class="table table-striped table-hover">
	<col width="130px">
	<col width="70px">
	<col width="70px">
	<col width="260px">
	<col width="90px">
	<col width="120px">
	<col>
	<thead>
		<tr>
			<th>所有订单</th>
			<th>数量</th>
			<th>金额</th>
			<th>收货信息</th>
			<th>送货员</th>
			<th>状态</th>
			<th>物流信息</th>
		</tr>
	</thead>
	<c:forEach items="${requestScope.orderforms}" var="j">
	<tbody>
		<tr class="mytr">
			<td>下单时间：${ j.ordertime}&nbsp;&nbsp;&nbsp;&nbsp;
				订单号：${ j.orderid }&nbsp;&nbsp;&nbsp;&nbsp;
				书名：${j.bookname }&nbsp;&nbsp;
				
			</td>
			<td style="float:right; border:0px; margin-top:-35px;">
			<a href="deleteOrder?bookid=${ j.bookid }&orderid=${ j.orderid }" ><i class="icon-trash"></i></a></td>
		</tr>
		<tr class="ordertr">
 			<td><br><br>
 				<a href="bookinformation?bookid=${ j.bookid }" style="text-decoration: none;">
					<img src="res/images/bookimage/${ j.bookimage} " width="100" height="100">
				</a>
			</td>
			<td><br><br>&times;${ j.quantity }</td>
			<td><br><br>${ j.quantity*j.unitprice }元</td>
			<td style="text-align:left;"><br><br>
				收货人：${ j.receiver }<br>
				收货地址：${ j.address }<br>
				联系电话：${ j.contact }</td>
			<td><br><br>${ j.courier }</td>
			<td><br><br>未支付<br>
				<a class="pay" style="text-decoration:none;">${ j.pay}</a></td>
			<td><br><br>您的货物正在等待出库，请先支付！<%-- ${ j.orderremark } --%></td>
		</tr>
	</tbody>
	</c:forEach>
</table>
<c:if test="${requestScope.orderforms == '[]'}">
<h2 style="margin-left:400px;margin-top:40px; color:#0096DA;">空</h2>
</c:if>