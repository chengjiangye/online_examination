<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/inc.jsp"%>
<html>
<head>
    <title>首页 - 在线考试系统</title>
</head>
<body>
<h1>首页</h1>
<form action="${ctx}/admin/login">
    <input type="text" name="email" placeholder="邮箱" value="admin@tsinghua.edu.cn"><br>
    <input type="password" name="password" placeholder="密码" value="123"><br>
    <input type="submit" value="登录">
</form>
${requestScope.message}
</body>
</html>
