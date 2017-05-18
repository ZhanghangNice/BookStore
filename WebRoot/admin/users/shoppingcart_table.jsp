<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.zh.bean.CartBean"%>
<%@ page import="java.util.List"%>
<table class="table table-striped table-hover">
	<col width="80px">
	<col width="160px">
	<col width="130px">
	<col width="100px">
	<col width="130px">
	<col width="110px">
	<col>
	<thead>
		<tr>
			<th>选项</th>
			<th>图书展示</th>
			<th>书名</th>
			<th>单价</th>
			<th>数量</th>
			<th>金额</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${requestScope.carts}" var="j">
			<tr>
				<td class="mycheck">
  					<input type="checkbox" class="mycheckbox${ j.count}">
  				</td>
				<td><a href="bookinformation?bookid=${ j.bookid }">
					<img src="res/images/bookimage/${ j.bookimage} " width="100" height="100"></a>
				</td>
				<td>${ j.bookname }<input id="bookid${ j.count}" value="${ j.bookid }" style="display:none;"/></td>
				<td class="price${ j.count}">${ j.unitprice}</td>
				<td>
				<span class="property-quantity">
     	        	<span class="property-quantity-control">
                		<button class="btn vm-minus lower${ j.count}" style="outline:none;">-</button>
                        <input class="text_box${ j.count}" type="text" value="${ j.quantity }" disabled>
                        <button class="btn  vm-plus add${ j.count}" style="outline:none;">+</button>
                	</span>
                </span>
                </td>
				<td><h5><span class="sum${ j.count}" style="color:red;"></span></h5></td>
				<td>
					<a href="addfavorite?bookid=${ j.bookid }">
						<span class="icon-heart"></span>加入收藏
					</a><br><br>
					<a href="deleteshoppingcart?bookid=${ j.bookid }&del=0" class="del">
						<span class="icon-trash"></span>删除
					</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<c:if test="${requestScope.carts == '[]'}">
<a href="index.jsp">
<img src="res/images/webico/kongcart.png" height="220px" width="900px"></a>
</c:if>
<div class="myheji"> 
	<hr class="my-hr">
	<input id="checkAll" type="checkbox"/><span class="checkAll">全选</span> 
	<a href1="deleteshoppingcart?del=1" class="mydel del" style="cursor:pointer;">全部删除</a> 
	<!-- <span class="yixuanbook">已选图书 <strong>0</strong> 本</span>	 -->	
	<strong class="jine">总金额<span class="msum"></span>元</strong>		
	<span class="jiesuan">
		<a href="admin/users/addorderform.jsp" 
			class="mybtn">去结算</a>
	</span>
</div>