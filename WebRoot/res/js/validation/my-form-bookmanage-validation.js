/*
*	功能：管理图书-表单验证
*	作者：张杭
*	日期：2016年04月20日
*/

$().ready(function() {
  $("#mybookform").validate({
    rules : {//图书编号
		bookid : {
			required : true,
			bookid : true,
			remote: {
                url: "ajaxbook",
                type: "post",
                dataType: "json",
                data: {
                	bookid: function () {
                        return $("#bookid").val(); //取要验证的bookid
                    }
                },
                dataFilter: function (data) {  //判断控制器返回的内容
                    if (data == "true") {
                        return false;
                    }
                    else {
                        return true;
                    }
                }
            }
		},
		bookidA : {
			required : true,
			bookid : true,
			remote: {
                url: "ajaxbook",
                type: "post",
                dataType: "json",
                data: {
                	bookid: function () {
                        return $("#bookidA").val(); //取要验证的bookid
                    }
                },
                dataFilter: function (data) {  //判断控制器返回的内容
                    if (data == "true") {
                        return false;
                    }
                    if (data == "false"){
                        return true;
                    }
                }
            }
		},
		ebookid : {
			required : true,
			bookid : true,
			remote: {
                url: "ajaxbook",
                type: "post",
                dataType: "json",
                data: {
                	bookid: function () {
                        return $("#ebookid").val(); //取要验证的ebookid
                    }
                },
                dataFilter: function (data) {  //判断控制器返回的内容
                    if (data == "true") {
                        return false;
                    }
                    else {
                        return true;
                    }
                }
            }
		},
		bookname : {
			required : true,
			myblank : true,
			maxlength : 30,
		},
		unitprice : {
			required : true,
			number:true,
			min : 0,
		},
		author : {
			required : true,
			myblank : true,
			maxlength : 25,
		},
		publisher : {
			myblank : true,
			required : true,
			maxlength : 20,
		},
		classid : {
			bookclass : true,
		},
		upload : {
			required : true,
			accept: "gif|png|jpeg",
			maxlength :100,
		},//页数
		numpages : {
			required : true,
			max : 999999999,
			min : 1,
			digits:true
		},
		publdata : {
			required : true,
		},
		bigImage : {
			required : true,
			accept: "gif|png|jpeg|bmp",
			maxlength :100,
		},
		ebooktxt : {
			accept:"zip|",
			maxlength : 100,
		},
		ebookimage : {
			required : true,
			accept: "gif|png|jpeg",
			maxlength :100,
		},
		link : {
			maxlength :100,
		},
		stockid : {
			required : true,
			digits:true,
			min:0,
			rangelength:[5,20]
		},
		stockdate :{
			required : true,
		},
		stockquantity :{
			required : true,
			digits:true,
			min:0,
			max:99999999,
		},
		stockprice :{
			required : true,
			number:true,
			min:0,
			max:999999999,
		}
    },
	messages : {
		bookid : {
			required : "请输入图书编号",
			remote: "此图书已经添加，可修改"
		},
		bookidA : {
			required : "请输入图书编号",
			remote: "此书还未添加基本信息&此书的详细信心已添加"
		},
		ebookid : {
			required : "请输入图书编号",
			remote: "此电子已经添加，可修改"
		},
		bookname : {
			required : "请输入图书名称",
			maxlength : "图书名称过长，请简写"
		},
		unitprice : {
			required : "请输入商品价格",
			number : "请输入数字",
			min : "图书价格不能小于0",
		},
		author : {
			required : "请输入作者名字",
			maxlength : "作者名称过长"
		},
		publisher : {
			required : "请输入出版社名称",
			maxlength : "出版社名称过长",
		},
		upload : {
			required : "请选择图片上传",
			accept : "图片格式只能是.gif/.png/.jpg",
			maxlength : "图片名称过长",
		},
		numpages : {
			required : "请输入图书页数",
			max : "请输入真实的图书页数",
			min : "图书页数不能小于0",
			digits : "必须为整数",
		},
		bigImage : {
			required : "请选择图片上传",
			accept : "图片格式只能是.gif/.png/.jpg",
			maxlength : "图片名称过长",
		},
		ebookimage : {
			required : "请选择图片上传",
			accept : "图片格式只能是.gif/.png/.jpg",
			maxlength : "图片名称过长",
		},
		ebooktxt : {
			maxlength : "电子书名太长",
		},
		publdata : {
			required : "请选择出版时间",
		},
		stockid : {
			required : "请填写订单编号",
			digits: "必须为数字",
			min:"不能为负数",
			rangelength:"长度应在5-20之间",
		},
		stockdate :{
			required : "请选择进货日期",
		},
		stockquantity :{
			required : "请填写进货数量",
			digits:"必须为数字",
			min:"不能为负数",
			max:"请填写真实的数量",
		},
		stockprice :{
			required : "请输入进货价格",
			number:"必须为数字",
			min:"不能为负数",
			max:"请填写真实的进货价格",
		}
	},
  });
});
/*去除输入框中前后空格*/
$(function(){
	$(".clear-blank").blur(function(){
		$(this).val($(".clear-blank").val().replace(/(^\s+)|(\s+$)/g, ""));
	});
});