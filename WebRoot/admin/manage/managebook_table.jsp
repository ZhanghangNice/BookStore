<%@page import="com.zh.bean.Pagination"%>
<%@page import="com.zh.bean.BookBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table table-striped table-hover">
	<col width="150px">
	<col width="150px">
	<col width="120px">
	<col width="150px">
	<col width="60px">
	<col width="170px">
	<col width="120px">
	<col>
	<thead>
		<tr>
			<th>图书编号</th>
			<th>图书名称</th>
			<th>作者</th>
			<th>出版社</th>
			<th>单价</th>
			<th>简介</th>
			<th>图书类别</th>
			<th>管理</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.books}" var="i">
			<tr>
				<td><img class="m-img" src="res/images/bookimage/${ i.bookimage} " width="50" height="50"><br>
					${ i.bookid }
				</td>
				<td>${ i.bookname }</td>
				<td>${ i.author }</td>
				<td>${ i.publisher }</td>
				<td>${ i.unitprice }</td>
				<td class="dysl">${ i.summary }</td>
				<td>${ i.classid }</td>
				<td>
					<a href="editbook?bookid=${ i.bookid }" class="btn btn-small">
						<span class="icon-pencil"></span> 编辑
					</a>
					<a href1="deletebook?bookid=${ i.bookid }" class="btn btn-small btn-danger button-book-delete">
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