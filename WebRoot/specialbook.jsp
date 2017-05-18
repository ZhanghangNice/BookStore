<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>特色书</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="res/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="res/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="res/mycss/home.css" rel="stylesheet">
<link href="res/js/zh/960.min.css" rel="stylesheet" />
<link href="res/js/zh/jquery.excoloSlider.css" rel="stylesheet" />
<jsp:include page="res-jsp/web_ico.jsp" />

<style type="text/css">
.srow_a {
	width: 1200px;
	height:526;
	margin:auto;
	margin-left: auto;
	margin-right: auto;
}

.sleft {
	position: absolute;
	top: 128px;
}

.sright {
	margin-top: 100px;
}

.s_table {
	width: 1200px;
	margin: 0 auto !important;
	padding: 0px !important;
	margin-top: 20px !important;
}

#sh2 {
	text-align: center;
	margin-top: 0px;
	padding: 0px;
}
</style>
</head>

<body>
	<jsp:include page="res-jsp/navigation.jsp"/>
	<div class="srow_a">
		<div class="sleft">
			<c:import url="/hotbooks"/>
		</div>
		<!-- 轮播部分 -->
		<div class="sright">
			<div class="container_12">
				<div class="grid_8">
					<div id="sliderA" class="slider">
						<img src="res/images/bookdetailimage/534debb664c7f.jpg" width="900px" height="400px" />
						<img src="res/images/bookdetailimage/562ASCEeAADIiK4561.jpg" width="900px" height="400px" /> 
						<img src="res/images/bookdetailimage/1385370967887fkzpi.jpg" width="900px" height="400px" />
						<img src="res/images/bookdetailimage/5664eeb2N1fb4f0d3.jpg" width="900px" height="400px" />
						<img src="res/images/bookdetailimage/56800asrf6dsfwe611.jpg" width="900px" height="400px" /> 
						<img src="res/images/bookdetailimage/569sdatew32sdtftwes.jpg" width="900px" height="400px" /> 
						<img src="res/images/bookdetailimage/569de896Nde7951a3.jpg" width="900px" height="400px" />
						<img src="res/images/bookdetailimage/55d3d674N4efb3b8a.jpg" width="900px" height="400px" />
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="s_table" >
	<hr style="margin: 0px;padding:0px;">
	<h2 id="sh2">热销图书</h2>
	<table  frame="below" class="table table-striped" style="border: 0 px;">
	<col width="240px">
	<col width="240px">
	<col width="240px">
	<col width="240px">
	<tbody>
	<tr class="info">
	<td> <a href="bookinformation?bookid=9787213066856"><img alt="" src="res/images/bookimage/20160110121830.png" width=224px; height=224px;/> </a></td>
	<td> <a href="bookinformation?bookid=9787506341271"><img alt="" src="res/images/bookimage/20160110122701.png" width=224px; height=224px;/> </a></td>
	<td> <a href="bookinformation?bookid=9787510446627"><img alt="" src="res/images/bookimage/20160110124112.png" width=224px; height=224px;/> </a></td>
	<td> <a href="bookinformation?bookid=9787550015371"><img alt="" src="res/images/bookimage/20160110151628.png" width=224px; height=224px;/> </a></td>
	<td> <a href="bookinformation?bookid=9787547711101"><img alt="" src="res/images/bookimage/20160110124710.png" width=224px; height=224px;/> </a></td>
	</tr>
	<tr class="info">
	<td> <a href="bookinformation?bookid=9787508643298"><img alt="" src="res/images/bookimage/20160110123714.png" width=224px; height=224px;/> </a></td>
	<td> <a href="bookinformation?bookid=9787508651903"><img alt="" src="res/images/bookimage/20160110123920.png" width=224px; height=224px;/> </a></td>
	<td> <a href="bookinformation?bookid=9787508657493"><img alt="" src="res/images/bookimage/20160110124029.png" width=224px; height=224px;/> </a></td>
	<td> <a href="bookinformation?bookid=9787549107124"><img alt="" src="res/images/bookimage/20160110124809.png" width=224px; height=224px;/> </a></td>
	<td> <a href="bookinformation?bookid=9787121273087"><img alt="" src="res/images/bookimage/20160110151532.png" width=224px; height=224px;/> </a></td>
	</tr>
	</tbody>
	</table>
	
	
	<h2 id="sh2">经典图书</h2>
	<table  frame="below" class="table table-striped" style="border: 0 px;">
	<col width="240px">
	<col width="240px">
	<col width="240px">
	<col width="240px">
	<tbody>
	<tr class="error">
	<td> <a href="bookinformation?bookid=9787550015432"><img alt="" src="res/images/bookimage/20160110145558.png" width=224px; height=224px;/> </a></td>
	<td> <a href="bookinformation?bookid=9787550263802"><img alt="" src="res/images/bookimage/20160110125009.png" width=224px; height=224px;/> </a></td>
	<td> <a href="bookinformation?bookid=9787550248083"><img alt="" src="res/images/bookimage/20160110124936.png" width=224px; height=224px;/> </a></td>
	<td> <a href="bookinformation?bookid=9787535481108"><img alt="" src="res/images/bookimage/20160110151737.png" width=224px; height=224px;/> </a></td>
	<td> <a href="bookinformation?bookid=9787508657493"><img alt="" src="res/images/bookimage/20160110122543.png" width=224px; height=224px;/> </a></td>
	</tr>
	</tbody>
	</table>
	</div>
	
<jsp:include page="res-jsp/footer.jsp"/>
<script src="res/js/zh/jquery.excoloSlider.js"></script>
<script src="res/js/zh/adapt.min.js"></script>
<script>
	$(function() {
		$("#sliderA").excoloSlider();
	});
</script>
<script type="text/javascript">
function hotfun(){
$(".most").css("display","inline");
$("#mostall").remove();
}
</script>
</body>
</html>
