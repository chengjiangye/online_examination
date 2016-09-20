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
    <title>首页 - 学生</title>
</head>
<body>
<c:if test="${sessionScope.student eq null}">
    <c:redirect url="${ctx}/student/index.jsp"/>
</c:if>
<h1>首页</h1>
学生：${sessionScope.student.username}<br>
<img src="${ctx}/static/photo/${sessionScope.student.photo}" alt="${sessionScope.student.username}"
     title="${sessionScope.student.username}" width="80">
<hr>
<c:if test="${sessionScope.classPaper ne null}">
    <a href="${ctx}/student/queryPaperByPaperId/${sessionScope.classPaper.paper.id}">
            ${sessionScope.classPaper.paper.course.title} 课程考试
    </a>
</c:if>
</body>
</html>
