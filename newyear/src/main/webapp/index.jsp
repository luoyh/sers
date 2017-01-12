<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false" trimDirectiveWhitespaces="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="<%=request.getContextPath() %>"></c:set>
<c:set var="root" value="${ctx eq \"\" ? \"/\" : ctx }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta http-equiv="pragma" content="no-cache" />
<link href="./static/css/app_style.css" rel="stylesheet" type="text/css" />

<script src="./static/js/jquery.min.js"></script>
<script src="./static/js/jQueryRotate.js"></script>
<script src="./static/js/layer.js"></script>
<title>幸运大转盘</title>
<style>
* {
	margin: 0px;
	padding: 0px;
	list-style: none;
	border: 0px;
	box-sizing: border-box;
}

body {
	font-family: 'SimHei', 'SimSun', Arial, Helvetica, sans-serif;
	color: #8c8b8b;
	line-height: 24px;
	font-size: 62.5%;
}

.cleafix:after {
	content: "";
	display: block;
	height: 0;
	clear: both;
	overflow: hidden;
}

.clearfix {
	zoom: 1;
}

.container {
	max-width: 750px;
	margin: 0 auto;
}

.top {
	background: url('./static/imgs/wheel/bg_01.png');
	position: relative;
}

.top-bg {
	
}

.top-title {
	display: block;
	margin: auto;
}

.top-footer {
	display: block;
}

.wheel {
	background: #D22A09;
	padding: 30px 0;
}

.wheel img {
	display: block;
	margin: auto;
}

.winnings {
	background: #FFEAB0;
	margin: 30px auto;
	width: 70%;
	height: 300px;
	border-radius: 10px;
	overflow: hidden;
}

.text {
	font-size: 42px;
}

.head {
	text-align: center;
	padding-top: 10px;
}

.content ul {
	list-style: none;
	counter-reset: count;
}

.content li {
	font-size: 13px;
	color: #D22A09;
	padding-left: 20px;
}

.content li::before {
	counter-increment: count;
	content: '●';
	color: #D22A09;
	font-size: 10px;
}

.wheel-footer {
	background: url('./static/imgs/wheel/bg_04.png') no-repeat;
	position: relative;
	padding-top: 110px;
	overflow: hidden;
}

.wheels {
	position: relative;
}

.point {
	position: absolute;
	left: 46.6%;
	top: 20%;
	width: 6%;
}
</style>
</head>
<script>
	$(function() {
		$('.point').click(function() {
			$('.lottery-wheels').rotate({
				duration : 10000,
				angle : 0,
				animateTo : 3600 + 152 + Math.random() * (207 - 152),
				easing : $.easing.easeOutSine,
				async : false,
				callback : function(a, b) {
					layer.open({
						  type: 1,
						  title: false,
						  closeBtn: 0,
						  area: '516px',
						  skin: 'layui-layer-nobg', //没有背景色
						  shadeClose: true,
						  content: '<img src="./static/imgs/qrcode.png" alt="" />'
					});
				}
			});
		});

		var prizes = ['10元代金券', '10元代金券', '安卓/iphone数据线', '安卓/iphone数据线', '安卓/iphone数据线', 'iPhone7 plus 64g', '88元现金红包', '299元充电宝', '100M流量' ];
		var p2 = [ 3, 3, 3, 5, 8 ];
		setInterval(function() {
			$('#roller').append(
					'<li>1' + p2[~~(Math.random() * p2.length)] + ''
							+ ~~(Math.random() * 10) + 'xxxx'
							+ (1000 + ~~(Math.random() * 9000)) + '抽中 '
							+ prizes[~~(Math.random() * prizes.length)]
							+ '</li>');
			$('#roller li').eq(0).remove();
		}, 1000);

	});
</script>
<body>
	<input type="hidden" id="member_phone" />
	<div class="container">
		<div class="top">
			<img class="top-title" class="center" src="./static/imgs/top.png" />
		</div>
		<div class="wheel">
			<div class="wheels">
				<img class="lottery-wheels" src="./static/imgs/wheels.png" /> <img class="point" src="./static/imgs/z.png" alt="" />
			</div>
			<div class="winnings">
				<div class="head">
					<span class="text">中奖名单</span>
				</div>
				<div class="content">
					<ul id="roller">
						<li>132xxxx9833抽中 安卓/iphone数据线</li>
						<li>133xxxx0022抽中 iPhone7 plus 64g</li>
						<li>134xxxx7812抽中 88元现金红包</li>
						<li>135xxxx3366抽中 299元充电宝</li>
						<li>136xxxx8439抽中 100M流量</li>
						<li>133xxxx3888抽中 iPhone7 plus 64g</li>
						<li>137xxxx8378抽中 10元代金券</li>
						<li>134xxxx8891抽中 10元代金券</li>
						<li>133xxxx3122抽中 iPhone7 plus 64g</li>
						<li>134xxxx3212抽中 88元现金红包</li>
					</ul>
				</div>
			</div>
			<div class="wheel-footer">
				<div style="background: #FEDC78; font-size: 16px; font-weight: bold; padding-left: 20px; color: #D22A09; line-height: 32px;">
					<p>活动规则：</p>
					<p>1、每个手机号仅限抽奖一次;</p>
					<p>2、为了保证奖品发放无误，请务必预留本人正确的手机号码;</p>
					<p>3、活动中，如有不明白请咨询我们的客服人员为您详细解答;</p>
					<p>4、中奖的客户，请添加客服的微信：aa5204487，领取奖品;</p>
					<p>5、深圳零零狗网络科技有限公司主营计算机网络技术培训;</p>
					<p>6、本活动最终解释权归零零狗公司所有。</p>
				</div>

			</div>
		</div>
	</div>

</body>
</html>
