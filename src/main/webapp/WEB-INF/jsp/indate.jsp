<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table{
margin: 200xp 200px;
margin-left: 4pc;
}

</style>
</head>
<body>
  <div class="container">
 <!--        <form action="date" class="parent">
            <input  type="text" name="username" class="search" placeholder="搜索">
            <input type="submit" name="" id="submit" class="btn" value="搜索">
        </form> -->
        </div>
<div class="panel-body" style="height: 200px;width: 218px; overflow:scroll">
  <div style="border: 1px  #000000; width: 200px; margin: 0 auto;">
      <span>                   							
	<c:forEach var="u" items="${users}">
        <table id="table">
          <tr>
            <td> <input type="checkbox" name="userid" value="${u.id}"/> &nbsp;${u.username}</td>
          </tr>
          </table> 
    </c:forEach>  
  </span>
  </div>
</div>
</body>
</html>