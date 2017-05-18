<%@ page import="com.zh.bean.BookBean"%>
<%@page import="com.zh.bean.Pagination"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${requestScope.ebooks}" var="i">
<li class="ebook">
	<div class="ebook-cover">
		<img class="ebook-img" alt="" src="res/ebook/ebookimage/${i.ebookimage }">
	</div>
	<a href="${i.link }" class="ebook-title" target="view_window">${i.ebookname }</a>
	<p class="ebook-price">￥${i.unitprice}</p>
</li>
</c:forEach>