<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
<c:set var="root" value="<%=request.getContextPath()%>"></c:set>

		<ul class="layui-nav layui-nav-tree site-demo-nav">
		  
		  <li class="layui-nav-item layui-nav-itemed">
		    <a class="" href="javascript:;">系统管理<span class="layui-nav-more"></span></a>
		    <dl class="layui-nav-child">
		      <dd>
		        <a href="${root}/member/go"><i class="layui-icon">&#xe613;</i> 用户管理</a>
		      </dd>
		    </dl>
		  </li>
		  
		  <li class="layui-nav-item layui-nav-itemed">
		    <a class="" href="javascript:;">科目管理<span class="layui-nav-more"></span></a>
		    <dl class="layui-nav-child">
		      <dd class="">
		        <a href="${root}/subject/go"><i class="layui-icon">&#xe62d;</i> 科目管理</a>
		      </dd>
		      <dd class="">
		        <a href="${root}/suite/go"><i class="layui-icon">&#xe624;</i> 试卷管理</a>
		      </dd>
		      <dd class="">
		        <a href="${root}/result/go"><i class="layui-icon">&#xe63c;</i> 成绩管理</a>
		      </dd>
		    </dl>

		  </li>
		  
		</ul>
