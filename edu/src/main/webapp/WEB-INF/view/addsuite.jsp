<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<title>试卷管理</title>
<link rel="stylesheet" href="${root}/static/lay/css/layui.css">
<script src="${root}/static/lay/layui.js"></script>
<script src="${root}/static/lib/vue.min.js"></script>
<style>
.header{height: 50px; border-bottom: 1px solid #404553;  background-color: #393D49; color: #fff;}
.logo{position: absolute; left: 0; top: 18px;font-size:1.3em;color:#fff;}
.logo img{width: 82px; height: 31px;}

.header .layui-nav{position: absolute; right: 0; top: 0; padding: 0; background: none;}
.header .layui-nav .layui-nav-item{margin: 0 20px; line-height: 51px;}

.layui-bg-black{top:55px!important;}
.p10{padding: 10px;}
.m10{margin: 10px;}

</style>
</head>
<body>
	<div class="layui-layout layui-layout-admin">
  <div class="layui-header header header-demo">
  <div class="layui-main">
    <a class="logo" href="###">
     	招考重庆
    </a>
    <ul class="layui-nav">
      <li class="layui-nav-item ">
        <a href="###">关于</a>
      </li>
      <li class="layui-nav-item">
        <a href="###">退出</a>
      </li>
      
    <span class="layui-nav-bar" style="left: 44px; top: 65px; width: 0px; opacity: 0;"></span></ul>
  </div>
</div>
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
		<%@include file="menu.jsp"%>
    </div>
  </div>

  <div class="layui-tab layui-tab-brief" lay-filter="demoTitle">
    <div class="layui-body layui-tab-content site-demo site-demo-body">
      <div class="layui-tab-item layui-show">
        <div class="layui-main" style="" id="suite">

			<form class="layui-form" action="">
			  <div class="layui-form-item">
			    <label class="layui-form-label">试卷名称</label>
			    <div class="layui-input-block">
			      <input v-model="title" type="text" name="title" placeholder="试卷名称" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">所属科目</label>
			    <div class="layui-input-block">
			      <select v-model="subject">
			        <option value="0">语文</option>
			        <option value="1">数学</option>
			        <option value="2">英语</option>
			        <option value="3">政治</option>
			        <option value="4">历史</option>
			      </select>
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">验证手机</label>
			    <div class="layui-input-inline">
			      <input type="tel" name="phone" lay-verify="phone" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">验证邮箱</label>
			    <div class="layui-input-inline">
			      <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  
			  <div class="layui-form-item">
			    <div class="layui-inline">
			      <label class="layui-form-label">验证数字</label>
			      <div class="layui-input-inline">
			        <input type="number" name="number" lay-verify="number" autocomplete="off" class="layui-input">
			      </div>
			    </div>
			    <div class="layui-inline">
			      <label class="layui-form-label">验证日期</label>
			      <div class="layui-input-block">
			        <input type="text" name="date" id="date" lay-verify="date" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
			      </div>
			    </div>
			    <div class="layui-inline">
			      <label class="layui-form-label">验证链接</label>
			      <div class="layui-input-block">
			        <input type="tel" name="url" lay-verify="url" autocomplete="off" class="layui-input">
			      </div>
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">验证身份证</label>
			    <div class="layui-input-block">
			      <input type="text" name="identity" lay-verify="identity" placeholder="" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">自定义验证</label>
			    <div class="layui-input-inline">
			      <input type="password" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
			    </div>
			    <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
			  </div>
			  
			  <div class="layui-form-item">
			    <div class="layui-inline">
			      <label class="layui-form-label">范围</label>
			      <div class="layui-input-inline" style="width: 100px;">
			        <input type="text" name="price_min" placeholder="￥" autocomplete="off" class="layui-input">
			      </div>
			      <div class="layui-form-mid">-</div>
			      <div class="layui-input-inline" style="width: 100px;">
			        <input type="text" name="price_max" placeholder="￥" autocomplete="off" class="layui-input">
			      </div>
			    </div>
			  </div>
			  
			  <div class="layui-form-item">
			    <label class="layui-form-label">单行选择框</label>
			    <div class="layui-input-block">
			      <select name="interest" lay-filter="aihao">
			        <option value=""></option>
			        <option value="0">写作</option>
			        <option value="1" selected="">阅读</option>
			        <option value="2">游戏</option>
			        <option value="3">音乐</option>
			        <option value="4">旅行</option>
			      </select>
			    </div>
			  </div>
			  
			  <div class="layui-form-item">
			    <label class="layui-form-label">分组选择框</label>
			    <div class="layui-input-inline">
			      <select name="quiz">
			        <option value="">请选择问题</option>
			        <optgroup label="城市记忆">
			          <option value="你工作的第一个城市">你工作的第一个城市</option>
			        </optgroup>
			        <optgroup label="学生时代">
			          <option value="你的工号">你的工号</option>
			          <option value="你最喜欢的老师">你最喜欢的老师</option>
			        </optgroup>
			      </select>
			    </div>
			  </div>
			  
			  <div class="layui-form-item">
			    <label class="layui-form-label">行内选择框</label>
			    <div class="layui-input-inline">
			      <select name="quiz1">
			        <option value="">请选择省</option>
			        <option value="浙江" selected="">浙江省</option>
			        <option value="你的工号">江西省</option>
			        <option value="你最喜欢的老师">福建省</option>
			      </select>
			    </div>
			    <div class="layui-input-inline">
			      <select name="quiz2">
			        <option value="">请选择市</option>
			        <option value="杭州">杭州</option>
			        <option value="宁波" disabled="">宁波</option>
			        <option value="温州">温州</option>
			        <option value="温州">台州</option>
			        <option value="温州">绍兴</option>
			      </select>
			    </div>
			    <div class="layui-input-inline">
			      <select name="quiz3">
			        <option value="">请选择县/区</option>
			        <option value="西湖区">西湖区</option>
			        <option value="余杭区">余杭区</option>
			        <option value="拱墅区">临安市</option>
			      </select>
			    </div>
			  </div>
			  
			  <div class="layui-form-item">
			    <label class="layui-form-label">复选框</label>
			    <div class="layui-input-block">
			      <input type="checkbox" name="like[write]" title="写作">
			      <input type="checkbox" name="like[read]" title="阅读" checked="">
			      <input type="checkbox" name="like[game]" title="游戏">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">开关-关</label>
			    <div class="layui-input-block">
			      <input type="checkbox" name="close" lay-skin="switch" title="开关">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">开关-开</label>
			    <div class="layui-input-block">
			      <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" title="开关">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">单选框</label>
			    <div class="layui-input-block">
			      <input type="radio" name="sex" value="男" title="男" checked="">
			      <input type="radio" name="sex" value="女" title="女">
			      <input type="radio" name="sex" value="禁" title="禁用" disabled="">
			    </div>
			  </div>
			  <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">普通文本域</label>
			    <div class="layui-input-block">
			      <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
			    </div>
			  </div>
			  <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">编辑器</label>
			    <div class="layui-input-block">
			      <textarea class="layui-textarea layui-hide" name="content" lay-verify="content" id="LAY_demo_editor"></textarea>
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <div class="layui-input-block">
			      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
			      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
			  </div>
			</form>
        </div>
      </div>
      
    </div>
  </div>
</div>

	
</body>
<script>
	layui.use(['element', 'layer', 'jquery', 'form'], function() {
		var 
			layer = layui.layer,
			$ = layui.jquery
			,form = layui.form()
			;
		$(function() { 
			window.vm = new Vue({
				el: '#suite',
				data: {
					title: 'hahahe',
					subject: 1,
					suites: [
						{
							title: '2002年期中模拟考试',
							years: '2002年3月',
							subject: '语文',
							created: '2017-01-02'
						},
						{
							title: '2002年期中模拟考试',
							years: '2002年3月',
							subject: '数学',
							created: '2017-02-02'
						},
						{
							title: '2002年期中模拟考试',
							years: '2002年3月',
							subject: '英语',
							created: '2017-01-03'
						},
						{
							title: '2002年期中模拟考试',
							years: '2002年3月',
							subject: '政治',
							created: '2017-01-01'
						}
					]
				},
				methods: {
					hello: function(subject) {
						layer.msg('hello:' + subject);
					},
					add: function() {
						
					}
				},
				mounted: function() {
					this.$nextTick(function() {
						form.render();
					});
				} 
			});
		});
	});
</script>
</html>