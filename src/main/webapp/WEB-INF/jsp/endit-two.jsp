<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--     <script type="text/javascript">
        function ApplicationSave() {
            //具体保存操作
            //需要返回值，保存成功，返回true，保存失败返回false
</script>  -->
    <script src="static/jquery/jquery.js"></script>
	<script src="static/layui/layui.js"></script>
	<script type="text/javascript">
	layui.use('laydate', function(){
	var laydate = layui.laydate;
	  //日期时间选择器
	  laydate.render({
	    elem: '#startTime'
	    ,type: 'datetime'
	  });
	  laydate.render({
		    elem: '#endTime'
		    ,type: 'datetime'
		  });
	 });
	</script>
</head>
<!-- readonly="readonly" -->
<body οnlοad="load()" style="margin: auto">
    <form action="save" method="post">
        <table id="data" class="editorTable" style="margin: auto; margin-top: 50px; width: 80%;">
             <!-- <tr > -->
               <!--  <th style="display: none;"> 会议ID：</th>  -->
                <input type="hidden" name="Id" value="${param.id==null?0:param.id}" id="data-id"/>
          <!--   </tr> -->

            <tr >
                <th> 会议名称：</th>
                <td>  <input type="text" name="title" id="title" value="${findid.title}"></td>
            </tr>

            <tr>
                <th> 会议级别：</th>
                <td><input type="text" name="description" id="description" value="${findid.description}"></td>
            </tr>
            <tr>
                <th> 会议开始时间：</th>
                <td> <input type="text" name="startTime" id="startTime" value="${findid.startTime}" placeholder="yyyy-MM-dd HH:mm:ss"></td>
            </tr>
            <tr>
                <th> 会议地址： </th>
                <td>
               <input type="text" name="address" id="address" value="${findid.address}">
                </td>
            </tr>
            <tr>
                <th> 会议结束时间：</th>
                <td> <input type="text" name="endTime" id="endTime" value="${findid.endTime}" placeholder="yyyy-MM-dd HH:mm:ss"></td>
             </tr>
        </table>
    </form>
</body>
</html>