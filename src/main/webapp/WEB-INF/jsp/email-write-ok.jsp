<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
 <script>               
$(function(){
	setTimeout(function(){
		window.location.href="index"
	},5000);
})
</script>
    		<h3 id="main-title">发送结果</h3>
    		<p>邮箱发送成功！！！！，5秒后自动跳转回首页</p>
    		<p><a href="index">回到首页</a></p>
    		<p><a href="email-write">再来一封</a></p>
    		