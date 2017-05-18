<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	page import="com.zh.bean.BookBean "%>
<%@	page import="java.util.List"%>

<table class="table table-striped table-hover">
	<col width="180px">
	<col width="180px">
	<col width="120px">
	<col width="250px">
	<col>
	<thead>
		<tr>
			<th></th>
			<th>图书信息</th>
			<th>单价</th>
			<th>图书简介</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.favorites}" var="j">
			<tr>
				<td><a href="bookinformation?bookid=${ j.bookid }">
					<img src="res/images/bookimage/${ j.bookimage} " width="100" height="100"></a>
					<img id="imgTip">
				</td>
				<td style="text-align:left;">
					书名：${ j.bookname }<br>
					作者：${ j.author }
				</td>
				<td>${ j.unitprice }</td>
				<td class="dysl">${ j.summary }</td>
				<td>
					<a href="deletefavorite?bookid=${ j.bookid }&del=0"class="del">
						<span class="icon-trash"></span> 删 除 
					</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<c:if test="${requestScope.favorites == '[]'}">
<a href="index.jsp" class="fav">
	<img src="res/images/webico/fav.jpg">
	<h4>您的收藏夹为空，快去逛逛吧</h4>
</a>
</c:if>
<c:if test="${requestScope.favorites != '[]'}">
	<a href1="deletefavorite?del=1" class="btn adel btn-large del"><span class="icon-remove"></span>清空收藏夹 </a>
</c:if>