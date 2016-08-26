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
    <title>首页 - 教务</title>
</head>
<body>
<c:if test="${sessionScope.assistant eq null}">
    <c:redirect url="${ctx}/assistant/index.jsp"/>
</c:if>
<h1>首页</h1>
教务：${sessionScope.assistant.username}
</body>
</html>
