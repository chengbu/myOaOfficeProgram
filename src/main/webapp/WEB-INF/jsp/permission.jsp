<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
 
<form class="layui-form" action="">
  <br/>
  <div class="layui-form-item">
      <div class="layui-inline">
    <label class="layui-form-label" style="width: 100px; font-size:15px;">角色名：</label>
    <div class="layui-input-block">
     
      <input type="text" name="name" lay-verify="title" autocomplete="off" placeholder="请输入角色名" class="layui-input">
    </div>
  </div>
</div>
<div class="layui-form-item">
  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>邮件功能</legend>
  </fieldset>
  <div class="layui-form-item" pane="">
      <div class="layui-input-block">
        <input type="checkbox" name="like1[write]" title="发邮件">
        <input type="checkbox" name="like1[read]" title="收件箱">
        <input type="checkbox" name="like1[write]" title="已发邮件">
          <input type="checkbox" name="like1[read]" title="草稿箱">
      </div>
      <div class="layui-input-block">
          <input type="checkbox" name="like1[write]" title="垃圾箱">
        <input type="checkbox" name="like1[read]" title="发邮件后台">
        
        <input type="checkbox" name="like[write]" title="阅读邮件推送">
        </div>
       
    </div>
    
</div>
<div class="layui-form-item">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
      <legend>组织管理功能</legend>
    </fieldset>
    <div class="layui-form-item" pane="">
        <div class="layui-input-block">
            <input type="checkbox" name="like[write]" title="添加员工">
            <input type="checkbox" name="like[read]" title="保存员工">
            <input type="checkbox" name="like[game]" title="员工检索">
            <input type="checkbox" name="like[write]" title="更新员工信息">
            <input type="checkbox" name="like[read]" title="员工详细信息">
            <input type="checkbox" name="like[game]" title="部门列表">

        </div>
        <div class="layui-input-block">
            <input type="checkbox" name="like1[write]" title="添加部门">
            <input type="checkbox" name="like1[read]" title="保存部门">
            <input type="checkbox" name="like1[write]" title="更新部门">
            <input type="checkbox" name="like1[read]" title="删除部门">
            <input type="checkbox" name="like[write]" title="删除员工">
          </div>
         
      </div>
      
  </div>
  <div class="layui-form-item">
      <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
        <legend>权限角色功能</legend>
      </fieldset>
      <div class="layui-form-item" pane="">
          <div class="layui-input-block">
              <input type="checkbox" name="like1[write]" title="添加角色">
              <input type="checkbox" name="like1[read]" title="编辑角色">
              <input type="checkbox" name="like1[write]" title="更新角色">
              
            </div>
            <div class="layui-input-block">
                <input type="checkbox" name="like1[write]" title="保存角色">
              <input type="checkbox" name="like1[read]" title="删除角色">
            
              </div>
             
          </div>
           
        </div>
        
    
    <div class="layui-form-item">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
          <legend>文件夹</legend>
        </fieldset>
        <div class="layui-form-item" pane="">
            <div class="layui-input-block">
                <input type="checkbox" name="like1[write]" title="操作文件夹">
                <input type="checkbox" name="like1[read]" title="新建文件夹">
                <input type="checkbox" name="like1[write]" title="回收文件夹">
                  <input type="checkbox" name="like1[read]" title="回收站">
                  <input type="checkbox" name="like1[write]" title="删除文件">
              </div>
              <div class="layui-input-block">
                  <input type="checkbox" name="like1[write]" title="恢复文件">
                  <input type="checkbox" name="like1[read]" title="粘贴文件">
                  <input type="checkbox" name="like1[write]" title="文件上传">
                    <input type="checkbox" name="like1[read]" title="文件下载">
  
                </div>
               
            </div>
             
          </div>
          
     
  <div class="layui-input-block">
        <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
      </div>
    
</form>
</div>

      
      <div class="layui-footer">
        <!-- 底部固定区域 -->
       
      </div>
    </div>

    <script>
    //JavaScript代码区域
    layui.use('element', function(){
      var element = layui.element;
      
    });
    
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
 
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
   
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  
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
    </body>
    </html>