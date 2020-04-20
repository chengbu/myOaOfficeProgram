<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

			<fieldset class="layui-elem-field layui-field-title"
				style="margin-top: 20px;">
				<legend>密码修改</legend>
			</fieldset>

			<form class="layui-form" action="">
				<div class="layui-form-item">

					<div class="layui-inline">
						<label class="layui-form-label">旧密码</label>
						<div class="layui-input-inline">
							<input type="password" name="password" lay-verify="pass"
								placeholder="请输入密码" autocomplete="off" class="layui-input">
						</div>
						<!-- <div class="layui-form-mid layui-word-aux">请填写6到12位密码</div> -->
					</div>
				<div class="layui-form-item">

					<div class="layui-inline">
						<label class="layui-form-label">新密码</label>
						<div class="layui-input-inline">
							<input type="password" name="password" lay-verify="pass"
								placeholder="请输入密码" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
					</div>





					<div class="layui-input-block">
						<button type="submit" class="layui-btn" lay-submit=""
							lay-filter="demo1">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>

