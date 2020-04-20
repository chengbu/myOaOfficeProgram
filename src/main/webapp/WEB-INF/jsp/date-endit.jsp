<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <div style="padding: 15px;">
<style> 
        .demo-carousel {
        height: 200px;
        line-height: 200px;
        text-align: center;}
        </style>

	<table class="layui-hide" id="demo" lay-filter="test"></table>
	<script type="text/html" id="barDemo">
  <a  class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" id="can">查看</a>
  <a  class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a  class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

 <div class="layui-tab layui-tab-brief" lay-filter="demo">
  <div class="layui-tab-content">
    <div class="layui-tab-item">
      <div id="laydateDemo"></div>
    </div>
    <div class="layui-tab-item">
      <div id="pageDemo"></div>
    </div>
    <div class="layui-tab-item">
      <div id="sliderDemo" style="margin: 50px 20px;"></div>
    </div>
  </div>
</div>  
<!-- 	<script src="static/layui/layui.js"></script> -->
	<script type="text/html" id="time">
    {{layui.util.toDateString(d.start_time*1000, 'yyyy-MM-dd HH:mm:ss')}}
</script>
	<script>
      layui.use(['laydate', 'laypage','util', 'layer', 'table', 'carousel',  'element', 'slider'], function(){
	  var laydate = layui.laydate//日期	  
	  ,laypage = layui.laypage //分页
	  ,util = layui.util//时间戳
	  ,layer = layui.layer //弹层
	  ,table = layui.table //表格
	  ,carousel = layui.carousel //轮播
	  ,element = layui.element //元素操作
	  ,slider = layui.slider //滑块

	  //监听Tab切换
	  element.on('tab(demo)', function(data){
	    layer.tips('切换了 '+ data.index +'：'+ this.innerHTML, this, {
	      tips: 1
	    });
	  });
	  //执行一个 table 实例
	  table.render({
	    elem: '#demo'
	    ,height: 400
	    ,url: 'dates'//数据接口
	    ,method:"get"
	    , parseData: function (res) {//res即为返回原始数据
	      console.log(res);
	      return {
	        "code": 0
	        , "msg": ""
	        , "count": ${toolsRows}
	        , "data": res
	      }
	    }
	    ,title: '日程表'
	    ,page: true //开启分页
	    /* ,limit: 20 */
	    ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
	    ,totalRow: false //开启合计行
	    ,cols: [[ //表头
	      {type: 'checkbox', fixed: 'left'}
	      ,{field:'id', width:80, title: 'ID', sort: true}
	      ,{field:'title', width:120, title: '会议名称'}
	      ,{field:'description', width:120, title: '会议内容'}
	      ,{field:'typeInt', width:90, title: '会议类型',templet: function(d){
	    	  if(d.typeInt==0) 
	                 return '娱乐';
	    	  if(d.typeInt==1) 
	                 return '商务';
	    	  if(d.typeInt==2) 
	                 return '事务';}}
	      ,{field:'startTime',width:160,  title: '开始时间',templet:'#time'}
	      ,{field:'endTime', width:160, title: '结束时间',templet:'#time'}
	      ,{field:'address', width:120, title: '会议地址'}
	      ,{field:'username', width:90, title: '参与人员'}
	      ,{field:'createTime', width:160, title: '创建时间',templet:'#time'}
	      ,{fixed: 'right', width: 165, align:'center', toolbar: '#barDemo'}
	    ]]
	  });
	  
  //监听头工具栏事件
	  table.on('toolbar(test)', function(obj){
	    var checkStatus = table.checkStatus(obj.config.id)
	    ,data = checkStatus.data; //获取选中的数据
	    var tr = obj.tr;
	    switch(obj.event){
	      case 'add':	    	       
                layer.open({type: 2,
                            title: '添加页面',
                            btn : [ '保存','取消' ],
							closeBtn:2,
							skin: 'layui-layer-molv',
							shadeClose: false,
							shade: 0.8,                          
							area: ['680px', '420px'],
							//跳转的页面 
							content:'http://localhost:8080/mvcdemo/endits' ,   
				yes: function(index, layero){
                                layer.close(index);
                                //点击分页刷新当前页	
                                $(".layui-laypage-btn").click();							
							  }
               	});	      
	      break;
	      case 'update':
	        if(data.length === 0){
	          layer.msg('请选择一行');
	        } else if(data.length > 1){
	          layer.msg('只能同时编辑一个');
	        } else {
        	 layer.open({
						type : 2,
						//不显示标题栏
						title : "编辑页面", 
						closeBtn : 2,
						area : ["500px","480px" ],
						shade : 0.8,
						data : data,
						//设定一个id，防止重复弹出 时间戳1280977330748   (new Date()).valueOf()
						id : data.id, 
						btn : [ '保存','取消' ],
						btnAlign : 'r',
						//拖拽模式，0或者1    
						moveType : 1, 
						content : 'endit?id='+ checkStatus.data[0].id,
						yes : function(index,layero) {				
                                layer.close(index);
                                $(".layui-laypage-btn").click();//点击分页刷新当前页											
                                },
                                btn2 : function(index,layero) {layer.close(index);}
						});
					}
		 break;
		 case 'delete':
		 if (data.length === 0) {layer.msg('请选择一行', {icon : 2});
		 } else {
				layer.alert('您确认要删除id为：'+data.length+'的数据吗？', {
					//样式类名layui-layer-lan或layui-layer-molv  自定义样式
					        skin: 'layui-layer-molv' 
					        // 是否显示关闭按钮  
                            ,closeBtn: 1 
                            //动画类型  
                            ,anim: 1 
                            ,btn: ['确定','取消'] //按钮
                            ,icon: 2    // icon
				,yes:function(){
                               //发送请求到后台
                              $.post("menu/delete", {id:checkStatus.data[0].id}, function (result) {
                            	   //删除成功，刷新当前页表格
                                  if (result.code == "1") {
                                      obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                      layer.close(index);
                                      $(".layui-laypage-btn").click();//点击分页刷新当前页
                                  }else  if(result.code != "-1"){  //删除失败
                                  	window.location.reload();
                                  }
                                  layer.close(layero,index);
                              });
							}});											
							}
			break;
			};
			});
						//监听行工具事件
			table.on('tool(test)',function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			    var data = obj.data //获得当前行数据
				, layEvent = obj.event; //获得 lay-event 对应的值	  
				var kk = data['id']; //获取属性uid的值
				if (layEvent === 'detail') {
				layer.open({
							type : 2,
							title : "查看", //不显示标题栏
							closeBtn : 2,
							area : [ "500px","480px" ],
							hade : 0.8,
							data : data,
							id : data.id, //设定一个id，防止重复弹出 时间戳1280977330748   (new Date()).valueOf()
							btn : "关闭",
							move: '.layui-layer-title', //拖拽模式，0或者1
							content : 'canendit?id='+ data.id});
							} 
			 else if (layEvent === 'del') {layer.alert('您确认要删除id为：'+data.id+'的数据吗？', {
				//样式类名layui-layer-lan或layui-layer-molv  自定义样式
							skin: 'layui-layer-molv' 
                            ,closeBtn: 1    // 是否显示关闭按钮
                            ,anim: 1 //动画类型
                            ,btn: ['确定','取消'] //按钮
                            ,icon: 2    // icon
				,yes:function(){
                             //发送请求到后台
                             $.post("menu/delete", {id:data.id}, function (result) {
                                 if (result.code == "1") {//删除成功，刷新当前页表格
                                     obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                                     layer.close(index);
                                     $(".layui-laypage-btn").click();//点击分页刷新当前页
                                 }else  if(result.code != "-1"){  //删除失败
                                 	window.location.reload();
                                 }
                                 layer.close(layero,index);
                             });}														
							});	
				} else if (layEvent === 'edit') {
					//tab层
					layer.open({
								type : 2,
								title : "编辑页面", //不显示标题栏
								btn : '保存',
								area : [ '700px','450px' ],
								fixed : false, //不固定
								maxmin : true,
								content : 'endit?id='+ data.id,
								yes: function(index, layero){
	                                layer.close(index);
	                                $(".layui-laypage-btn").click();//点击分页刷新当前页								
								  }    
							});
								setTimeout(function() {
									layer.closeAll('loading');
								}, 2000);
	
							}
						});

	//执行一个轮播实例
	carousel.render({
		elem : '#test1',
		width : '100%' //设置容器宽度
		,
		height : 200,
		arrow : 'none' //不显示箭头
		,
		anim : 'fade' //切换动画方式
	});
	
	//分页
	laypage.render({
		elem : 'pageDemo' //分页容器的id
		,
		count : 2 //总页数
		,
		skin : '#1E9FFF' //自定义选中色值
		//,skip: true //开启跳页
		,
		jump : function(obj, first) {
			if (!first) {
				layer.msg('第' + obj.curr + '页', {
					offset : 'b'
				});
			}
		}
	});

  //将日期直接嵌套在指定容器中
  var dateIns = laydate.render({
    elem: '#laydateDemo'
    ,position: 'static'
    ,calendar: true //是否开启公历重要节日
    ,mark: { //标记重要日子
      '0-10-14': '生日'
      ,'2018-08-28': '新版'
      ,'2018-10-08': '神秘'
    } 
    ,done: function(value, date, endDate){
      if(date.year == 2017 && date.month == 11 && date.date == 30){
        dateIns.hint('一不小心就月底了呢');
      }
    }
    ,change: function(value, date, endDate){
      layer.msg(value)
    }
  });
  
  //分页
  laypage.render({
    elem: 'pageDemo' //分页容器的id
    ,count: 100 //总页数
    ,skin: '#1E9FFF' //自定义选中色值
    //,skip: true //开启跳页
    ,jump: function(obj, first){
      if(!first){
        layer.msg('第'+ obj.curr +'页', {offset: 'b'});
      }
    }
  });
//滑块
var sliderInst = slider.render({
	elem : '#sliderDemo',
	input : true  //输入框
});


    //时间戳的处理
	layui.laytpl.toDateString = function(d, format){
	  var date = new Date(d || new Date())
	  ,ymd = [
		this.digit(date.getFullYear(), 4)
		,this.digit(date.getMonth() + 1)
		,this.digit(date.getDate())
	  ]
	  ,hms = [
		this.digit(date.getHours())
		,this.digit(date.getMinutes())
		,this.digit(date.getSeconds())
	  ];

	  format = format || 'yyyy-MM-dd HH:mm:ss';

	  return format.replace(/yyyy/g, ymd[0])
	  .replace(/MM/g, ymd[1])
	  .replace(/dd/g, ymd[2])
	  .replace(/HH/g, hms[0])
	  .replace(/mm/g, hms[1])
	  .replace(/ss/g, hms[2]);
	};

	//数字前置补零
	layui.laytpl.digit = function(num, length, end){
	  var str = '';
	  num = String(num);
	  length = length || 2;
	  for(var i = num.length; i < length; i++){
		str += '0';
	  }
	  return num < Math.pow(10, length) ? str + (num|0) : num;
	};  	
});
</script>
</div>

