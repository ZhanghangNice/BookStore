<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<style type="text/css">
#hotbook_a {
	height: 526px;
	width: 250px;
	padding: 0px;
	margin: 0PX;
	overflow-y: auto;
}

#hotbook_firstli a {
	background: #F2DEDE;
	width: 207px;
}

#hotbook_firstli a img {
	float: left;
	margin-top: 7px;
	margin-right: 5px;
	width: 25px;
	height: 25px;
}
</style>
<%
	int n = 1;
%>
<ul class="nav nav-tabs nav-stacked"  id="hotbook_a">
	<li id="hotbook_firstli"><a _href="#"><img alt="" src="res/images/specialbooks/copy.png" ><span><h4>书籍热度排名</h4></span> </a>
	</li>
	<c:forEach items="${requestScope.books}" var="i">
		<%
			if (n <= 2) {
		%>

		<li><a href="bookinformation?bookid=${i.bookid}"
			style="width:207px;
			white-space:nowrap; 
			text-overflow:ellipsis !important;
			overflow:hidden; "><span
				class="badge badge-important"
				style="margin-top: 5px;margin-left: 1px;margin-right: 5px; "><%=n%></span>${
				i.bookname}</a>
		</li>
		<%
			n++;
				} else if ((n <= 5)) {
		%>
		<li><a href="bookinformation?bookid=${i.bookid}" style="width:207px;
			white-space:nowrap; 
			text-overflow:ellipsis !important;
			overflow:hidden; "><span
				class="badge badge-success"
				style="margin-top: 5px;margin-left: 1px;margin-right: 5px;"><%=n%></span>${
				i.bookname }</a>
		</li>
		<%
			n++;
				} else if ((n <= 10)) {
		%>
		<li><a href="bookinformation?bookid=${i.bookid}" style="width:207px;
			white-space:nowrap; 
			text-overflow:ellipsis !important;
			overflow:hidden; "><span
				class="badge badge-info"
				style="margin-top: 5px;margin-left: 1px;margin-right: 5px;"><%=n%></span>${
				i.bookname }</a>
		</li>
		<%
			n++;
				} else{
		%>
		<li class="most" style="display: none;"><a href="bookinformation?bookid=${i.bookid}" style="width:207px;
			white-space:nowrap; 
			text-overflow:ellipsis !important;
			overflow:hidden; "><span
				class="badge badge-success"
				style="margin-top: 5px;margin-left: 1px;margin-right: 5px;"><%=n%></span>${
				i.bookname }</a>
		</li>
		<%
			n++;
				} 
		%>
	</c:forEach>
		<li id="mostall"><a _href="" style="width:207px;
			text-align:right;
			white-space:nowrap; 
			text-overflow:ellipsis !important;
			overflow:hidden; "><span style="padding-right: 40px;" onclick="hotfun();">查看更多...</span></a>
		</li>
</ul>


