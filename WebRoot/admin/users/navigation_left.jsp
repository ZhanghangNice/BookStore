<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<div class="navbar-inner">
	<dl class="my-left-nav">
    	<dd class="top_active">
      		<a href="userinformation?temp=1">
      		 个人资料
      		 <i class="icon-chevron-right"></i></a>
      	</dd>
      	<dd class="top_active">
      		<a href="admin/users/shoppingcart.jsp">
      		 我的购物车
      		 <i class="icon-chevron-right"></i></a>
      	</dd>
      	<dd class="top_active">
      		<a href="admin/users/userfavorite.jsp">
      		 我的收藏
      		 <i class="icon-chevron-right "></i></a>
      	</dd>
      	<dd class="top_active">
      		<a href="userinformation?temp=0">
      		 个人信息完善
      		 <i class="icon-chevron-right "></i></a>
      	</dd>
      	<dd class="top_active">
          	<a href="admin/users/orderform.jsp">
          	查看订单信息
          	<i class="icon-chevron-right "></i></a>
        </dd>
        <dd class="top_active">
          	<a href="admin/users/changepassword.jsp">
          	密码修改
          	<i class="icon-chevron-right "></i></a>
        </dd>
   </dl>
  </div>
<!-- <div class="walk">
<img src="res/images/webico/walk.gif">
</div> -->