<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
                
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px; color: #FF0000;">
  <legend style="color: #12BC00; font-weight:bold;font-size:30px;">${state}</legend>
</fieldset>
<form class="layui-form" action="email-putList">
 <div class="layui-row ">
        <div class="layui-form layui-col-md12 ok-search">
     <input type="text" name="stateId" id="stateId" value="${stateId}" style="display:none">
      <c:if test="${state=='收件箱'}">
     <input type="text" name="addressee" id="addressee" value="${loginUser.username}" style="display:none">
      </c:if>
      <c:if test="${state!='收件箱'}">
     <input type="text" name="addresser" id="addresser" value="${loginUser.username}" style="display:none">
      </c:if>
  <div class="layui-form-item">
      <div class="layui-inline">
    <label class="layui-form-label">邮件名称：</label>
    <div class="layui-input-block">
    <c:if test="${title=='null'}">
      <input type="text" name="title" id="title" lay-verify="title" value="" placeholder="请输入标题" class="layui-input">
       </c:if>
    <c:if test="${title!='null'}">
      <input type="text" name="title" id="title" lay-verify="title" value="${title}" placeholder="请输入标题" class="layui-input">
       </c:if>
    </div>
  </div>
  <div class="layui-inline">
      <label class="layui-form-label">重要性：</label>
    <div class="layui-input-block">
     <c:if test="${importanceInt==0}">
       <input type="radio" name="importanceInt" id="importanceInt" value="0" title="全部" checked="">
       <input type="radio" name="importanceInt" value="1" title="普通">
      <input type="radio" name="importanceInt" value="2" title="重要">
      <input type="radio" name="importanceInt" value="3" title="紧急">
         </c:if>
     <c:if test="${importanceInt==1}">
       <input type="radio" name="importanceInt" value="0" title="全部">
       <input type="radio" name="importanceInt" id="importanceInt" value="1" title="普通" checked="">
      <input type="radio" name="importanceInt" value="2" title="重要">
      <input type="radio" name="importanceInt" value="3" title="紧急">
         </c:if>
     <c:if test="${importanceInt==2}">
       <input type="radio" name="importanceInt" value="0" title="全部">
       <input type="radio" name="importanceInt" value="1" title="普通">
      <input type="radio" name="importanceInt" id="importanceInt" value="2" title="重要" checked="">
      <input type="radio" name="importanceInt" value="3" title="紧急">
         </c:if>
     <c:if test="${importanceInt==3}">
       <input type="radio" name="importanceInt" value="0" title="全部">
       <input type="radio" name="importanceInt" value="1" title="普通">
      <input type="radio" name="importanceInt" value="2" title="重要">
      <input type="radio" name="importanceInt" id="importanceInt" value="3" title="紧急" checked="">
         </c:if>

    </div>
    </div>
  </div>
  
 <div class="layui-form-item">
    <div class="layui-inline">
      <c:if test="${state=='草稿箱'||state=='已发邮件'}">
     
       <label class="layui-form-label">收件人：</label>
    <div class="layui-input-block">
      <select name="addressee" lay-filter="aihao" id="addressee">
        </c:if>
      
          <c:if test="${state=='收件箱'}">
       <label class="layui-form-label">发件人：</label>
    <div class="layui-input-block">
    
      <select name="addresser" lay-filter="aihao" id="addressee">
        </c:if>
      
        <option value="" >全部</option>
         <c:forEach var="u" items="${User}" varStatus="vs">
          <c:if test="${addressee==u.username}">
        <option value="${u.username}" selected="">${u.username}</option>
            </c:if>
          <c:if test="${addressee!=u.username}">
        <option value="${u.username}">${u.username}</option>
            </c:if>
   
           </c:forEach>
      </select>
    </div>
            
  </div>
  </div>
  
  <button class="layui-btn layui-btn-normal" data-type="reload" id="submit" type="submit">
              查询
            </button>
        </div>
    </div>
    
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">检索结果：</label>
    <div class="layui-input-block">
    <!-- lay-data="{width: 892, height:330, url:'api/email-putList', page:true, id:'idTest'}" -->
        <table class="layui-table" id="table1001" lay-data="{width: 892, height:330, url:'api/email-putList', page:true, id:'idTest'}" lay-filter="demo">
          <thead>
            <tr>
        
              <th lay-data="{field:'id', width:80, sort: true}">ID</th>
              <th lay-data="{field:'writeTime', width:130, sort: true}">日期</th>
              <c:if test="${state=='草稿箱'||state=='已发邮件'}">
              <th lay-data="{field:'addressee', width:80}">收件人</th>
              </c:if>
              <c:if test="${state=='收件箱'}">
              <th lay-data="{field:'addresser', width:80}">发件人</th>
              <th lay-data="{field:'stateId', width:100, sort: true}">已读/未读</th>
              </c:if>
              <th lay-data="{field:'title', width:160}">主题</th>
              <th lay-data="{field:'importanceInt', width:90,sort: true}">重要性</th>
              <th lay-data="{fixed: 'right', width:130, align:'center', toolbar: '#barDemo'}"></th>
            </tr>
          </thead>
        </table>
    </div>
  </div>
  <div class="layui-form-item">
    
    <div class="layui-inline">
   
  </div>
  
</div>
</form>
<!-- <script type="text/javascript">
	$(function(){
		$("#submit").click(function(){
			datasTable.ajax.reload();
		})
	})
</script>  href="email-statusList?Id="-->
         <script>
    //JavaScript代码区域
    layui.use('element', function(){
      var element = layui.element;
      
    });
    </script>
    <script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>

</script>
    <script>


layui.use('table', function(){	
  var table = layui.table;
	var stateId = $('#stateId').val();
	var addresser = $('#addresser').val();
	var title = $('#title').val();
	var importanceInt = $('#importanceInt').val();
	var addressee = $('#addressee').val();
  var datasTable=table.reload('idTest', {
	  url: 'api/email-putList'
	  ,where: {
		  stateId: stateId
		  ,addresser: addresser
		  ,title: title
		  ,addressee: addressee
		  ,importanceInt: importanceInt
   
	  } //设定异步数据接口的额外参数

  
	});
     
  //监听工具条
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
    	 window.location='email-statusList?id='+data.id;
    	 /* url: 'email-statusList' */
    	
    		
    	
  /* layer.msg('ID：'+ data.id + ' 的查看操作');   */
  
    }
  });
 $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';

});
}); 	
</script>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
 
  
  //表单取值
  layui.$('#LAY-component-form-getval').on('click', function(){
    var data = form.val('example');
    alert(JSON.stringify(data));
  });
  
});

	

</script>

