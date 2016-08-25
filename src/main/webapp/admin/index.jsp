<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/25
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/inc.jsp"%>
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
</body>
</html>
