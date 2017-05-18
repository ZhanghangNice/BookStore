<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>修改图书基本-图书管理</title>
<link href="res/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="res/mycss/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<link href="res/mycss/addbookdetail.css" rel="stylesheet">
<jsp:include page="${basePath}/res-jsp/web_ico.jsp" />
</head>
<body>
 	<jsp:include page="top.jsp"/>
 	<div class="row">
		 <div class="myspan">
	    	<form action="updatebook" method="post" class="form-horizontal" id="mybookform">
				<div id="legend" class="">
					<legend>修改图书信息</legend>
				</div>
				<div class="control-group">
					<label class="control-label">图书编号：</label>
					<div class="controls">
						<input type="text" name="bookid" value="${ book.bookid }"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">图书名称：</label>
					<div class="controls">
						<input type="text" name="bookname"  value="${ book.bookname }"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">售价：</label>
						<div class="controls">
						<input type="text" name="unitprice"  value="${ book.unitprice }"
						onkeyup="value=value.replace(/\.\d{2,}$/,value.substr(value.indexOf('.'),3))"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">作者：</label>
						<div class="controls">
						<input type="text" name="author"  value="${ book.author }"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">出版社：</label>
					<div class="controls">
						<input type="text" name="publisher"  value="${ book.publisher }"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">图书类别：</label>
					<div class="controls">
						<select name="classid">
							<option value="A"<c:if test="${ book.classid == 'A' }"> selected="selected"</c:if>>马列主义、毛泽东思想、邓小平理论</option>
							<option value="B"<c:if test="${ book.classid == 'B' }"> selected="selected"</c:if>>哲学、宗教</option>
							<option value="C"<c:if test="${ book.classid == 'C' }"> selected="selected"</c:if>>社会科学总论</option>
							<option value="D"<c:if test="${ book.classid == 'D' }"> selected="selected"</c:if>>政治、法律</option>
							<option value="E"<c:if test="${ book.classid == 'E' }"> selected="selected"</c:if>>军事</option>
							<option value="F"<c:if test="${ book.classid == 'F' }"> selected="selected"</c:if>>经济</option>
							<option value="G"<c:if test="${ book.classid == 'G' }"> selected="selected"</c:if>>文化、科学、教育、体育</option>
							<option value="H"<c:if test="${ book.classid == 'H' }"> selected="selected"</c:if>>语言文字</option>
							<option value="I"<c:if test="${ book.classid == 'I' }"> selected="selected"</c:if>>文学</option>
							<option value="J"<c:if test="${ book.classid == 'J' }"> selected="selected"</c:if>>艺术</option>
							<option value="K"<c:if test="${ book.classid == 'K' }"> selected="selected"</c:if>>历史、地理</option>
							<option value="N"<c:if test="${ book.classid == 'N' }"> selected="selected"</c:if>>自然科学总论</option>
							<option value="O"<c:if test="${ book.classid == 'O' }"> selected="selected"</c:if>>数理科学、化学</option>
							<option value="P"<c:if test="${ book.classid == 'P' }"> selected="selected"</c:if>>天文学、地球科学</option>
							<option value="Q"<c:if test="${ book.classid == 'Q' }"> selected="selected"</c:if>>生物科学</option>
							<option value="R"<c:if test="${ book.classid == 'R' }"> selected="selected"</c:if>>医药、卫生</option>
							<option value="S"<c:if test="${ book.classid == 'S' }"> selected="selected"</c:if>>农业科学</option>
							<option value="T"<c:if test="${ book.classid == 'T' }"> selected="selected"</c:if>>工业技术</option>
							<option value="U"<c:if test="${ book.classid == 'U' }"> selected="selected"</c:if>>交通运输</option>
							<option value="V"<c:if test="${ book.classid == 'V' }"> selected="selected"</c:if>>航空/航天</option>
							<option value="X"<c:if test="${ book.classid == 'X' }"> selected="selected"</c:if>>环境科学、安全科学</option>
							<option value="Z"<c:if test="${ book.classid == 'Z' }"> selected="selected"</c:if>>综合性图书</option>
						</select>
					</div>
				</div>
				<div class="control-group">
						<label class="control-label">版次：</label>
						<div class="controls">
							<select name="edition">
								<option <c:if test="${ bookdetail.edition == '1' }"> selected="selected"</c:if>>1</option>
								<option <c:if test="${ bookdetail.edition == '2' }"> selected="selected"</c:if>>2</option>
								<option <c:if test="${ bookdetail.edition == '3' }"> selected="selected"</c:if>>3</option>
								<option <c:if test="${ bookdetail.edition == '4' }"> selected="selected"</c:if>>4</option>
								<option <c:if test="${ bookdetail.edition == '5' }"> selected="selected"</c:if>>5</option>
								<option <c:if test="${ bookdetail.edition == '6' }"> selected="selected"</c:if>>6</option>
								<option <c:if test="${ bookdetail.edition == '7' }"> selected="selected"</c:if>>7</option>
								<option <c:if test="${ bookdetail.edition == '8' }"> selected="selected"</c:if>>8</option>
								<option <c:if test="${ bookdetail.edition == '9' }"> selected="selected"</c:if>>9</option>
								<option <c:if test="${ bookdetail.edition == '10' }"> selected="selected"</c:if>>10</option>
							</select>
						</div>

					</div>
					<div class="control-group">
						<label class="control-label">包装：</label>
						<div class="controls">
							<label class="radio inline">
								<input type="radio" value="平装" name="packaging" 
								<c:if test="${ bookdetail.packaging == '平装' }"> checked="checked"</c:if>>平装
							</label>
							<label class="radio inline">
								<input type="radio" value="精装" name="packaging"
								<c:if test="${ bookdetail.packaging == '精装' }"> checked="checked"</c:if>>精装
							</label>
							<label class="radio inline">
								<input type="radio" value="盒装" name="packaging"
								<c:if test="${ bookdetail.packaging == '盒装' }"> checked="checked"</c:if>>盒装
							</label>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">开本：</label>
						<div class="controls">
							<label class="radio inline">
								<input type="radio" value="16" name="format" 
								<c:if test="${ bookdetail.format == '16' }"> checked="checked"</c:if>>16
							</label>
							<label class="radio inline">
								<input type="radio" value="32" name="format"
								<c:if test="${ bookdetail.format == '32' }"> checked="checked"</c:if>>32
							</label>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">页数：</label>
						<div class="controls">
							<input type="text" name="numpages" value="${bookdetail.numpages }">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">出版时间：</label>
						<div class="controls">
							<input type="text" name="publdata" readonly class="publdata" value="${bookdetail.publdata }">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">语言：</label>
						<div class="controls">
							<select name="language">
								<option>中文简体</option>
								<option>中文繁体</option>
								<option>英语</option>
								<option>法语</option>
								<option>韩语</option>
								<option>日语</option>
								<option>其他</option>
							</select>
						</div>

					</div>
					<div class="control-group mydiv">
						<label class="control-label ">作者介绍：</label>
						<div class="controls">
							<div class="textarea">
								<textarea class="" name="authorsIntroduce"
									style="margin: 0px; height: 80px; width: 800px;">${bookdetail.authorsIntroduce }</textarea>
							</div>
						</div>
					</div>

					<div class="control-group mydiv">
						<label class="control-label">图书简介：</label>
						<div class="controls">
							<div class="textarea">
								<textarea class="" name="contentIntroduce"
									style="margin: 0px; height: 80px; width: 800px;">${bookdetail.contentIntroduce }</textarea>
							</div>
						</div>
					</div>
					<div class="control-group mydiv">
						<label class="control-label">目录：</label>
						<div class="controls">
							<div class="textarea">
								<textarea class="" name="directory"
									style="margin: 0px; width: 800px; height: 80px;">${bookdetail.directory }</textarea>
							</div>
						</div>
					</div>
					<div class="control-group mydiv" >
						<label class="control-label">前言：</label>
						<div class="controls">
							<div class="textarea">
								<textarea class="" name="preface"
									style="margin: 0px; width: 800px; height: 80px;">${bookdetail.preface }</textarea>
							</div>
						</div>
					</div>
				<div class="control-group mydiv">
					<label class="control-label">备注：</label>
					<div class="controls">
						<textarea id="summary" name="summary" 
						style="margin: 0px; width: 800px; height: 80px;">${book.summary }</textarea>
					</div>
				</div>
				<div class="control-group mydiv">
					<div class="controls  right_b">
						<input type="submit" value="保存" class="btn btn-success btn-large"/>
					</div>
				</div>
			</form>
	     </div>
    </div>
<jsp:include page="${basePath}/res-jsp/footer01.jsp"/>
<script type="text/javascript" src="res/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="res/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="res/js/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="res/js/validation/additional-methods.js"></script>
<script type="text/javascript" src="res/js/validation/my-form-bookmanage-validation.js"></script>
<script type="text/javascript">
    $(".publdata").datetimepicker({format: 'yyyy-mm-dd',
    	autoclose: true, todayBtn: true, minView:2, startDate:1900-01-01,
    	startView:4,language:'zh-CN'});
</script>    
</body>
</html>

