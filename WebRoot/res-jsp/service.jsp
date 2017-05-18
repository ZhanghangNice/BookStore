<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<link href="res/mycss/service.css" rel="stylesheet">
<div class="service">
	<ul class="clearfix">
		<li class="service-item">
			<span>
		    	<img src="res/images/webico/7.png"/>
			</span>
			<p class="service-desc">
                <span class="service-desc-bold">7天</span>
                <span class="service-desc-normal">无理由退货</span>
            </p>
		</li>
		<li class="service-split-line">
            <span></span>
        </li>
		<li class="service-item">
			<span>
			    <img src="res/images/webico/15.png"/>
			</span>
			<p class="service-desc">
                <span class="service-desc-bold">15天</span>
                <span class="service-desc-normal">换货保障</span>
            </p>
		</li>
		<li class="service-split-line">
            <span></span>
        </li>
		<li class="service-item">
			<span>
			    <img src="res/images/webico/1.png"/>
			</span>
			<p class="service-desc">
                <span class="service-desc-bold">终身</span>
                <span class="service-desc-normal">免费服务</span>
            </p>
		</li>
		<li class="service-split-line">
            <span></span>
        </li>
		<li class="service-item">
			<span>
			    <img src="res/images/webico/baoyou.png"/>
		    </span>
		    <p class="service-desc">
                <span class="service-desc-bold">全场</span>
                <span class="service-desc-normal">满100包邮</span>
            </p>
		</li>
    </ul>
</div>