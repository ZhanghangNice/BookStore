/*!
 * jQuery Validation Plugin v1.14.0
 *
 * http://jqueryvalidation.org/
 *
 * Copyright (c) 2015 Jörn Zaefferer
 * Released under the MIT license
 */
(function( factory ) {
	if ( typeof define === "function" && define.amd ) {
		define( ["jquery", "./jquery.validate"], factory );
	} else {
		factory( jQuery );
	}
}(function( $ ) {

(function() {

	function stripHtml(value) {
		// remove html tags and space chars
		return value.replace(/<.[^<>]*?>/g, " ").replace(/&nbsp;|&#160;/gi, " ")
		// remove punctuation
		.replace(/[.(),;:!?%#$'\"_+=\/\-“”’]*/g, "");
	}

	$.validator.addMethod("maxWords", function(value, element, params) {
		return this.optional(element) || stripHtml(value).match(/\b\w+\b/g).length <= params;
	}, $.validator.format("Please enter {0} words or less."));

	$.validator.addMethod("minWords", function(value, element, params) {
		return this.optional(element) || stripHtml(value).match(/\b\w+\b/g).length >= params;
	}, $.validator.format("Please enter at least {0} words."));

	$.validator.addMethod("rangeWords", function(value, element, params) {
		var valueStripped = stripHtml(value),
			regex = /\b\w+\b/g;
		return this.optional(element) || valueStripped.match(regex).length >= params[0] && valueStripped.match(regex).length <= params[1];
	}, $.validator.format("Please enter between {0} and {1} words."));

}());

// Accept a value from a file input based on a required mimetype
$.validator.addMethod("accept", function(value, element, param) {
	// Split mime on commas in case we have multiple types we can accept
	var typeParam = typeof param === "string" ? param.replace(/\s/g, "").replace(/,/g, "|") : "image/*",
	optionalValue = this.optional(element),
	i, file;

	// Element is optional
	if (optionalValue) {
		return optionalValue;
	}

	if ($(element).attr("type") === "file") {
		// If we are using a wildcard, make it regex friendly
		typeParam = typeParam.replace(/\*/g, ".*");

		// Check if the element has a FileList before checking each file
		if (element.files && element.files.length) {
			for (i = 0; i < element.files.length; i++) {
				file = element.files[i];

				// Grab the mimetype from the loaded file, verify it matches
				if (!file.type.match(new RegExp( "\\.?(" + typeParam + ")$", "i"))) {
					return false;
				}
			}
		}
	}

	// Either return true because we've validated each file, or because the
	// browser does not support element.files and the FileList feature
	return true;
}, $.validator.format("Please enter a value with a valid mimetype."));

//用户名验证
jQuery.validator.addMethod("username",function(value,element){
    var username = /^[a-zA-Z0-9_\u4e00-\u9fa5]{2,16}$/;
    return this.optional(element) || (username.test(value));
},"请输入合法的用户名");

//密码验证
jQuery.validator.addMethod("password",function(value,element){
    var password = /^(?!^\\d+$)(?!^[a-zA-Z]+$)(?!^[\s]).{6,}$/;
    return this.optional(element) || (password.test(value));
},"您输入的密码太简单了");

//手机验证
jQuery.validator.addMethod("tel", function (value, element) {
    var mobile = /^1[3|4|5|7|8]\d{9}$/;
	return this.optional(element) || (mobile.test(value));
}, "请输入格式正确手机号");

//邮箱或手机验证规则
jQuery.validator.addMethod("phone", function (value, element) {
    var mm = /^[a-z0-9._%-]+@([a-z0-9-]+\.)+[a-z]{2,4}$|^1[3|4|5|7|8]\d{9}$/;
	return this.optional(element) || (mm.test(value));
}, "您输入的格式不正确");

//QQ
jQuery.validator.addMethod("qq", function(value, element) {    
	var qq = /^[1-9]\d{4,12}$/;
    return this.optional(element) || (qq.test(value));       
}, "请输入格式正确的QQ号");

//图书编号验证  bookid
jQuery.validator.addMethod("bookid",function(value,element){
    var bookid = /^978(\d{10})$/;
    return this.optional(element) || (bookid.test(value));
},"请输入格式正确的图书编号");

//图书类别
jQuery.validator.addMethod("bookclass",function(value,element){
    var bookcla = /^[A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z|]$/;
    return this.optional(element) || (bookcla.test(value));
},"请选择图书类型");

//前后空格验证
jQuery.validator.addMethod("myblank",function(value,element){
    var myblank = /^[^\s*]{0,1000}[^\s*]$/;
    return this.optional(element) || (myblank.test(value));
},"前后不能有空格");

//汉字验证
jQuery.validator.addMethod("receiver",function(value,element){
    var rename = /^[\u4e00-\u9fa5]*$/;
    return this.optional(element) || (rename.test(value));
},"前后不能有空格");

}));
