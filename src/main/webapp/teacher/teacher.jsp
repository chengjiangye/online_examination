<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/26
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/inc.jsp" %>
<html>
<head>
    <title>首页 - 教师</title>
</head>
<body>
<c:if test="${sessionScope.teacher eq null}">
    <c:redirect url="${ctx}/teacher/index.jsp"/>
</c:if>
<h1>首页</h1>
教师：${sessionScope.teacher.username}
</body>
</html>
