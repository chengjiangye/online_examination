<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>登录 - 学生</title>
</head>
<body>
<h1>登录</h1>
<hr>
<form action="${ctx}/student/login" method="post">
    <input type="text" name="email" placeholder="邮箱" value="student@tsinghua.edu.cn"><br>
    <input type="password" name="password" placeholder="密码" value=""><br>
    <input type="submit" value="登录">
</form>
${requestScope.message}
</body>
</html>