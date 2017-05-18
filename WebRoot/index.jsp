<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<base href="<%=basePath%>">
<title>熊猫书城</title>
<link href="res/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="res/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<link href="res/mycss/home.css"  rel="stylesheet">
<jsp:include page="res-jsp/web_ico.jsp"/>
</head>
<body>
	<jsp:include page="res-jsp/navigation.jsp"/>
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
			<div class="item active">
				<a href="bookinformation?bookid=9787550015432"><img src="res/images/home/slide-07.png" alt=""></a>
			</div>
			<div class="item">
				<a href="bookinformation?bookid=9787535483133"><img src="res/images/home/slide-10.png" alt=""></a>
			</div>
			<div class="item">
				<a href="bookinformation?bookid=9787543096158"><img src="res/images/home/slide-08.png" alt=""></a>
			</div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
	</div>
	<div class="container marketing">
		<div class="row">
			<div class="span4">
				<a href="bookinformation?bookid=9787535732309"> 
					<img class="img-circle" src="res/images/home/20160110140754.png"
						data-src="holder.js" alt="时间简史">
				</a>
				<h2>时间简史</h2>
				<p class="p_text">为了使读者加深理解，《时间简史》（插图版）还增加了240多幅彩色插图，包括卫星图像和照片。</p>
				<p class="p_text">这些都应归功于诸如哈勃空间望远镜和电脑三维和四维实体成像等技术进步之赐。作为一本飨以读者宇宙学的全新理解的经典著作，《时间简史》（插图版）是探索时间和空间核心秘密的引人入胜的故事。</p>
				<p>
					<a class="btn btn-success"
						href="addshoppingcart?bookid=9787535732309&quantity=1">
						<i class="icon-shopping-cart icon-white"></i>加入购物车 &raquo; </a>
				</p>
			</div>
			<div class="span4">
				<a href="bookinformation?bookid=9787111499503"> 
					<img class="img-circle" src="res/images/home/20160110122106.png" 
					data-src="holder.js" alt="互联网+">
				</a>
				<h2>互联网+</h2>
				<p class="p_text">2015年，“互联网+”写入李克强总理的政府工作报告，“互联网+”成为国家经济社会发展的重要战略。</p>
				<p class="p_text">《互联网+：从IT到DT》深度解析了“互联网+”的内涵及其与云计算、大数据、新分工网络的关系。世界正从IT走向DT。IT以自我控制、自我管理为主，DT以服务大众、激发生产力为主，未来属于DT时代。</p>
				<p>
					<a class="btn btn-success"
						href="addshoppingcart?bookid=9787111499503&quantity=1">
						<i class="icon-shopping-cart icon-white"></i>加入购物车 &raquo;</a>
				</p>
			</div>
			<div class="span4">
				<a href="bookinformation?bookid=9787121259586"> 
				<img class="img-circle" src="res/images/home/20160110122149.png"
					data-src="holder.js" alt="疯狂Android讲义"> </a>
				<h2>疯狂Android讲义</h2>
				<p class="p_text">移动互联网是当今世界发展快、市场潜力大、前景诱人的一项业务，而Android则是移动互联网上市场占有率很高的平台。</p>
				<p class="p_text">本书并不局限于介绍Android编程的各种理论知识，而是从“项目驱动”的角度来讲授理论，全书一共包括近百个实例</p>
				<p>
					<a class="btn btn-success"
						href="addshoppingcart?bookid=9787121259586&quantity=1">
						<i class="icon-shopping-cart icon-white"></i>加入购物车&raquo;</a>
				</p>
			</div>
		</div>
		
		<hr class="featurette-divider">
		<div class="featurette">
			<img class="featurette-image pull-right"
				src="res/images/home/12586342891675.png">
			<h2 class="featurette-heading">
				新闻人白岩松： <span class="muted">言语中的心灵之路</span>
			</h2>
			<p class="lead">我没开微博，也没用微信；只能确定这本书里的话，是我说的。——白岩松</p>
			<a class="btn btn-large btn-success" href="bookinformation?bookid=9787535481108">了解更多</a>
		</div>
		<hr class="featurette-divider">
		<div class="featurette">
			<img class="featurette-image pull-left"
				src="res/images/home/20160108204259.png">
			<h2 class="featurette-heading">
				人生不怕从头再来 <span class="muted"></span>
			</h2>
			<p class="lead">曾无数次被打倒，但永远不会被打败。没有靠山，自己成为山。失去了天下，再打天下。</p>
			<a class="btn btn-large btn-success" href="bookinformation?bookid=9787535483133">了解更多</a>
		</div>
		<hr class="featurette-divider">
		<div class="featurette">
			<img class="featurette-image pull-right"
				src="res/images/home/09872436854628.png">
			<h2 class="featurette-heading">
				神探夏洛克· <span class="muted">夏洛克重生 </span>
			</h2>
			<p class="lead">两个若有所思的男人，坐在轰隆隆穿过乡间的火车里，思考着深奥玄妙的问题。车上的培根三明治也提不起他们的精神，到底要不要冒险再吃一个呢？</p>
			<a class="btn btn-large btn-success" href="bookinformation?bookid=9787550015371 ">了解更多</a>
		</div>
	</div>
<jsp:include page="res-jsp/footer.jsp"/>
<script type="text/javascript">
	!function($) {
		$(function() {
			$('#myCarousel').carousel();
		});
	}(window.jQuery);
</script>
</body>
</html>
