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
<script>
	var root = '${root}';	
</script>
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
        	<div>
        		<button v-on:click="add" class="layui-btn">增加</button>
        	</div>
        	<table class="layui-table">
			  <thead>
			    <tr>
			      <th>试卷名称</th>
			      <th>试卷年月</th>
			      <th>所属科目</th>
			      <th>创建时间</th>
			      <th>操作</th>
			    </tr> 
			  </thead>
			  <tbody>
			    <tr v-for="s in suites">
			      <td v-text="s.title"></td>
			      <td v-text="s.years"></td>
			      <td v-text="s.subject"></td>
			      <td v-text="s.created"></td>
			      <td>
			      	<button v-on:click="hello(s.title)" class="layui-btn layui-btn-small layui-btn-danger">删除</button>
			      	<button class="layui-btn layui-btn-small layui-btn-normal">编辑</button>
			      </td>
			    </tr>
			  </tbody>
			</table>
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
			$ = layui.jquery,
			form = layui.form();
		$(function() { 
			var vm = new Vue({
				el: '#suite',
				data: {
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
						window.location.href = root + '/addsuite/go';
					}
				}
			});
		});
	});
</script>
</html>