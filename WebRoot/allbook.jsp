<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>所有图书</title>
<link href="res/bootstrap/css/bootstrap.css"  rel="stylesheet">
<link href="res/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="res/mycss/home.css"  rel="stylesheet">
<link href="res/mycss/allbook.css" rel="stylesheet">
<jsp:include page="res-jsp/web_ico.jsp"/>
</head>
<body>
	<jsp:include page="res-jsp/navigation.jsp"/>
	<div class="row">
		<div class="myspan">
			<table class="table">
				<col width="120px">
				<thead>
					<tr>
						<th>图书搜索</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>书名:</td>
						<td>
							<form class="form-search" action="bookname" method="post">
								<input type="text" class="input-medium search-query" name="bookname" id="bookname">
								<button type="submit" class="btn">搜 &emsp; 索</button>
							</form>
						</td>
						<td>作者:</td>
						<td>
							<form class="form-search" action="author" method="post">
								<input type="text" class="input-medium search-query" name="author" id="author">
								<button type="submit" class="btn">搜 &emsp; 索</button>
							</form>
						</td>
						
					</tr>
					<tr>
						<td>图书类型:</td>
						<td>
							<form class="form-search" action="bookclass" method="post">
									<select name="classid" class="class-select search-query" style="outline: medium none;">
										<option value="A"<c:if test="${ search_classid == 'A' }"> selected="selected"</c:if>>马列主义、毛泽东思想、邓小平理论</option>
										<option value="B"<c:if test="${ search_classid == 'B' }"> selected="selected"</c:if>>哲学、宗教</option>
										<option value="C"<c:if test="${ search_classid == 'C' }"> selected="selected"</c:if>>社会科学总论</option>
										<option value="D"<c:if test="${ search_classid == 'D' }"> selected="selected"</c:if>>政治、法律</option>
										<option value="E"<c:if test="${ search_classid == 'E' }"> selected="selected"</c:if>>军事</option>
										<option value="F"<c:if test="${ search_classid == 'F' }"> selected="selected"</c:if>>经济</option>
										<option value="G"<c:if test="${ search_classid == 'G' }"> selected="selected"</c:if>>文化、科学、教育、体育</option>
										<option value="H"<c:if test="${ search_classid == 'H' }"> selected="selected"</c:if>>语言文字</option>
										<option value="I"<c:if test="${ search_classid == 'I' }"> selected="selected"</c:if>>文学</option>
										<option value="J"<c:if test="${ search_classid == 'J' }"> selected="selected"</c:if>>艺术</option>
										<option value="K"<c:if test="${ search_classid == 'K' }"> selected="selected"</c:if>>历史、地理</option>
										<option value="N"<c:if test="${ search_classid == 'N' }"> selected="selected"</c:if>>自然科学总论</option>
										<option value="O"<c:if test="${ search_classid == 'O' }"> selected="selected"</c:if>>数理科学、化学</option>
										<option value="P"<c:if test="${ search_classid == 'P' }"> selected="selected"</c:if>>天文学、地球科学</option>
										<option value="Q"<c:if test="${ search_classid == 'Q' }"> selected="selected"</c:if>>生物科学</option>
										<option value="R"<c:if test="${ search_classid == 'R' }"> selected="selected"</c:if>>医药、卫生</option>
										<option value="S"<c:if test="${ search_classid == 'S' }"> selected="selected"</c:if>>农业科学</option>
										<option value="T"<c:if test="${ search_classid == 'T' }"> selected="selected"</c:if>>工业技术</option>
										<option value="U"<c:if test="${ search_classid == 'U' }"> selected="selected"</c:if>>交通运输</option>
										<option value="V"<c:if test="${ search_classid == 'V' }"> selected="selected"</c:if>>航空/航天</option>
										<option value="X"<c:if test="${ search_classid == 'X' }"> selected="selected"</c:if>>环境科学、安全科学</option>
										<option value="Z"<c:if test="${ search_classid == 'Z' }"> selected="selected"</c:if>>综合性图书</option>
									</select>
								<button type="submit" class="btn">搜 &emsp; 索</button>
							</form>
						</td>
						<td>价格区间:</td>
						<td>
							<form class="form-search" action="unitprice" method="post">
								<input type="text" class="input-small search-query" name="unitprice1" id="unitprice1">~
								<input type="text" class="input-small search-query" name="unitprice2" id="unitprice2">
								<button type="submit" class="btn">搜 &emsp; 索</button>
							</form>
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
			<hr class="featurette-divider divider">
			<div>
				<c:import url="/allbook_table"/>
			</div>
		</div>
	</div>
	
<jsp:include page="res-jsp/footer.jsp"/>
<script type="text/javascript" src="res/js/validation/jquery.validate.min.js"></script>
<script language="JavaScript" type="text/javascript"> 
function GetUrlParms()    
{
    var args=new Object();   
    var query=location.search.substring(1);//获取查询串   
    var pairs=query.split("?");//在逗号处断开   
    for(var   i=0;i<pairs.length;i++)   
    {
        var pos=pairs[i].indexOf('=');//查找name=value   
        if(pos==-1)   continue;//如果没有找到就跳过   
        var argname=pairs[i].substring(0,pos);//提取name   
        var value=pairs[i].substring(pos+1);//提取value   
        args[argname]=unescape(value);//存为属性   
    }
    return args;
}
var args = new Object();
args = GetUrlParms();
if(args["return"]!=undefined)
{
	var value1 = args["return"] ;
	if(value1==00){
		alert("图书已加入收藏！");
	}
}

/* $(function(){
	$(".favorites").click(function(){
		$.post("addfavoriteAjax", {bookid: $(this).find('input[class*=bookid]').val()});
	});
}); */
</script>
<script type="text/javascript">
$(document).ready(function(){
	$(".thumbs").hover(function(){
		$(this).animate({ height:'220px', width:'220px'}, "fast");
		},function(){
		$(this).animate({ height:'200px', width:'200px'}, "fast");
		$(this).finish();
	});
});

$(function(){
	$("#bookname").blur(function(){
		$(this).val($("#bookname").val().replace(/(^\s+)|(\s+$)/g, ""));
	});
});
$(function(){
	$("#author").blur(function(){
		$(this).val($("#author").val().replace(/(^\s+)|(\s+$)/g, ""));
	});
});
$(function(){ 
	$("#unitprice1").blur(function(){
		$(this).val($("#unitprice1").val().replace(/(^\s+)|(\s+$)/g, ""));
	});
});
$(function(){
	$("#unitprice2").blur(function(){
		$(this).val($("#unitprice2").val().replace(/(^\s+)|(\s+$)/g, ""));
	});
}); 
</script>
</body>
</html>