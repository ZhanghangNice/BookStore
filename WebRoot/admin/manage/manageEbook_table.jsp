<%@page import="com.zh.bean.Pagination"%>
<%@page import="com.zh.bean.BookBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-striped table-hover">
	<col width="70px">
	<col width="160px">
	<col width="180px">
	<col width="160px">
	<col width="90px">
	<col width="180px">
	<col width="110px">
	<col>
	<thead>
		<tr>
			<th>编号</th>
			<th></th>
			<th>图书名称</th>
			<th>作者</th>
			<th>单价</th>
			<th>简介</th>
			<th>图书类别</th>
			<th>管理</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.ebooks}" var="i">
			<tr>
				<td>${ i.id }</td>
				<td><img class="m-img" src="res/ebook/ebookimage/${ i.ebookimage} " width="50" height="50"></td>
				<td>${ i.ebookname }</td>
				<td>${ i.author }</td>
				<td>${ i.unitprice }</td>
				
				<td class="dysl" data-toggle="tooltip"title="${ i.summary }">
				${ i.summary }</td>
				<td>${ i.classid }</td>
				<td>
					<a href1="deleteEbook?id=${ i.id }" class="btn btn-small btn-danger button-book-delete">
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
		<li><a href="admin/manage/managebook.jsp?page=<%= i %>"><%= i %></a></li>
	<%
		}
	%>
	</ul>
	<span class="text pull-right">
		总共<%= p.getCount() %>条记录，当前第<%= p.getPage() %>页
		<%-- <%= p.getTotal() %>页，每页<%= p.getRows() %>条， --%>
	</span>
</div>