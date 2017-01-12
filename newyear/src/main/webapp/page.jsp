<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" trimDirectiveWhitespaces="true"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="<%=request.getContextPath() %>"></c:set>
<c:set var="root" value="${ctx eq \"\" ? \"/\" : ctx }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>幸运大转盘</title>

<link href="./static/css/bootstrap.min.css" rel="stylesheet">
<script src="./static/js/jquery.min.js"></script>
<script src="./static/layer/layer.js"></script>
<script src="./static/page/page.js"></script>
<style>
	
	body {
		background: #e0e0e0;
	}

	table {
		margin: auto;
		width: 300px;
	}
	td {
		text-align: center;
		font-weight: bold;
	}
	div {
		text-align: center;
	}
	th {
	    text-align: center;
    	font-weight: normal;
	}
</style>
</head>

<script>
	$(function() {
		$.extend({
			page: function(dom, callback, total, pageSize, pageNo) {
				if(!dom || typeof dom !== 'string') {
					$.error('the page arguments dom must be string.');
				}
				if(!callback || typeof callback !== 'function') {
					$.error('the page arguments callback must be function.');
				}
				$(dom).HJPage({
			        pageSize : pageSize,
			        total : total,
			        pageNo: pageNo,
			        onPageClicked: function(obj, pageIndex) {
			        	callback(obj, pageIndex);
			        }
			    });
			}
		});
		var pass = '';
		var load = function(n, s, i, p) {
			$.ajax({
				url : '${root}/api/page',
				dataType : 'json',
				method : 'POST',
				data : {
					token : p || pass,
					pageNo: n,
					pageSize: s
				},
				success : function(r) {
					if(r.code == 300) {
						layer.msg('密码错误');
					} else {
						if(p) {
							pass = p;
							$('#down').attr('href', '${root}/api/export?token=' + pass);
						}
						var htm = '';
						$.each(r.data.list||[], function(ii, e) {
							htm += '<tr>\
									<td>'+e.id+'</td>\
									<td>'+e.phone+'</td>\
									</tr>';
						});
						$('#datas').html(htm);
						
						$.page('.pagination', function($po, $pi) {
							load($pi, r.data.pager.pageSize);
						}, r.data.pager.recordCount, r.data.pager.pageSize, r.data.pager.pageNumber);
						
						if(i) {
							layer.close(i);
						}
					}
				}
			});
		};
		
		layer.prompt({
			title: '请输入密码',
			formType: 1
		}, function(pass, i) {
			load(1, 100, i, pass);
		});
		
	});
</script>
<body>
	<div>
		<a id="down" class="btn btn-success" target="_blank">下载</a>
	</div>
	<div><ul class="pagination"></ul></div>
	<table border="1">
		<thead>
			<tr>
				<th>编号</th>
				<th>电话号码</th>
			</tr>
		</thead>

		<tbody id="datas">

		</tbody>

	</table>

</body>
</html>
