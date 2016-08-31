<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/31
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/inc.jsp" %>
<html>
<head>
    <title>学生信息 - 教务</title>
</head>
<body>
<h1>学生信息</h1>
<hr/>
<h3>${sessionScope.clazz.title}</h3>
<small>${sessionScope.clazz.start}</small> - <small>${sessionScope.clazz.finish}</small>
<table border="1">
    <tr>
        <th>序号</th>
        <th>照片</th>
        <th>姓名</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach var="student" items="${sessionScope.clazz.students}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td><img src="${ctx}/static/photo/${student.photo}" alt="${student.username}" width="80"></td>
            <td>${student.username}</td>
            <td><a href="">修改</a></td>
            <td><a href="">删除</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
