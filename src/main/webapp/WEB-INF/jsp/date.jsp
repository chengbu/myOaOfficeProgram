<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<link rel="stylesheet" href="static/jscss/data.css" media="all">
<link href="static/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="static/bootstrap/css/bootstrap.css.map" rel="stylesheet">
<script src="static/js/jquery-1.11.3.js">
	
</script>
<script src="static/js/jquery.validate.js">
	
</script>
<style>
.error{color: red;}
</style>
      <!-- 内容主体区域 --> 
      <!-- action="datesave" method="post" -->  
<div style="padding: 15px;">
 <div style="border: 1px inset green;margin: 20px 20px;" > 
  <div>&nbsp;</div>
    <div class="layui-row">
        <div class="layui-col-xs6">
          <div class="grid-demo grid-demo-bg1">
              <h4 style="color: green;"> &nbsp;&nbsp;&nbsp;
                &nbsp;<span>会议:</span> </h4>
          </div>
        </div>
        <div class="layui-col-xs6">
          <br>
          <div class="grid-demo grid-demo-bg1">
              <label class="control-label" for="inputEmail">员工列表</label>
              <br>
             <form action="date" class="parent" method="GET">
                <input  type="text" name="username" class="search" placeholder="搜索">
                <input type="submit" name="" id="submit" class="btn" value="搜索">
            </form>
          </div>
        </div>
      </div>
      <form action="datesave" method="post" id="myform">  
        <div class="layui-row">
          <div class="layui-col-xs3">
            <div class="grid-demo grid-demo-bg1">
               <!-- 主题 -->
                <div class="layui-row">
                    <div class="layui-col-xs1">
                      <div class="grid-demo grid-demo-bg1">&nbsp;</div>
                    </div>
                    <div class="layui-col-xs8">
                      <div class="grid-demo">
                          <div class="control-group">
                              <label class="control-label" for="inputEmail">主题：</label>                       
                                <input id="inputEmail" type="text" name="title"/>                
                            </div>
                      </div>
                    </div>
                  </div>
                  <br>                
                  <div class="layui-row">
                      <div class="layui-col-xs1">
                        <div class="grid-demo grid-demo-bg1" >&nbsp;</div>
                      </div>
                      <div class="layui-col-xs8">
                        <div class="grid-demo" >                        
                            <div class="control-group">
                                <label class="control-label" for="inputEmail">开始日期：</label>                       
                                    <input type="text" width="400px" class="layui-input" name="startTime" id="startTime" placeholder="yyyy-MM-dd HH:mm:ss">             
                              </div>                      
                        </div>
                      </div>
                    </div>
                    <br>
                    <div class="layui-row">
                        <div class="layui-col-xs1">
                          <div class="grid-demo grid-demo-bg1" >&nbsp;</div>
                        </div>
                        <div class="layui-col-xs8">
                         <br>
                          <div class="grid-demo" >
                              <label>会议类型:</label>                  
                              <select name="typeInt"  style="border-radius: 5px;">                       
                              <option value="0">娱乐</option>
                              <option value="1">商务</option>
                              <option value="1">事务</option>
                              </select>  
                          </div>
                        </div>
                      </div>  
            </div>
          </div>
          <div class="layui-col-xs3">
            <div class="grid-demo">
                <div class="layui-row">
                    <div class="layui-col-xs1">
                      <div class="grid-demo grid-demo-bg1">&nbsp;</div>
                    </div>
                    <div class="layui-col-xs8">
                      <div class="grid-demo" >
                          <div class="layui-row">
                              <div class="layui-col-xs2">
                                <div class="grid-demo grid-demo-bg1">&nbsp;</div>
                              </div>
                              <div class="layui-col-xs4">
                                <div class="grid-demo">
                                    <div class="control-group" >
                                         <label class="control-label" for="inputEmail">&nbsp;</label>                       
                                          <input  type="text" style="border:none;"/>                                                     
                                      </div>
                                </div>
                              </div>
                            </div>                            
                      </div>
                    </div>
                  </div>
                  <!-- 结束时间 -->
                  <br>
                  <div class="layui-row">
                      <div class="layui-col-xs1">
                        <div class="grid-demo grid-demo-bg1" >&nbsp;</div>
                      </div>
                      <div class="layui-col-xs8">
                        <div class="grid-demo">                      
                            <div class="control-group">
                                <label class="control-label" for="inputEmail">结束日期：</label>                       
                                    <input type="text" width="400px" class="layui-input" name="endTime" id="endTime" placeholder="yyyy-MM-dd HH:mm:ss">             
                              </div>                      
                        </div>
                      </div>
                    </div>
                    <br>
                    <div class="layui-row">
                        <div class="layui-col-xs1">
                          <div class="grid-demo grid-demo-bg1" >&nbsp;</div>
                        </div>
                        <div class="layui-col-xs8">
                          <div class="grid-demo" >
                              <div class="control-group">
                                  <label class="control-label" for="inputEmail">地址：</label>                       
                                  <input type="text" class="layui-input" name="address"/>
                                </div>
                          </div>
                        </div>
                      </div>  
            </div>
          </div>
          <div class="layui-col-xs3">
            <div class="grid-demo grid-demo-bg1" >            
                <div class="layui-row">
                    <div class="layui-col-xs8">
                      <div class="grid-demo" >
                          <div class="panel-body" style="height: 200px;width: 218px; overflow:scroll">
                              <div style="border: 1px  #000000; width: 200px; margin: 0 auto;">
                                  <span>                   							
                                  <c:forEach var="u" items="${users}">
                                    <table id="table">
                                      <tr>
                                        <td> <input type="checkbox" name="userid[]" value="${u.id}"/> &nbsp;&nbsp;${u.username}</td>
                                      </tr>        
                                      </table> 
                                </c:forEach>  
                              </span>
                              </div>
                            </div>
                      </div>
                    </div>
                  </div>
            </div>
          </div>
          <div class="layui-col-xs3">
            <div class="grid-demo">
              &nbsp;
            </div>
          </div>
        </div>

        <br>
        <div class="layui-row">
            <div class="layui-col-xs6">
              <div class="grid-demo grid-demo-bg1" >
                  <div class="layui-col-xs1">
                      <div class="grid-demo grid-demo-bg1" >&nbsp;</div>
                    </div>
                    <div class="layui-col-xs12">
                        <div class="grid-demo grid-demo-bg1">
                        
                            <div class="layui-inline">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label >&nbsp;内容：</label><br>
                                <div class="layui-input-inline" style="overflow: auto;"> 
                                 <textarea placeholder="请输入内容" style="width: 470px;height:100px;left: 26px" class="layui-textarea" name="description"></textarea>                               
                                  <!-- <textarea id="textarea-text" rows="7" cols="50" name="description"></textarea>  -->
                                </div><br>
                              </div>
                        </div>
                      </div>
              </div>
            </div>
            <div class="layui-col-xs6">
              <div class="grid-demo" >&nbsp;</div>
            </div>
          </div>      
        <div class="layui-row" style="margin: 20px 20px;">
            <div class="layui-col-xs6">
              <div class="grid-demo grid-demo-bg1">&nbsp;</div>
            </div>
            <div class="layui-col-xs6">
              <div class="grid-demo">

                  <div class="layui-col-xs2">
                      <div class="grid-demo grid-demo-bg1">
                          <button class="btn" id="btusubmit" type="submit">保存</button>
                      </div>
                    </div>
                    <div class="layui-col-xs2">
                      <div class="grid-demo" >
                          <button class="btn" type="reset">重置</button>
                      </div>
                    </div>
                    <div class="layui-col-xs2">
                        <div class="grid-demo grid-demo-bg1">
                            <button class="btn" type="button" onclick="javascript:history.back(-1);">返回</button>
                        </div>
                      </div>
              </div>
            </div>

          </div>
        </form>
        </div>
        </div>
<script type="text/javascript">
layui.use('laydate', function () {
    var laydate = layui.laydate;

    //日期时间选择器
    laydate.render({
      elem: '#startTime'
      , type: 'datetime'
    	  ,trigger: 'click' 
    });

    //日期时间选择器
    laydate.render({
      elem: '#endTime'
    	  , type: 'datetime'
    	  ,trigger: 'click' 
    });
    
     $(function(){
        $("#myform").validate({

        	errorPlacement: function(error, element) {
        		if (element.is(":checkbox")||element.is(":radio")){
        			error.appendTo(element.parent().parent());
        		}else {					
        			error.insertAfter(element);
        		}
        	},
        	rules:{
        		title:{required:true},
                startTime:{required:true},
                endTime:{required:true},
                address:{required:true},
                description:{required:true},
                "userid[]":{ required:true,min:1}
        	},
        	 messages:{
         		title:{required:"请填写会议主题"},
                startTime:{required:"请选择开始时间"},
                endTime:{required:"请选择结束时间"},
                address:{required:"请填写会议地址"},
                description:{required:"请填写会议内容"},
                "userid[]":{ required:"至少选择一项"}
        	 }                             
            }); 
    });

  });
</script>
</html> 