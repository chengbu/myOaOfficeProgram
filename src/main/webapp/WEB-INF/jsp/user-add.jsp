<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<fieldset class="layui-elem-field layui-field-title"
	style="margin-top: 20px;">
	<legend>添加员工</legend>
</fieldset>

<form class="layui-form" action="">
	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-block">
				<input type="text" name="name" lay-verify="title" autocomplete="off"
					placeholder="请输入姓名" class="layui-input">
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label">手机号码</label>
			<div class="layui-input-inline">
				<input type="tel" name="phone" lay-verify="required|phone"
					autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label">身份证</label>
			<div class="layui-input-block">
				<input type="text" name="identity" lay-verify="identity"
					placeholder="" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label">邮箱</label>
			<div class="layui-input-inline">
				<input type="text" name="email" lay-verify="email"
					autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-inline">
			<div class="layui-upload">
				<button type="button" class="layui-btn" id="test1">上传图片</button>
				<div class="layui-upload-list">
					<img class="layui-upload-img" id="demo1"
						style="width: 100px; height: 100px; background-size: auto;">
					<p id="demoText"></p>
				</div>
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label">入职日期</label>
			<div class="layui-input-inline">
				<input type="text" name="date" id="date" lay-verify="date"
					placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label">所在部门</label>
			<div class="layui-input-block" style="width: 100px;">
				<select name="interest" lay-filter="aihao">
					<option value=""></option>
					<option value="0">写作</option>
					<option value="1" selected="">选择部门</option>
					<option value="2">游戏</option>
					<option value="3">音乐</option>
					<option value="4">旅行</option>
				</select>
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label">设置登录密码</label>
			<div class="layui-input-inline">
				<input type="password" name="password" lay-verify="pass"
					placeholder="请输入密码" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux">请填写6到12位密码</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">家庭地址</label>
			<div class="layui-input-inline">
				<select name="quiz1">
					<option value="">请选择省</option>
					<option value="浙江" selected="">浙江省</option>
					<option value="你的工号">江西省</option>
					<option value="你最喜欢的老师">福建省</option>
				</select>
			</div>

			<div class="layui-input-inline">
				<select name="quiz2">
					<option value="">请选择市</option>
					<option value="杭州">杭州</option>
					<option value="宁波" disabled="">宁波</option>
					<option value="温州">温州</option>
					<option value="温州">台州</option>
					<option value="温州">绍兴</option>
				</select>
			</div>
			<div class="layui-input-inline">
				<select name="quiz3">
					<option value="">请选择县/区</option>
					<option value="西湖区">西湖区</option>
					<option value="余杭区">余杭区</option>
					<option value="拱墅区">临安市</option>
				</select>
			</div>
		</div>

		<label class="layui-form-label">单选框</label>
		<div class="layui-input-block">
			<input type="radio" name="sex" value="男" title="男" checked="">
			<input type="radio" name="sex" value="女" title="女">
		</div>

		<div class="layui-form-item" pane="">
			<label class="layui-form-label">使用者权限</label>
			<div class="layui-input-block">
				<input type="checkbox" name="like1[write]" lay-skin="primary"
					title="公告审查"> <input type="checkbox" name="like1[read]"
					lay-skin="primary" title="ddddd"> <input type="checkbox"
					name="like1[write]" lay-skin="primary" title="写作"> <input
					type="checkbox" name="like1[read]" lay-skin="primary" title="阅读">
				<input type="checkbox" name="like1[write]" lay-skin="primary"
					title="写作"> <input type="checkbox" name="like1[read]"
					lay-skin="primary" title="阅读">

			</div>
		</div>
		<label class="layui-form-label">备注</label>
		<div>
			<textarea rows="3" cols="50" name="remark"></textarea>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户状态</label>
			<div class="layui-input-inline">
				<select name="userStatus">
					<option value="">请选择</option>
					<option value="启用" selected="">启用</option>
					<option value="禁用">禁用</option>
				</select>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">是否是部门负责人</label>
			<div class="layui-input-inline">
				<select name="userStatus">
					<option value="">请选择</option>
					<option value="否" selected="">否</option>
					<option value="">是</option>
				</select>
			</div>
		</div>
		<div class="layui-input-block">
			<button type="submit" class="layui-btn" lay-submit=""
				lay-filter="demo1">立即提交</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</div>
</form>

<script>
		layui
				.use(
						'upload',
						function() {
							var $ = layui.jquery, upload = layui.upload;

							//普通图片上传
							var uploadInst = upload
									.render({
										elem : '#test1',
										url : '/upload/',
										before : function(obj) {
											//预读本地文件示例，不支持ie8
											obj
													.preview(function(index,
															file, result) {
														$('#demo1').attr('src',
																result); //图片链接（base64）
													});
										},
										done : function(res) {
											//如果上传失败
											if (res.code > 0) {
												return layer.msg('上传失败');
											}
											//上传成功
										},
										error : function() {
											//演示失败状态，并实现重传
											var demoText = $('#demoText');
											demoText
													.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
											demoText.find('.demo-reload').on(
													'click', function() {
														uploadInst.upload();
													});
										}
									});
						});
	</script>

<script>
		layui
				.use(
						[ 'form', 'layedit', 'laydate' ],
						function() {
							var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;

							//日期
							laydate.render({
								elem : '#date'
							});
							laydate.render({
								elem : '#date1'
							});

							//创建一个编辑器
							var editIndex = layedit.build('LAY_demo_editor');

							//自定义验证规则
							form.verify({
								title : function(value) {
									if (value.length < 5) {
										return '标题至少得5个字符啊';
									}
								},
								pass : [ /^[\S]{6,12}$/, '密码必须6到12位，且不能出现空格' ],
								content : function(value) {
									layedit.sync(editIndex);
								}
							});

							//监听指定开关
							form.on('switch(switchTest)', function(data) {
								layer.msg('开关checked：'
										+ (this.checked ? 'true' : 'false'), {
									offset : '6px'
								});
								layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF',
										data.othis)
							});

							//监听提交
							form.on('submit(demo1)', function(data) {
								layer.alert(JSON.stringify(data.field), {
									title : '最终的提交信息'
								})
								return false;
							});

							//表单赋值
							layui.$('#LAY-component-form-setval').on('click',
									function() {
										form.val('example', {
											"username" : "贤心" // "name": "value"
											,
											"password" : "123456",
											"interest" : 1,
											"like[write]" : true //复选框选中状态
											,
											"close" : true //开关状态
											,
											"sex" : "女",
											"desc" : "我爱 layui"
										});
									});
							//表单取值
							layui.$('#LAY-component-form-getval').on('click',
									function() {
										var data = form.val('example');
										alert(JSON.stringify(data));

									});
						});
	</script>