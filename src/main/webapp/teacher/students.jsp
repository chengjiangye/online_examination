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
    <title>学生列表 - 判卷 - 教师</title>
</head>
<body>
<c:if test="${sessionScope.teacher eq null}">
    <c:redirect url="${ctx}/teacher/index.jsp"/>
</c:if>
<h1>学生列表 - 判卷</h1>
教师：${sessionScope.teacher.username}
<hr>
<ol>
    <c:forEach var="student" items="${sessionScope.clazz.students}">
        <li><a href="${ctx}/test/queryTestsByStudentIdAndPaperId/${student.id}/${sessionScope.paperId}">${student.username}</a></li>
    </c:forEach>
</ol>
</body>
</html>
