<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="accordion" id="accordion5">
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#collapseOne">
                    产品特色
      </a>
    </div>
    <div id="collapseOne" class="accordion-body collapse in">
      <div class="accordion-inner">
        <img src="res/images/bookdetailimage/${ bookdetail.bigImage }" alt="">
      </div>
    </div>
  </div>
<div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#collapseTwo">
       	 作者介绍
      </a>
    </div>
    <div id="collapseTwo" class="accordion-body collapse">
      <div class="accordion-inner">
        <pre>${ bookdetail.authorsIntroduce }</pre>
      </div>
    </div>
  </div>
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#collapseThree">
       	 内容简介
      </a>
    </div>
    <div id="collapseThree" class="accordion-body collapse">
      <div class="accordion-inner">
        <pre>${ bookdetail.contentIntroduce }</pre>
      </div>
    </div>
  </div>
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#collapseFour">
       	 目录
      </a>
    </div>
    <div id="collapseFour" class="accordion-body collapse">
      <div class="accordion-inner">
        <pre>${ bookdetail.directory }</pre>
      </div>
    </div>
  </div>
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion5" href="#collapseFive">
       	 前言
      </a>
    </div>
    <div id="collapseFive" class="accordion-body collapse">
      <div class="accordion-inner">
        <pre>抱歉，暂无前言介绍<%-- ${ bookdetail.preface } --%></pre>
      </div>
    </div>
  </div>
</div>