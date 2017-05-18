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
<title>添加图书-图书上架</title>
<link href="res/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="res/mycss/top.css" rel="stylesheet">
<jsp:include page="${basePath}/res-jsp/web_ico.jsp" />
</head>
<body>
 	<jsp:include page="top.jsp"/>
 	<div class="row">
		 <div class="myspan">
		    <form action="uploadbookimage" method="post" enctype="multipart/form-data" class="form-horizontal" id="mybookform">
				<div id="legend" class="">
					<legend>添加图书基本信息</legend>
				</div>
				<div class="control-group">
					<label class="control-label">图书编号：</label>
					<div class="controls">
						<input type="text" name="bookid" id="bookid"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">图书名称：</label>
					<div class="controls">
						<input type="text" name="bookname"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">售价：</label>
					<div class="controls">
						<input type="text" name="unitprice"
						onkeyup="value=value.replace(/\.\d{2,}$/,value.substr(value.indexOf('.'),3))"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">作者：</label>
					<div class="controls">
						<input type="text" name="author"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">出版社：</label>
					<div class="controls">
						<input type="text" name="publisher" data-provide="typeahead" data-items="5" autocomplete="off" id="publisher"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">图书类别：</label>
					<div class="controls">
						<select name="classid">
							<option value="0">请选择</option>
							<option value="A">马列主义、毛泽东思想、邓小平理论</option>
							<option value="B">哲学、宗教</option>
							<option value="C">社会科学总论</option>
							<option value="D">政治、法律</option>
							<option value="E">军事</option>
							<option value="F">经济</option>
							<option value="G">文化、科学、教育、体育</option>
							<option value="H">语言文字</option>
							<option value="I">文学</option>
							<option value="J">艺术</option>
							<option value="K">历史、地理</option>
							<option value="N">自然科学总论</option>
							<option value="O">数理科学、化学</option>
							<option value="P">天文学、地球科学</option>
							<option value="Q">生物科学</option>
							<option value="R">医药、卫生</option>
							<option value="S">农业科学</option>
							<option value="T">工业技术</option>
							<option value="U">交通运输</option>
							<option value="V">航空/航天</option>
							<option value="X">环境科学、安全科学</option>
							<option value="Z">综合性图书</option>
						</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">简介</label>
					<div class="controls">
						<div class="textarea">
							<textarea name="summary" class="clear-blank"
								style="margin: 0px; height: 80px; width: 208px;"> </textarea>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">上传图书封面：</label>
					<div class="controls">
						<div class="box">
						    <input type="text" name="copyFile"  class="textbox" />
						        <a href="javascript:void(0);"  class="btn">浏览</a>
						    <input type="file" class="uploadFile" name="upload" onchange="getFile(this,'copyFile')" id="upload"
						    accept=".jpg,.png,.gif"/>
						</div>
					</div>
				</div>
				<div>
					<div class="controls  right_b">
						<input type="submit" value="保存" class="btn btn-success btn-large"/>
					</div>
				</div>
			</form>
		 </div>
    </div>
<jsp:include page="${basePath}/res-jsp/footer01.jsp"/>
<script type="text/javascript" src="res/js/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="res/js/validation/additional-methods.js"></script>
<script type="text/javascript" src="res/js/validation/my-form-bookmanage-validation.js"></script>
<jsp:include page="${basePath}/res-jsp/messagebox.jsp"/>
<script type="text/javascript">
/* 文件上传 */
	function getFile(obj,inputName){
		var file_name = $(obj).val();  
		$("input[name='"+inputName+"']").val(file_name);
	}
/* 出版社输入提示 */
var subjects = ['人民教育出版社', '人民文学出版社', '译林出版社', '中华书局', '生活·读书·新知三联书店', 
'科学出版社', '清华大学出版社', '电子工业出版社', '机械工业出版社', '化学工业出版社', '建筑工业出版社', '人民邮电出版社',
'中国电力出版社', '北京科学技术出版社', '中国金融出版社', '中国财经出版社', '中信出版社', '法律出版社', '中国法制出版社', 
'人民法院出版社', '高等教育出版社', '中国青年出版社', '武汉大学出版社', '东方出版社', '新星出版社', '复旦大学出版社',
'国防工业出版社', '外语教学与研究出版社', '上海财经大学出版社', '长江文艺出版社','地震出版社']; 
$('#publisher').typeahead({source: subjects});
</script>
</body>
</html>
