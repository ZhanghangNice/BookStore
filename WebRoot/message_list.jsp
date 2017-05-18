<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.zh.bean.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input type="text" id="cuser" value="${sessionScope._user.id}" style="display:none;">
	<c:forEach items="${requestScope.messages}" var="i">
		<dl>
			<dt style="cursor: pointer;">
				<span>${ i.name }</span>
			</dt>
			<dd style="text-decoration: none !important;">
				<span>留言信息</span>：
			</dd>
			<dd style="margin-left: 50px;text-indent: 2em;">
				<span>${ i.message }</span>
			</dd>
			<dd style="text-align: right; margin-right: 50px;">
				<span style="text-align: right;margin-right: 10px;">${ i.date}</span>
				<span><a style="cursor: pointer;" onclick="zanfun( ${book.bookid },${ i.userid});">
				赞(<span id="${ i.userid}">${ i.thumbnum}</span>) 
				</a></span>
			</dd>
			<span class="${ i.userid}" style="margin-right: 0px !important; text-align: right !important;float: right;"></span> 
		</dl>
		<hr>
	</c:forEach>

<div class="pagination">
	<ul>
	<% 
		Pagination p = (Pagination)request.getAttribute("pagination");
		for(int i = 1; i <= p.getTotal(); i ++){
	%>
		<li><a href="bookinformation?bookid=${book.bookid}&&page=<%= i %>"><%= i %></a></li>
	<%
		}
	%>
	</ul>
</div>