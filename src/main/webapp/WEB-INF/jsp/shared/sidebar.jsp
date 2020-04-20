<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <div class="layui-side-scroll">
          <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
          <ul class="layui-nav layui-nav-tree"  lay-filter="test">
            <li class="layui-nav-item layui-nav-itemed">
              <a class="" href="javascript:;">组织管理功能</a>
              <dl class="layui-nav-child">
                <dd><a href="user-list.html">员工检索</a></dd>
				<dd><a href="userEdit.html">添加员工</a></dd>
				<dd><a href="departmentEdit.html">添加部门</a></dd>
				<dd><a href="department-list.html">部门列表</a></dd>
              </dl>
            </li>
            <li class="layui-nav-item">
              <a href="javascript:;">公告管理</a>
              <dl class="layui-nav-child">
                <dd><a href="noticeApprove.html">公告审批</a></dd>
                <dd><a href="noticeApply.html">公告申请</a></dd>
                
              </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">文件夹</a>
                <dl class="layui-nav-child">
                  <dd><a href="">回收站</a></dd>
                  <dd><a href="folder-files">操作文件夹</a></dd>
                </dl>
              </li>
              <li class="layui-nav-item">
                <a href="javascript:;">权限角色功能</a>
                <dl class="layui-nav-child">
                  <dd><a href="">******</a></dd>
                  <dd><a href="">******</a></dd>
                  <dd><a href="">******</a></dd>
                </dl>
              </li>
              <li class="layui-nav-item">
                <a href="javascript:;">日程管理</a>
                <dl class="layui-nav-child">
                  <dd><a href="date-endit">日程表</a></dd>
                  <dd><a href="date">添加日程</a></dd>
                  <dd><a href="">******</a></dd>
                </dl>
              </li>
              <li class="layui-nav-item">
                <a href="javascript:;">邮件功能</a>
                <dl class="layui-nav-child">
                  <dd><a href="email-write">写邮件</a></dd>
                  <dd><a href="email-putList?addresser=${loginUser.username}&stateId=3">已发邮件</a></dd>
                  <dd><a href="email-putList?addresser=${loginUser.username}&stateId=1">草稿箱</a></dd>
                  <dd><a href="email-putList?addressee=${loginUser.username}&stateId=0">收件箱</a></dd>
                
                </dl>
              </li>
          </ul>
        </div>