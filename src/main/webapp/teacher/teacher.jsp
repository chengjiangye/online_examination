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
    <script>
        function del() { return confirm('REMOVE?'); }
    </script>
</head>
<body>
<c:if test="${sessionScope.teacher eq null}">
    <c:redirect url="${ctx}/teacher/index.jsp"/>
</c:if>
<h1>首页</h1>
教师：${sessionScope.teacher.username}
<hr>
<form action="${ctx}/teacher/createPaper" method="post">
    课程
    <select name="courseId">
        <c:forEach var="course" items="${sessionScope.courses}">
            <option value="${course.id}">${course.title}</option>
        </c:forEach>
    </select><br>
    <input name="time" placeholder="考试时间（分钟）"><br>
    <input name="score" placeholder="试题总分"><br>
    <input type="submit" value="创建">
</form>
<hr>
<table border="1">
    <tr>
        <th>序号</th>
        <th>考试时间（分钟）</th>
        <th>试题总分</th>
        <th>TEACHERID</th>
        <th>COURSEID</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach var="paper" items="${sessionScope.papers}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${paper.time}</td>
            <td>${paper.score}</td>
            <td>${paper.teacherId}</td>
            <td>${paper.courseId}</td>
            <td><a href="${ctx}/paper/queryById/${paper.id}">MODIFY</a></td>
            <td><a class="delete" href="${ctx }/paper/remove/${paper.id}" onclick="return del()">REMOVE</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
