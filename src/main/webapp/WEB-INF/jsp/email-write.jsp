<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
                
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>写邮件</legend>
</fieldset>
 
<form class="layui-form" action="email-save">
 <input type="text" name="addresser" value="${loginUser.username}" style="display:none">
  <div class="layui-form-item">
      <div class="layui-inline">
    <label class="layui-form-label">标题：</label>
    <div class="layui-input-block">
      <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
    </div>
  </div>
  </div>
  <div class="layui-form-item">
      <label class="layui-form-label">附件：</label>
<div class="layui-upload">
  <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
  <button type="button" class="layui-btn" id="test9">开始上传</button>
</div>
</div>
 <div class="layui-form-item">
    <div class="layui-inline">
    <label class="layui-form-label">收件人：</label>
    <div class="layui-input-block">
      <select name="addressee" lay-filter="aihao">
        <option value="" >全部</option>
         <c:forEach var="u" items="${User}" varStatus="vs">
        <option value="${u.username}">${u.username}</option>
           </c:forEach>
      </select>
    </div>
  </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">内容：</label>
    <div class="layui-input-block">
        <textarea id="demo" name="description" style="display: none;"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">重要性：</label>
    <div class="layui-input-block">
      <input type="radio" name="importanceInt" value="1" title="普通" checked="">
      <input type="radio" name="importanceInt" value="2" title="重要">
      <input type="radio" name="importanceInt" value="3" title="紧急">
    </div>
  </div>
  <div class="layui-form-item">
      <div class="layui-inline">
    <button class="layui-btn" lay-submit="" lay-filter="demo2" name="stateId" value="1">存放草稿箱</button>
  </div>
    <div class="layui-inline">
    <button class="layui-btn" lay-submit="" lay-filter="demo2" name="stateId" value="0">返回（清除退出，不会存草稿箱）</button>
  </div>
  <div class="layui-inline">
    <button class="layui-btn" lay-submit="" lay-filter="demo2" name="stateId" value="2">发送</button>
  </div>
</div>
</form>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
      var element = layui.element;
      
    });
    </script>
    <script>
      layui.use('upload', function(){
        var $ = layui.jquery
        ,upload = layui.upload;
        //选完文件后不自动上传
  upload.render({
    elem: '#test8'
    ,url: '/upload/'
    ,auto: false
    //,multiple: true
    ,bindAction: '#test9'
    ,done: function(res){
      console.log(res)
    }
  });
        
      });
      </script>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
 
 
  //表单赋值
  layui.$('#LAY-component-form-setval').on('click', function(){
    form.val('example', {
      "username": "贤心" // "name": "value"
      ,"password": "123456"
      ,"interest": 1
      ,"like[write]": true //复选框选中状态
      ,"close": true //开关状态
      ,"sex": "女"
      ,"desc": "我爱 layui"
    });
  });
  
  //表单取值
  layui.$('#LAY-component-form-getval').on('click', function(){
    var data = form.val('example');
    alert(JSON.stringify(data));
  });
  
});
</script>

<script>
    layui.use('layedit', function(){
      var layedit = layui.layedit;
      layedit.build('demo'); //建立编辑器
    });
    </script>