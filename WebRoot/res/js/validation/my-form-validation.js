/*
*	功能：表单验证
*	作者：张杭
*	日期：2016年04月20日
*/

$().ready(function() {
  $("#myform").validate({
    rules : {//注册用户名
		username : {
			required : true,
			username : true,
			remote: {
                url: "ajaxbook",
                type: "post",
                dataType: "json",
                data: {
                	bookid: function () {
                        return $("#username").val(); //取要验证的username
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
		password : {
			required : true,
			minlength : 6,
			maxlength : 16,
			password : true
		},
		re_password : {
			required : true,
			equalTo : "#password",
		},
		oldpassword : {
			required : true,
			minlength : 6,
			maxlength : 16,
			password : true
		},
		tel : {
			required :true,
			tel : true,
		},
		email : {
			email:true,
			maxlength :45,
		},
		qq : {
			qq : true,
		},
		addr : {
			maxlength : 95,
		},
		receiver:{
			required :true,
			maxlength :20,
			receiver:true,
		},
		contact:{
			required :true,
			tel : true,
		},
		address : {
			required :true,
			maxlength : 95,
		},
		orderremark : {
			maxlength : 200,
		}
    },
	messages : {
		username : {
			required : "请输入用户名",
			remote : "用户名已被注册",
		},
		password : {
			required : "请输入密码",
			minlength : "密码长度不能小于 6",
			maxlength : "您输入的密码太长了",
		},
		re_password : {
			required : "请再次输入密码",
			equalTo : "两次密码输入不一致"
		},
		oldpassword :{
			required : "请输入密码",
			minlength : "密码长度不能小于 6",
			maxlength : "您输入的密码太长了",
		},
		tel : {
			required :"请输入手机号",
		},
		email : {
			email : "请输入正确的邮箱",
			maxlength : "您输入的邮箱太长"
		},
		addr : {
			maxlength : "您输入的地址太长",
		},
		receiver:{
			required :"请输入姓名",
			maxlength :"您的名字太长了",
			receiver:"请输入汉字",
		},
		contact:{
			required :"请输入手机号",
			tel : "请输入正确的手机号",
		},
		address : {
			required :"请输入收货地址",
			maxlength : "您输入的地址太长了",
		},
		orderremark : {
			maxlength : "您输入的内容太多了",
		}
	},
  });
});