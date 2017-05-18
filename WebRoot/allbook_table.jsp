<%@ page import="com.zh.bean.BookBean"%>
<%@page import="com.zh.bean.Pagination"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-bordered">
	<col width="222px">
	<col width="222px">
	<col width="222px">
	<col width="222px">
	<col width="222px">
	<tbody>
		<%! int j = 0; %>
		<%  List<BookBean> books = (List<BookBean>)request.getAttribute("books");
			for(BookBean i : books){ 
					j = j+1; %>
		<td class="mytd">
			<div class="myimg">
			<a href="bookinformation?bookid=<%= i.getBookid() %>">
				<img class="thumbs" src="res/images/bookimage/<%= i.getBookimage() %>" width="200" height="200" alt="<%= i.getBookname() %>">
			</a>
			</div>
			<a style="text-decoration: none;">
				<h5><%= i.getBookname() %></h5> 
				<span class="author"><%= i.getAuthor() %></span><br>
				<span class="unitprice">￥<%= i.getUnitprice() %></span>
			</a>
			<a href="addshoppingcart?bookid=<%= i.getBookid() %>&quantity=1" class="btn btn-success">加入购物车</a>
			
			<a class="favorites" href="addfavorite?bookid=<%= i.getBookid() %>" data-toggle="tooltip" title="加入收藏">
				<input class="bookid" value="<%= i.getBookid() %>" style="display:none;">
				<img src="res/images/webico/Favorites.png" width="30" height="30">
			</a>
		</td>
		<% if(j%5==0){out.print("<tr></tr>");}
			} 
			j=0;%>
	</tbody>
</table>
<div class="pagination">
	<ul>
	<% 
		Pagination p = (Pagination)request.getAttribute("pagination");
		for(int i = 1; i <= p.getTotal(); i ++){
	%>
		<li><a href="allbook.jsp?page=<%= i %>"><%= i %></a></li>
	<%
		}
	%>
	</ul>
	<span class="text pull-right">
		总共<%= p.getCount() %>条记录，当前第<%= p.getPage() %>页
	</span>
</div>