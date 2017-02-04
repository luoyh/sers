<%@ page language="java" contentType="text/html; charset=utf-8" isELIgnored="false" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${root }/static/lib/jquery.min.js"></script>
</head>
<body>
	${timestamp }ssxx
</body>
<script>
	$(function() { 
		$('*').css('background', '#' + (~~(Math.random()*0xffffff)|0x800000).toString(16));
		
	});
</script>
</html>