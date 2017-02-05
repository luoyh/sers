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
.m10l{margin-left: 10px;}
.m10t{margin-top: 10px;}
.m10r{margin-right: 10px;}
.m10b{margin-bottom: 10px;}
</style>
<script>root='${root}';
Date.prototype.format = function (fmt) { 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
</script>
</head>