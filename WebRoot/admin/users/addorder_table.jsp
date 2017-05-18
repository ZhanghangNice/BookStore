<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.zh.bean.CartBean"%>
<%@page import="java.util.List"%>
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
				<td>${ j.summary }</td>
			</tr>
		</c:forEach>
	</tbody>	
</table>