<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script>
	var demoMsg = {
		async:"正在进行异步加载，请等一会儿再点击...",
		expandAllOver: "全部展开完毕",
		asyncAllOver: "后台异步加载完毕",
		asyncAll: "已经异步加载完毕，不再重新加载",
		expandAll: "已经异步加载完毕，使用 expandAll 方法"
	}
	
	var setting = {
		async: {
			enable: true,
			url:"${pageContext.request.contextPath}/select-folder-files",
			autoParam:["id", "name=n", "level=lv"],
			otherParam:{"otherParam":"zTreeAsyncTest"},
			dataFilter: filter,
			type: "get"
		},
		callback: {
			onClick:onClick,
			beforeAsync: beforeAsync,
			onAsyncSuccess: onAsyncSuccess,
			onAsyncError: onAsyncError
		}
	};

	function filter(treeId, parentNode, childNodes) {
		if (!childNodes) return null;
		for (var i=0, l=childNodes.length; i<l; i++) {
			childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
		}
		return childNodes;
	}

	function beforeAsync() {
		curAsyncCount++;
	}
	
	function onAsyncSuccess(event, treeId, treeNode, msg) {
		curAsyncCount--;
		if (curStatus == "expand") {
			expandNodes(treeNode.children);
		} else if (curStatus == "async") {
			asyncNodes(treeNode.children);
		}

		if (curAsyncCount <= 0) {
			if (curStatus != "init" && curStatus != "") {
				$("#demoMsg").text((curStatus == "expand") ? demoMsg.expandAllOver : demoMsg.asyncAllOver);
				asyncForAll = true;
			}
			curStatus = "";
		}
	}

	function onAsyncError(event, treeId, treeNode, XMLHttpRequest, textStatus, errorThrown) {
		curAsyncCount--;

		if (curAsyncCount <= 0) {
			curStatus = "";
			if (treeNode!=null) asyncForAll = true;
		}
	}

	var curStatus = "init", curAsyncCount = 0, asyncForAll = false,
	goAsync = false;
	function expandAll() {
		if (!check()) {
			return;
		}
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		if (asyncForAll) {
			$("#demoMsg").text(demoMsg.expandAll);
			zTree.expandAll(true);
		} else {
			expandNodes(zTree.getNodes());
			if (!goAsync) {
				$("#demoMsg").text(demoMsg.expandAll);
				curStatus = "";
			}
		}
	}
	
	function expandNodes(nodes) {
		if (!nodes) return;
		curStatus = "expand";
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		for (var i=0, l=nodes.length; i<l; i++) {
			zTree.expandNode(nodes[i], true, false, false);
			if (nodes[i].isParent && nodes[i].zAsync) {
				expandNodes(nodes[i].children);
			} else {
				goAsync = true;
			}
		}
	}

	function asyncAll() {
		if (!check()) {
			return;
		}
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		if (asyncForAll) {
			$("#demoMsg").text(demoMsg.asyncAll);
		} else {
			asyncNodes(zTree.getNodes());
			if (!goAsync) {
				$("#demoMsg").text(demoMsg.asyncAll);
				curStatus = "";
			}
		}
	}
	
	function asyncNodes(nodes) {
		if (!nodes) return;
		curStatus = "async";
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		for (var i=0, l=nodes.length; i<l; i++) {
			if (nodes[i].isParent && nodes[i].zAsync) {
				asyncNodes(nodes[i].children);
			} else {
				goAsync = true;
				zTree.reAsyncChildNodes(nodes[i], "refresh", true);
			}
		}
	}

	function reset() {
		if (!check()) {
			return;
		}
		asyncForAll = false;
		goAsync = false;
		$("#demoMsg").text("");
		$.fn.zTree.init($("#treeDemo"), setting);
	}

	function check() {
		if (curAsyncCount > 0) {
			$("#demoMsg").text(demoMsg.async);
			return false;
		}
		return true;
	}
	
	//点击文件树的节点后，把选定的文件夹内容展示在右侧
	function onClick(event, treeId, treeNode, clickFlag){
		$("#localNow").val(treeNode.name);
		$("#localNowId").val(treeNode.id);
		 $("#localParentId").val(treeNode.parentId); 
		var paramId=treeNode.id; 
		$("#folderData").dataTable().fnDestroy();
		var urls="${pageContext.request.contextPath}/select-folder-files-children";
		initMyDatable(paramId,urls);//点击文件树的节点后，把选定的文件夹内容展示在右侧
	}
	
	//$("#folderData").dataTable()传入数据的模板方法
	function initMyDatable(paramId,urls){
		
		$("#folderData").dataTable().fnDestroy();//每次传入数据之前需要先清空table内的数据 */
		var table=$("#folderData").DataTable({
			ajax:{
				url:urls,
				 data:function(params){
						params.folderId=paramId;
						params.name=$("#searchName").val();
					}
			},
			"aoColumns" : [{   //aoColumns设置列时，不可以任意指定列，必须列出所有列。
				"mData" : "type",
				"orderable": false , // 禁用排序
				"sDefaultContent" : "",
				"sWidth" : "8%"
			        },{
						"mData" : "name",
						"orderable" : false, // 禁用排序
						"sDefaultContent" : "",
						"sWidth" : "25%",
						
					}, {
						"mData" : "username",
						"orderable" : false, // 禁用排序
						"sDefaultContent" : "",
						"sWidth" : "13%"
					}, 
					{
						"mData" : "createDate",
						"orderable" : false, // 禁用排序
						"sDefaultContent" : "",
						"sWidth" : "20%"
						/* "render" : function(data, type, full, meta) {
							//时间格式化
							return  DateFormat(data);
						}  */
					},
					{
						"mData" : "size",
						"orderable" : false, // 禁用排序
						"sDefaultContent" : '',
						"sWidth" : "8%"
					}],
			language : {
	 			"lengthMenu" : "_MENU_ 条记录每页",
				"zeroRecords" : "没有找到记录",
				"info" : "第 _PAGE_ 页 ( 总共 _PAGES_ 页 )",
				"infoEmpty" : "无记录",
				"infoFiltered" : "(从 _MAX_ 条记录过滤)",
				"paginate" : {
					"previous" : "上一页",
					"next" : "下一页"
				}
			},
			 lengthMenu:[5,10,20,30,50,100],
			columnDefs:[{		
				render:function(data,type,row){
					//return '<a href="${initParam.staticUrl }/files/'+row.name+'" class="load" data-id="'+row.id+'">"'+row.name+'"</a>';
					return '<a href="#" style="color:#337AB7;text-decoration:underline;" class="load" data-id="'+row.id+'">"'+row.name+'"</a>';
				},
				sWidth: "8%", 
				targets:1
			},{		
				render:function(data,type,row){
					return '<button  class="btn btn-danger deleteFiles" data-id="'+row.id+'" style="line-height:10px;width:50px;margin:3px;margin-left:60px;">删除</button>';
				},
				sWidth: "5%", 
				targets:5
			}],
			searching:false, 
			serverSide:true
		})
		//<a href="${initParam.staticUrl }/files/TestLoad.pptx">下载</a>
		//按name进行模糊查询
		$("#searchButton").click(function(){
			table.ajax.reload();
		});
	}
	
	
	
	//初始化展开文件夹树数据
	function initFolders(){
		$.fn.zTree.init($("#treeDemo"), setting);
		setTimeout(function(){
		expandAll("treeDemo");
		},1000);//延迟加载
	}
	
	//返回上一级
	function previousFolder(){
		$("#previousNode").click(function(){
		var folderId=$("#localParentId").val();
		$.ajax({
				url:'select-folder-files-parentId',
				data:{folderId:folderId},
				success:function(json){
					if(typeof json !=='undifined'){
						var paramId=json.id;
						var urls="${pageContext.request.contextPath}/select-folder-files-children";
						 initMyDatable(paramId,urls);
					}
				}
		
			});
		});
	}
	
	//展开右侧列表项内文件夹的双击事件
/* 	 function doubleTableClick(){
		$('#folderData tbody').on('dblclick', 'tr', function () {
			var folderDatas=$("#folderData").DataTable();
			var datas = folderDatas.row().data();
 			if (typeof datas !=='undefined') { 
 			var paramId=datas.id;
 			var nameNow=datas.name;
 			var parentId=datas.parentId;
 			 var urls="${pageContext.request.contextPath}/select-folder-files-children";
  			 $("#localNow").val(nameNow);
			 $("#localNowId").val(paramId); 
			 $("#localParentId").val(parentId); 
			 initMyDatable(paramId,urls);
			 } 
		} ); 
	} */

	//初始化右侧列表项展开所有内容的数据
	function initRightList() {
		var urls = "${pageContext.request.contextPath}/select-folder-files-name";
		var paramId = 0;//路径内的查询方法内没有该参数，故设为固定值凑数
		initMyDatable(paramId, urls);
		 //doubleTableClick(); 
	}
	
	//val 为要处理的时间戳    json格式的时间转换
	function DateFormat(val) {
	        if (val != null) {
	            //取得时间戳部分 如：获取 /Date(1545299299910)/ 中的 1545299299910 部分
	            var date = new Date(val);
	            //月份为0-11，所以+1，月份小于10时补个0
	            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
	            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
	            var currentTime = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
	            var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
	            var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
	 
	            //格式化显示，形如：2018-12-20 17:48:19
	            return date.getFullYear() + "-" + month + "-" + currentDate + " " + currentTime + ":" + minutes + ":" +seconds;
	        }
	        return "";
	}
	//启动Java script 的加载事件执行所有方法
	$(document).ready(function() {
		initFolders();//初始化展开文件夹树数据
	 	initRightList();//初始化右侧列表项展开所有内容的数据 
		//doubleTableClick();//展开右侧列表项内文件夹的双击事件
		previousFolder();//返回上一级
		
	});
</script>
<script>
	$(function() {
		//select复选框
		$("#allFolder").on('click', function() {
			$(".product").attr('checked', 'checked');
			var items = $(".product");
			console.log(items)

			if ($(".product").attr('checked', 'checked')) {
				$("#allFolder").attr('checked', 'checked');
			} else {
				$("#allFolder").attr('checked');
			}
		})
		//修改
		$("#updateNode").click(function(){
			var id = $("#localNowId").val();
			if (id=="") {
				id=1;
			}
/* 			$("#createId").val(id);
			$("#createModal").modal("show"); */
			
			$("#editId").val(id);//给编辑行绑定id
			$.ajax({
				url : "select-folder-files-parentId",
				data : {
					folderId : id
				},
				dataType : "json",
				success : function(json) {
					var d = json.createDate;
					$("#folderName").val(json.name);
					$("#descriptionM").val(json.description);
				}
			});
			$("#myModal").modal("show");
		});
		//下载
  		$("#folderData").delegate("a.load", "click", function() {
		
			var id = $(this).attr("data-id");
			$("#createId").val(id);
			$.ajax({
				url:"check-type",
				data:{id:id},
				dataType:"json",
				type:"post",
				success:function(json){
					if (json.type==="files") {//href="${initParam.staticUrl }/files/'+row.name+'"
						$(this).attr("href","${initParam.staticUrl }/files/"+json.name+"");
						location.href=$(this).attr("href");
					}else{
						alert("文件夹不支持下载附件！");
					}
				}
			});
		});  
		//保存修改的文件夹名
		$("#save").click(function() {
			if($("#folderName").val()==null||$("#folderName").val()==""){
				$("#editError").text("不能为空！");
				return false;
			}
 			if ($("#folderNameError").text()==="名称已存在！") {
				return false;
			}  
			var postData = $("#editForm").serialize();
			$.ajax({
				url : "update-name",
				type : "post",
				data : postData,
				success : function(message) {
					initFolders();//初始化展开文件夹树数据
					initRightList();//初始化右侧列表项展开所有内容的数据 
					$("#myModal").modal("hide");
				}
			});
		});
		//验证是否重名
		
 		$("#folderName").change(function(){
			var name=$("#folderName").val();
			$.ajax({
				url:"check-name",
				data:{name:name},
				dataType:"json",
				type:"post",
				success:function(json){
		 			if(json===false){
		 				$("#folderNameError").text("名称已存在！");
					} else{
						$("#folderNameError").text("");
					}
				}
			})
 		})
 		//验证是否重名
 		//function checkName(){
 		$("#createName").change(function(){
			var name=$("#createName").val();
			$.ajax({
				url:"check-name",
				data:{name:name},
				dataType:"json",
				type:"post",
				success:function(json){
		 			if(json===false){
		 				$("#createNameError").text("名称已存在！");
					} else{
						$("#createNameError").text("");
					}
				}
			})
 		})

		//保存新建
		$("#createButton").click(function() {
			//checkName();
			if($("#createType").val()==="文档"){
				if($("#filesAnnex").val()===""||$("#filesAnnex").val()===null){
					$("#filesAnnexError").text("附件不能为空！");
					return false;
				}
			}else{
				if($("#filesAnnex").val().length!=0){
					$("#filesAnnexError").text("文件夹不能添加附件！");
					//$("#filesAnnex").val("");
					return false;
				}
			}
			
			if ($("#createName").val()==null || $("#createName").val()=="") {
				alert("名称不能为空！")
				return false;
			}
 			if ($("#createNameError").text()==="名称已存在！") {
				return false;
			}  
			var postData = new FormData($("#createForm").get(0));
			$.ajax({
				url : "insert-folder",
				type : "post",
				data : postData,
				contentType:false,
				processData:false,
				success : function() {
					initFolders();//初始化展开文件夹树数据
					initRightList();//初始化右侧列表项展开所有内容的数据 
					$("#createModal").modal("hide");
				}
			});
		});
		//新建
		$("#createNode").click(function(){
			$("#createName").val("");
			$("#createNameError").text("");
			$("#filesAnnexError").text("");
			$("#description").val("");
			var id = $("#localNowId").val();
			if (id=="") {
				id=1;
			}
			$("#createId").val(id);
			$("#createModal").modal("show");
			//判断类型
/* 			$.ajax({
				url:"check-type",
				data:{id:id},
				dataType:"json",
				type:"post",
				success:function(json){
					if (json.type) {
						$("#createModal").modal("show");
					}else{
						alert("请在文件夹下新建！");
					}
					
				}
			}); */
			
		});
		//选择文件自动填充到name里面
 		$('#filesAnnex').change(function () {  
	        var str = $(this).val();  
	        var fileName = getFileName(str);  
	       // var fileExt = fileName.substring(0,fileName.lastIndexOf('.'));去后缀
	        var fileExt = fileName.substring();//带后缀的
	        $('#createName').val(fileExt);
		}) 
	//获取文件名称  
		function getFileName(path) {
			var pos1 = path.lastIndexOf('/');
			var pos2 = path.lastIndexOf('\\');
			var pos = Math.max(pos1, pos2);
			if (pos < 0) {
				return path;
			} else {
				return path.substring(pos + 1);
			}
		}

		//删除文档
		$("#folderData").on('click','button.deleteFiles',function(){
			var id = $(this).attr("data-id");
			$.ajax({
				url : "delete-folder",
				data : {
					id : id
				},
				type : "post",
				success : function(message) {
					initFolders();//初始化展开文件夹树数据
					initRightList();//初始化右侧列表项展开所有内容的数据 
					$("#localNow").val("根目录");
					if (message != null && message != "") {
						alert(message);
					}
				}
			});
		});
		//删除文件夹
		$("#deleteButton").click(function(){
			var id = $("#localNowId").val();
			if (id=="") {
				id=1;
			}
			$.ajax({
				url : "delete-folder",
				data : {
					id : id
				},
				type : "post",
				success : function(message) {
					initFolders();//初始化展开文件夹树数据
					initRightList();//初始化右侧列表项展开所有内容的数据 
					$("#localNow").val("根目录");
					if (message != null && message != "") {
						alert(message);
					}
				}
			});
		});
	});
</script>
<style>
#editFormFiles{
	display:none;
}
</style>


</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<ul id="treeDemo" class="ztree"
					style="width: 260px; overflow: auto;"></ul>
			</div>

			<div class="col-md-9"  style="margin-top:8px;">
				<div class="row">
					<div class="col-md-12">
						<form class="form-inline">
							<input id="previousNode" type="button" class="btn btn-primary" style="height:30px" value="上一级"/>
							 <button id="createNode" type="button" class="btn btn-primary create" style="height:30px">新建</button> 
 							<button id="updateNode" type="button" class="btn btn-primary edite" style="height:30px">修改</button>
							<button id="deleteButton" type="button" class="btn btn-danger delete" style="height:30px">删除</button>
							 <input type="hidden" id="localNowId">
							 <input type="hidden" id="localParentId">
							&nbsp;&nbsp; 当前位置：<input id="localNow" value="根目录" type="text" class="form-control" readonly="readonly"/> 
							 <input type="text" id="searchName" placeholder="请在此输入查找内容" class="form-control" style="margin-left:30px;"/>
								<input type="button" class="btn btn-primary" style="height:30px" id="searchButton" value="查找"/>
						</form>
					</div>
				</div>
			
				<div class="row">
					<div class="col-md-12" style="margin-top:5px;">
						 <table id="folderData" class="display table-striped" cellspacing="0" width="100%"
						 		 style="background-color:#FFEBC0;">
							<thead>
								<tr style="background-color:#337AB7">
									<th>类型</td>
									<th>名称</th>
									<th>创建者</th>
									<th>创建日期</th>
									<th>文件大小</th>
									<th style="text-align: center;">删除文档</th>
								</tr>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	<!-- 文件夹名字修改 -->
	<div>
		<div class="modal fade" style="margin-top:100px;" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="modalFolderTitle">编辑</h4>
					</div>
					<div class="modal-body">
						<form id="editForm" class="form-horizontal">
								<input type="hidden" name="id" id="editId">
								<div class="form-group">
									<label for="editTitle" class="col-sm-2 control-label">名称</label>
									<div class="col-sm-6">
										<input class="form-control" name="name" id="folderName"
											placeholder="文件夹名称"><label id="folderNameError" style="color:red;"></label>
									</div>
									<div class="col-sm-4">
										<!-- 放置错误信息 -->
									</div>
								</div>
								<div class="form-group">
									<label for="editTitle" class="col-sm-2 control-label">描述</label>
									<div class="col-sm-6">
										<textarea class="form-control" name="description" id="descriptionM"
											placeholder="描述"></textarea><label id="editError" style="color:red;"></label>
									</div>
									<div class="col-sm-4">
										<!-- 放置错误信息 -->
									</div>
								</div>

							
					</div><!-- body -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="save">提交更改</button>
					</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 文件夹名字修改 -- modal -->


		<!-- 新建 文件夹-->
	<div>
		<div class="modal fade" style="margin-top:100px;" id="createModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title" id="modalFolderTitle">新建</h4>
					</div>
					<div class="modal-body">
					<form id="createForm" class="form-horizontal">
								<input type="hidden" name="id" id="createId">
								<div class="form-group">
									<label for="editTitle" class="col-sm-2 control-label">名称</label>
									<div class="col-sm-6">
										<input class="form-control" name="name" id="createName"
											placeholder="名称"><label id="createNameError" style="color:red;"></label>
									</div>
									<div class="col-sm-4">
										<!-- 放置错误信息 -->
									</div>
								</div>
									<div class="form-group">
									<label for="editTitle" class="col-sm-2 control-label">描述</label>
									<div class="col-sm-6">
										<textarea class="form-control" name="description" id="description"
											placeholder="描述"></textarea>
									</div>
									<div class="col-sm-4">
										<!-- 放置错误信息 -->
									</div>
								</div>
								<div class="form-group">
									<label for="editCategoryId" class="col-sm-2 control-label">类型</label>
									<div class="col-sm-6">
										<select id="createType" name="type"
											class="form-control">
											<option value="文件">文件</option>
											<option value="文档">文档</option>
											<c:if test="${param.createType.equals('文件') }">
											<option value="文件">文件</option>
											<option value="文档">文件</option>
											</c:if>
											<c:if test="${param.createType.equals('文档') }">
											<option value="文档">文件</option>
											<option value="文件">文件</option>
											</c:if>
										</select>
									</div>
									<div class="col-sm-4"></div>
								</div>							
								<div class="form-group" id="FolderAnnex">
									<label for="movieImage" class="col-sm-2 control-label">文档附件</label>
									<div class="col-sm-6">
										<img id="movieCover" style="width: 150px;" /> <input
											type="file" name="filesAnnex" id="filesAnnex">
											<label id="filesAnnexError" style="color:red;"></label>
									</div>
									<div class="col-sm-4"></div>
								</div>

								</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="createButton">提交更改</button>
					</div>
				</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- 新建 文件夹-- modal -->
 	<div>
		<%-- <image src="${initParam.staticUrl }/files/1.gif"/> --%>
		
	</div>

</body>
</html>
