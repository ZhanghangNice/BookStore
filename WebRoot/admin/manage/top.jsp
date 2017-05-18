<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%> 
<%	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="top-nav">
	<div class="logo">
		<a href="<%=basePath %>index.jsp" >
			<img border="0" src="res/images/book_logo.png" width="50" height="50">
			<span class="booklogo">熊猫书城</span>
		</a>
	</div>
	<div class="top-nav-a">
		<ul class="nav nav-pills">
	  		<li class="top_active">
	  			<a href="admin/manage/managebook.jsp">管理所有图书</a>
	  		</li>
	  		<li class="top_active">
	  			<a href="admin/manage/manageEbook.jsp">管理所有电子书</a>
	  		</li>
	  		<li class="top_active">
	  			<a href="admin/manage/stockbook.jsp">添加进货信息</a>
	  		</li>
	  		<li>
	  			<a class="dropdown-toggle"
			       data-toggle="dropdown"
			       href="#">图书上架
			        <b class="caret"></b>
			      </a>
			    <ul class="dropdown-menu">
			      	<li><a href="admin/manage/book.jsp">添加图书基本信息</a></li>
			      	<li class="divider"></li>
			      	<li><a href="admin/manage/addbookdetail.jsp">添加图书详细信息</a></li>
			      	<li class="divider"></li>
			      	<li><a href="admin/manage/addebook.jsp">添加电子书</a></li>
			    </ul>
	  		</li>
	  		<li>
		  		<a class="dropdown-toggle" data-toggle="dropdown"
				       href="#">书城管理
				   <b class="caret"></b>
				</a>
				<ul class="dropdown-menu">
				     <li><a href="admin/manage/manageuser.jsp">查看所有用户信息</a></li>
				     <li class="divider"></li>
				     <li><a href="admin/manage/manageorder.jsp">查看所有订单</a></li>
				     <li class="divider"></li>
				     <li><a href="admin/manage/managefeedback.jsp">查看意见反馈</a></li>
				</ul>
	  		</li>
		</ul>
	</div>
	<div class="trigger">
		<c:if test="${sessionScope['_user'] != null}">
		   <a href="userinformation?temp=1" class="dropdown-toggle">${sessionScope['_user'].name}</a>
		</c:if>	
	</div>
</div>