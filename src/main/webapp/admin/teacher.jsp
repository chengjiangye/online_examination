<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/25
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/inc.jsp" %>
<html>
<head>
    <title>维护教师信息 - 管理员</title>
    <script>
        function del() {
            return confirm("确认删除？");
        }
    </script>
</head>
<body>
<h1>维护教师信息</h1>
<form action="${ctx}/admin/createTeacher" method="post">
    <input name="email" placeholder="邮箱" value="teacher@tsinghua.edu.cn"><br>
    <input name="username" placeholder="用户名" value="教师"><br>
    <input type="password" name="password" placeholder="密码" value="123"><br>
    <input type="password" name="repassword" placeholder="重复密码" value="123"><br>
    <input type="submit" value="创建">
</form>
<hr>
<table border="1">
    <tr>
        <th>序号</th>
        <th>邮箱</th>
        <th>姓名</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach var="teacher" items="${sessionScope.teachers}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${teacher.email}</td>
            <td>${teacher.username}</td>
            <td><a href="${ctx}/admin/queryOneTeacher/${teacher.id}">修改</a></td>
            <td><a href="${ctx}/admin/removeTeacher/${teacher.id}" onclick="return del()">删除</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
