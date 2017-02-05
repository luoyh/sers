<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
<style>
	.layui-nav-child a {
		text-decoration: none;
	}
</style>
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
    
		<ul class="layui-nav layui-nav-tree site-demo-nav">
		  
		  <li class="layui-nav-item layui-nav-itemed">
		    <a class="" href="javascript:;">系统管理<span class="layui-nav-more"></span></a>
		    <dl class="layui-nav-child">
		      <dd id="hash_member">
		        <a href="${root}/boot.member/go#hash_member"><i class="layui-icon">&#xe613;</i> 用户管理</a>
		      </dd>
		    </dl>
		  </li>
		  
		  <li class="layui-nav-item layui-nav-itemed">
		    <a class="" href="javascript:;">科目管理<span class="layui-nav-more"></span></a>
		    <dl class="layui-nav-child">
		      <dd id="hash_subject">
		        <a href="${root}/boot.subject/go#hash_subject"><i class="layui-icon">&#xe62d;</i> 科目管理</a>
		      </dd>
		      <dd id="hash_suite">
		        <a href="${root}/boot.suite/go#hash_suite"><i class="layui-icon">&#xe624;</i> 试卷管理</a>
		      </dd>
		      <dd id="hash_result">
		        <a href="${root}/boot.result/go#hash_result"><i class="layui-icon">&#xe63c;</i> 成绩管理</a>
		      </dd>
		    </dl>

		  </li>
		  
		</ul>

    </div>
  </div>
<script>
	
	$(function() {
		var hash = window.location.hash;
		if (hash != '') {
			$(hash).addClass('layui-this');
		}
	});
</script>
