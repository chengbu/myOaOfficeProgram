<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>
		<tiles:insertAttribute name="title" ignore="true"/>
	</title>
	<meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/jquery/jquery-3.2.1.js"></script>
  <link rel="stylesheet" href="static/layui/css/layui.css"  media="all">

  <link href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.css" rel="stylesheet">
 
	<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>

	<!-- DataTables插件 -->
	<script src="${pageContext.request.contextPath}/static/datatables/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/static/datatables/dataTables.bootstrap.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/zTree_v3/js/jquery.ztree.core.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/zTree_v3/css/zTreeStyle/zTreeStyle.css" />
	<script src="static/layui/layui.js"></script>
		<!-- jQuery验证 -->
	<script src="${pageContext.request.contextPath}/static/jquery-validate/jquery.validate.js"></script>
	<script>
			layui.use('element', function(){
			  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
			  
			  //监听导航点击
			  element.on('nav(demo)', function(elem){
				//console.log(elem)
				layer.msg(elem.text());
			  });
			});
			</script>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">

		<div class="layui-header">
			<%@ include file="/WEB-INF/jsp/shared/header.jsp"%>
		</div>

		<div class="layui-side layui-bg-black">
			<%@ include file="/WEB-INF/jsp/shared/sidebar.jsp"%>
		</div>

		<div class="layui-body">
			<tiles:insertAttribute name="main" />
		</div>


		<div class="layui-footer">
			<!-- 底部固定区域 -->

		</div>
	</div>
</body>
</html>