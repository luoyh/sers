<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8" />
	<title>test</title>
</head>
<body>
	hello ${obj.member }  on ${obj.timestamp }
	
	<%=request.getAttribute("obj") %>
</body>
</html>