<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="navbar-wrapper">
	<div class="container">
		<div class="navbar navbar-default">
			<div class="navbar-inner">
				<a class="brand" href="index.jsp">
				 	<img src="res/images/book_logo.png" width="40" height="40">熊猫书城
				</a>
				<div class="nav-collapse collapse">
					<ul class="nav pull-right">
   						<c:if test="${sessionScope['_user'] == null}">
    						<li><a href="login.jsp">登录</a></li>
    						<li><a href="register.jsp">注册</a></li>
	    				</c:if>
		    			<c:if test="${sessionScope['_user'] != null}">
			  				<li class="dropdown">
				    			<button class="dropbtn">${sessionScope['_user'].name}<b class="caret"></b></button>
   								<ul class="dropdown-menu">
    								<li><a href="userinformation?temp=1">个人信息</a></li>
    								<c:if test="${sessionScope['_user'].permission == 1 }">
		    							<li class="divider"></li>
		    							<li><a href="admin/manage/managebook.jsp">后台管理</a></li>
		    						</c:if>
	    							<li class="divider"></li>
		    						<li><a href="exitlogin?return=0" class="exit1">退出登录</a></li>
		    						
			    				</ul>
							</li>
						</c:if>    
					</ul>    
				    <ul class="nav h_n">
					  	<li class=""><a href="index.jsp">首页</a></li>
						<li class=""><a href="allbook.jsp">所有图书</a></li>
						<li class=""><a href="specialbook.jsp">特色书</a></li>
						<li class=""><a href="ebook.jsp">电子书</a></li>
						<li class=""><a href="feedback.jsp">意见反馈</a></li>
						<li><a href="contact.jsp">联系我们</a></li>
						<li><a href="question.jsp">问题帮助</a></li>
						<%-- <li class="dropdown">
							<a href="##" class="dropdown-toggle"data-toggle="dropdown">更多 
								<b class="caret"></b>
							</a>
							<ul class="dropdown-menu">
								<li><a href="contact.jsp">联系我们</a></li>
								<li><a href="question.jsp">问题帮助</a></li>
								<li><a href="index.jsp">关于我们</a></li>
							</ul>
						</li> --%>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>