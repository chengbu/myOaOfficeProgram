<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>登陆界面</title>
    <link rel="stylesheet" href="static/jscss/login.css" type="text/css"/>

</head>
<body>
    <div class="wrapper">
		<h1>欢迎使用OA办公管理系统，请登录！</h1>
        <form id="loginForm" name="loginForm" action="login" method="post">
            <div class="loginBox">
                <div class="loginBoxCenter">
                <label class="error" style="color: #FF0000;">${error}</label>
                    <p><label for="username">用户名：</label></p>
                    <!--autofocus 规定当页面加载时按钮应当自动地获得焦点。 -->
                    <!-- placeholder提供可描述输入字段预期值的提示信息-->
                    <p><input type="text" id="text" name="username" class="loginInput" autofocus="autofocus" required="required" autocomplete="off" placeholder="请输入邮箱/手机号" value="" /></p>
                    <!-- required 规定必需在提交之前填写输入字段-->
                    <p><label for="password">密码：</label></p>
                    <p><input type="password" id="password" name="password" class="loginInput" required="required" placeholder="请输入密码" value="" /></p>
                    <p><a class="forgetLink" href="#">忘记密码?</a></p>
                    <input id="remember" type="checkbox" name="remember" />
                    <label for="remember">记住登录状态</label>
                </div>
                <div class="loginBoxButtons">
					<button class="loginBtn">登录</button>
					<button class="loginBtn" type="reset">重置</button>
                </div>
            </div>
        </form>
    </div>
</body>


</html>