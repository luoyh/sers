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
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/static/lay/css/layui.css">
<link rel="stylesheet" href="${root}/static/bootstrap/css/bootstrap.min.css">
<script src="${root}/static/lib/jquery.min.js"></script>
<script src="${root}/static/lay/layui.js"></script>
<script src="${root}/static/lib/vue.min.js"></script>
<script src="${root}/static/bootstrap/js/bootstrap.min.js"></script>
<style>
.header{height: 50px; border-bottom: 1px solid #404553;  background-color: #393D49; color: #fff;}
.logo{position: absolute; left: 0; top: 18px;font-size:1.3em;color:#fff;}
.logo img{width: 82px; height: 31px;}

.header .layui-nav{position: absolute; right: 0; top: 0; padding: 0; background: none;}
.header .layui-nav .layui-nav-item{margin: 0 20px; line-height: 51px;}

.layui-bg-black{top:50px!important;}
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
        <div class="layui-main" style="" id="subject">
          <div>
            <button v-on:click="add" class="layui-btn">增加</button>
          </div>
          <table class="layui-table">
        <colgroup>
          <col width="150">
          <col width="200">
          <col>
          <col>
        </colgroup>
        <thead>
          <tr>
            <th>科目编号</th>
            <th>科目名称</th>
            <th>创建时间</th>
            <th>操作</th>
          </tr> 
        </thead>
        <tbody>
          <tr v-for="s in subjects">
            <td v-text="s.id"></td>
            <td v-text="s.name"></td>
            <td v-text="s.created"></td>
            <td>
              <button v-on:click="hello(s.name)" class="layui-btn layui-btn-small layui-btn-danger">删除</button>
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
  layui.use(['element','layer'], function() {
    var 
      layer = layui.layer;
  });
</script>
</html>