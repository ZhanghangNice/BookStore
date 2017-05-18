<%@page import="com.zh.bean.Pagination"%>
<%@page import="com.zh.bean.BookBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table class="table table-striped table-hover">
	<col width="100px">
	<col width="100px">
	<col width="100px">
	<col width="60px">
	<col width="60px">
	<col width="100px">
	<col width="230px">
	<col width="80px">
	<col width="140px">
	<col>
	<thead>
		<tr>
			<th>订单编号</th>
			<th>用户名</th>
			<th>图书信息</th>
			<th>销售</th>
			<th>数量</th>
			<th>下单时间</th>
			<th>收货信息</th>
			<th>送货员</th>
			<th>备注</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.orders}" var="i">
			<tr>
				<td>${ i.orderid }</td>
				<td>${ i.username }</td>
				<td><img src="res/images/bookimage/${ i.bookimage} " width="50" height="50"><br>
				</td>
				<td>${ i.unitprice }&times;${ i.quantity }</td>
				<td></td>
				<td>${ i.ordertime }</td>
				<td class="dysl">收货人：${ i.receiver }<br>
					收货地址：${ i.address }<br>
					联系方式：${ i.contact }<br>
				</td>
				<td>${ i.courier }</td>
				<td class="dysl">${ i.orderremark }</td>
				<td>
					<a href1="deleteOrderM?id=${ i.id }" class="btn btn-small btn-danger button-book-delete">
						<span class="icon-trash icon-white"></span> 删除
					</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>	
</table>
<div class="pagination">
	<ul>
	<% 
		Pagination p = (Pagination)request.getAttribute("pagination");
		for(int i = 1; i <= p.getTotal(); i ++){
	%>
		<li><a href="admin/manage/manageorder.jsp?page=<%= i %>"><%= i %></a></li>
	<%
		}
	%>
	</ul>
	<span class="text pull-right">
		总共<%= p.getCount() %>条记录，当前第<%= p.getPage() %>页
		<%-- <%= p.getTotal() %>页，每页<%= p.getRows() %>条， --%>
	</span>
</div>