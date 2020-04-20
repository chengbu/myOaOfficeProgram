<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <div class="layui-logo">oa办公管理系统</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item"><a href="index.html">控制台</a></li>
          <li class="layui-nav-item"><a href="">商品管理</a></li>
          <li class="layui-nav-item"><a href="">用户</a></li>
          <li class="layui-nav-item">
            <a href="javascript:;">其它系统</a>
            <dl class="layui-nav-child">
              <dd><a href="">邮件管理</a></dd>
              <dd><a href="">消息管理</a></dd>
              <dd><a href="">授权管理</a></dd>
            </dl>
          </li>
        </ul>
         <ul class="layui-nav layui-layout-right">
          <li class="layui-nav-item">
            <a href="javascript:;">
             <img src="static/img/p1.jpg" class="layui-nav-img">
            ${loginUser==null?"未登录":loginUser.username}
            
            </a>
            <dl class="layui-nav-child">
             ${loginUser==null?
             " <dd><a href='login'>登录</a></dd>
              <dd><a href='register'>注册</a></dd> "
              : 
              "<dd><a href=''>基本资料</a></dd>
              <dd><a href=''>安全设置</a></dd>"}
         
            </dl>
          </li>
          <li class="layui-nav-item"><a href="login">注销</a></li>
        </ul>

