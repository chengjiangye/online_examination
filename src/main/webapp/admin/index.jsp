<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/25
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/inc.jsp" %>
<html>
<head>
    <title>首页 - 管理员</title>
</head>
<body>
<c:if test="${sessionScope.admin eq null}">
    <c:redirect url="${ctx}/index.jsp"/>
</c:if>
<h1>首页 - 管理员</h1>
系统管理员：${sessionScope.admin.username}
<hr>
<form action="${ctx}/admin/create" method="post">
    <select name="role">
        <option value="admin">系统管理员</option>
        <option value="teacher">教师</option>
        <option value="assistant">教务</option>
    </select><br>
    <input name="email" placeholder="邮箱" value="@tsinghua.edu.cn"><br>
    <input name="username" placeholder="用户名" value="姓名"><br>
    <input type="password" name="password" placeholder="密码" value="123"><br>
    <input type="password" name="repassword" placeholder="重复密码" value="123"><br>
    <input type="submit" value="创建">
</form>
</body>
</html>
