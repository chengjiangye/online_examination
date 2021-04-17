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
    <title>登录 - 管理员</title>
</head>
<body>
<h1>登录</h1>
<hr>
<form action="${ctx}/admin/login" method="post">
    <input type="text" name="email" placeholder="邮箱" value="admin@tsinghua.edu.cn"><br>
    <input type="password" name="password" placeholder="密码" value="123"><br>
    <input type="submit" value="登录">
</form>
${requestScope.message}
</body>
</html>
