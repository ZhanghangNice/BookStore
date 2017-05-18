<%@page import="com.zh.bean.Pagination"%>
<%@page import="com.zh.bean.UserBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-striped table-hover">
	<col width="60px">
	<col width="120px">
	<col width="60px">
	<col width="100px">
	<col width="120px">
	<col width="120px">
	<col width="120px">
	<col width="150px">
	<col width="60px">
	<col>
	<thead>
		<tr>
			<th>编号</th>
			<th>用户名</th>
			<th>性别</th>
			<th>生日</th>
			<th>邮箱</th>
			<th>QQ</th>
			<th>电话</th>
			<th>地址</th>
			<th>权限</th>
			<th>管理</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.users}" var="items">
			<tr>
				<td>${ items.userid }</td>
				<td class="dysl" data-toggle="tooltip" title="${ items.username }">${ items.username }</td>
				<td>${ items.sex }</td>
				<td>${ items.birthday }</td>
				<td class="dysl" data-toggle="tooltip" title="${ items.email }">${ items.email }</td>
				<td class="dysl" data-toggle="tooltip" title="${ items.qq }">${ items.qq }</td>
				<td>${ items.tel }</td>
				<td class="dysl" data-toggle="tooltip" title="${ items.addr }">${ items.addr }</td>
				<td <c:if test="${ items.permission =='true'}"> style="color:#56AC00; font-weight:bold"</c:if>>
				${ items.permission}</td>
				<td>
					<a href="setadmin?userid=${ items.userid }" class="btn btn-small" 
					<c:if test="${ items.userid == sessionScope._user.id}">style="display:none"</c:if>>
						<span></span>设为管理员
					</a>
					<a href1="deleteuser?userid=${ items.userid }" class="btn btn-small btn-danger button-book-delete"
					<c:if test="${ items.userid == sessionScope._user.id}">style="display:none"</c:if>>
						<span class="icon-trash icon-white"></span> 删除
					</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>	
</table>
<!-- 分页 -->
<div class="pagination">
	<ul>
	<% 
		Pagination p = (Pagination)request.getAttribute("pagination");
		for(int i = 1; i <= p.getTotal(); i ++){
	%>
		<li><a href="admin/manage/manageuser.jsp?page=<%= i %>"><%= i %></a></li>
	<%
		}
	%>
	</ul>
	<span class="text pull-right">
		总共<%= p.getCount() %>条记录，当前第<%= p.getPage() %>页
		<%-- <%= p.getTotal() %>页，每页<%= p.getRows() %>条， --%>
	</span>
</div>