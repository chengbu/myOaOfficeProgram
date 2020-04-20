<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<fieldset class="layui-elem-field layui-field-title"
	style="margin-top: 20px;">
	<legend>员工检索</legend>
</fieldset>

<form class="layui-form" action="">
	<div class="layui-form-item">
		<label class="layui-form-label">姓名</label>
		<div class="layui-input-inline">
			<input type="text" name="name" lay-verify="title" autocomplete="off"
				placeholder="请输入姓名" class="layui-input">
		</div>

		<div class="layui-inline">
			<label class="layui-form-label">工号</label>
			<div class="layui-input-inline">
				<input type="text" name="phone" lay-verify="title"
					autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">email</label>
			<div class="layui-input-inline">
				<input type="text" name="email" autocomplete="off"
					class="layui-input">
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label">入职时间</label>
			<div class="layui-input-inline" style="width: 100px;">
				<input type="text" name="date_min" id="date"
					placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-form-mid">-</div>
			<div class="layui-input-inline" style="width: 100px;">
				<input type="text" name="date_max" id="date1"
					placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-inline">
			<label class="layui-form-label">年龄</label>
			<div class="layui-input-inline" style="width: 100px;">
				<input type="text" name="price_min" autocomplete="off"
					class="layui-input">
			</div>
			<div class="layui-form-mid">-</div>
			<div class="layui-input-inline" style="width: 100px;">
				<input type="text" name="price_max" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-block" style="width: 100px;">
				<select name="interest" lay-filter="aihao">
					<option value="" selected="">性别选择</option>
					<option value="0">男</option>
					<option value="1">女</option>

				</select>
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
			<label class="layui-form-label">职位</label>
			<div class="layui-input-block" style="width: 100px;">
				<select name="interest" lay-filter="aihao">
					<option value=""></option>
					<option value="0">写作</option>
					<option value="1" selected="">选择职位</option>
					<option value="2">游戏</option>
					<option value="3">音乐</option>
					<option value="4">旅行</option>
				</select>
			</div>
		</div>
		<div class="layui-inline">
			<label class="layui-form-label">备注</label>
			<div class="layui-input-inline">
				<input type="text" name="number" autocomplete="off"
					class="layui-input">
			</div>
		</div>
		<div class="layui-input-block">
			<button type="submit" class="layui-btn" lay-submit=""
				lay-filter="demo1">查询</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</div>
</form>

<div class="layui-inline">
	<table class="layui-table">
		<tr>
			<td>速度发</td>
			<td>速度发货速度解放后</td>
			<td>速度发货速度解放后</td>
			<td>速度发解放后</td>
			<td>速度发货速度解放后</td>
			<td>速度发货速度解放后asdfsadf</td>
		</tr>
	</table>
</div>

    <script>
    //JavaScript代码区域
    
    layui.use('element', function(){
      var element = layui.element;
      
    });
    </script>
     <script type="text/html" id="usernameTpl">
        <a href="/?table-demo-id={{d.id}}" class="layui-table-link" target="_blank">{{ d.username }}</a>
      </script>
      <script type="text/html" id="sexTpl">
        {{#  if(d.sex === '女'){ }}
          <span style="color: #F581B1;">{{ d.sex }}</span>
        {{#  } else { }}
          {{ d.sex }}
        {{#  } }}
      </script>
      
      <script type="text/html" id="barDemo1">
        <a class="layui-btn layui-btn-xs" lay-event="edit">工具性按钮</a>
      </script>
                    
                
      <script src="//res.layui.com/layui/dist/layui.js" charset="utf-8"></script>
      <!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
       <script>
      layui.use('table', function(){
        var table = layui.table;
      });
      </script>  
 <script>
        layui.use(['form', 'layedit', 'laydate'], function(){
          var form = layui.form
          ,layer = layui.layer
          ,layedit = layui.layedit
          ,laydate = layui.laydate;
          
          //日期
          laydate.render({
            elem: '#date'
          });
          laydate.render({
            elem: '#date1'
          });
          
          //创建一个编辑器
          var editIndex = layedit.build('LAY_demo_editor');
          //监听指定开关
          form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
              offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
          });
          
          //监听提交
          form.on('submit(demo1)', function(data){
            layer.alert(JSON.stringify(data.field), {
              title: '最终的提交信息'
            })
            return false;
          });
         
          
          
          //表单取值
          layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
          });
          
        });
        </script>


