<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/inc.jsp"%>
<html>
<head>
    <title>首页 - 在线考试系统</title>
    <style>
        @import "${ctx}/static/css/style.css";
    </style>
</head>
<body>
<h1>首页</h1>
<a href="${ctx}/admin/index.jsp">管理员登录</a>
<a href="${ctx}/teacher/index.jsp">教师登录</a>
<a href="${ctx}/assistant/index.jsp">教务登录</a>
<a href="${ctx}/student/queryAllClasses">学生注册</a>
<a href="${ctx}/student/index.jsp">学生登录</a>
</body>
</html>
