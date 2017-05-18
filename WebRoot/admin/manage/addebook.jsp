<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>添加电子书-图书上架</title>
<link href="res/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="res/mycss/top.css" rel="stylesheet">
<jsp:include page="${basePath}/res-jsp/web_ico.jsp" />
</head>
<body>
<jsp:include page="top.jsp"/>
	<div class="row">
		 <div class="myspan">
			<form class="form-horizontal" action="addebook" method="post" enctype="multipart/form-data" id="mybookform">
				<fieldset>
					<div id="legend" class="">
						<legend class="">添加电子书</legend>
					</div>
					<div class="control-group">
						<label class="control-label">电子书名：</label>
						<div class="controls">
							<input type="text" name="bookname"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">作者：</label>
						<div class="controls">
							<input type="text" name="author"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">单价：</label>
						<div class="controls">
							<input type="text" name="unitprice"
							onkeyup="value=value.replace(/\.\d{2,}$/,value.substr(value.indexOf('.'),3))"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">电子书类别：</label>
						<div class="controls">
							<select name="classid"> 
								<option value="1"></option>
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
						<label class="control-label">简介：</label>
						<div class="controls">
							<div class="textarea">
								<textarea name="summary" class="clear-blank"
									style="margin: 0px; height: 80px; width: 210px;"></textarea>
							</div>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label">电子书上传：</label>
						<div class="controls">
							<input class="input-file" type="file" name="ebooktxt"
							accept=".zip,.rar"/>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label">图片上传：</label>
						<div class="controls">
							<input class="input-file" type="file" name="ebookimage" id="ebookimage"
							accept=".jpg,.png,.gif"/>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label">添加外部链接：</label>
						<div class="controls">
							<input type="text" name="link" id="link"/>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label"></label>
						<div class="controls right_b">
							<button class="btn btn-success btn-large">提交</button>
						</div>
					</div>

				</fieldset>
			</form>
		</div>
	</div>
<jsp:include page="${basePath}/res-jsp/footer01.jsp"/>
<script type="text/javascript" src="res/js/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="res/js/validation/additional-methods.js"></script>
<script type="text/javascript" src="res/js/validation/my-form-bookmanage-validation.js"></script>
<jsp:include page="${basePath}/res-jsp/messagebox.jsp"/>
</body>
</html>
