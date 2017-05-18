<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>添加图书详细信息-图书上架</title>
<link href="res/bootstrap/css/bootstrap.min.css" rel="stylesheet"  media="screen">
<link href="res/mycss/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
<link href="res/mycss/addbookdetail.css" rel="stylesheet">
<jsp:include page="${basePath}/res-jsp/web_ico.jsp" />
</head>
<body>
	<jsp:include page="top.jsp"/>
	<div class="row">
		 <div class="myspan">
			<form class="form-horizontal" action="addbookdetail" method="post" enctype="multipart/form-data" id="mybookform">
				<fieldset>
					<div id="legend" class="">
						<legend>添加图书详细信息</legend>
					</div>

					<div class="control-group">
						<label class="control-label">图书编号：</label>
						<div class="controls">
							<input type="text" name="bookidA" id="bookidA">
						</div>
					</div>

					<div class="control-group">
						<label class="control-label">版次：</label>
						<div class="controls">
							<select name="edition">
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
							</select>
						</div>

					</div>
					<div class="control-group">
						<label class="control-label">包装：</label>
						<div class="controls">
							<label class="radio inline">
								<input type="radio" value="平装" name="packaging" checked="checked">平装
							</label>
							<label class="radio inline">
								<input type="radio" value="精装" name="packaging">精装
							</label>
							<label class="radio inline">
								<input type="radio" value="盒装" name="packaging">盒装
							</label>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">开本：</label>
						<div class="controls">
							<label class="radio inline">
								<input type="radio" value="16" name="format" checked="checked">16
							</label>
							<label class="radio inline">
								<input type="radio" value="32" name="format">32
							</label>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">页数：</label>
						<div class="controls">
							<input type="text" name="numpages">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">出版时间：</label>
						<div class="controls">
							<input type="text" name="publdata" readonly class="publdata">
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
									style="margin: 0px; height: 80px; width: 800px;"> </textarea>
							</div>
						</div>
					</div>

					<div class="control-group mydiv">
						<label class="control-label">图书简介：</label>
						<div class="controls">
							<div class="textarea">
								<textarea class="" name="contentIntroduce"
									style="margin: 0px; height: 80px; width: 800px;"> </textarea>
							</div>
						</div>
					</div>
					<div class="control-group mydiv">
						<label class="control-label">目录：</label>
						<div class="controls">
							<div class="textarea">
								<textarea class="" name="directory"
									style="margin: 0px; width: 800px; height: 80px;"> </textarea>
							</div>
						</div>
					</div>
					<div class="control-group mydiv" >
						<label class="control-label">前言：</label>
						<div class="controls">
							<div class="textarea">
								<textarea class="" name="preface"
									style="margin: 0px; width: 800px; height: 80px;"> </textarea>
							</div>
						</div>
					</div>
					<div class="control-group mydiv">
						<label class="control-label ">上传图片：</label>
						<div class="controls">
							<input class="input-file" type="file" name="bigImage" id="bigImage"
							accept=".jpg,.png,.gif"/>
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
<script type="text/javascript" src="res/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="res/js/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
<script type="text/javascript" src="res/js/validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="res/js/validation/additional-methods.js"></script>
<script type="text/javascript" src="res/js/validation/my-form-bookmanage-validation.js"></script>
<jsp:include page="${basePath}/res-jsp/messagebox.jsp"/>
<script type="text/javascript">
    $(".publdata").datetimepicker({format: 'yyyy-mm-dd',
    	autoclose: true, todayBtn: true, minView:2, startDate:1900-01-01,
    	startView:4,language:'zh-CN'});
</script>
</body>
</html>
