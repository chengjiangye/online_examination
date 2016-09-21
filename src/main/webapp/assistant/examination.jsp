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
    <title>维护考试信息 - 教务</title>
    <script>
        function del() { return confirm('REMOVE?'); }
    </script>
</head>
<body>
<c:if test="${sessionScope.assistant eq null}">
    <c:redirect url="${ctx}/assistant/index.jsp"/>
</c:if>
<h1>维护考试信息</h1>
教务：${sessionScope.assistant.username}
<hr>
<form action="${ctx}/classpaper/create" method="post">
    班级名称
    <select name="classId">
        <c:forEach var="clazz" items="${sessionScope.classes}">
            <option value="${clazz.id}">${clazz.title}</option>
        </c:forEach>
    </select><br>
    试卷名称
    <select name="paperId">
        <c:forEach var="paper" items="${sessionScope.papers}">
            <option value="${paper.id}">${paper.course.title} 试卷${paper.id} 出题教师：${paper.teacher.username}</option>
        </c:forEach>
    </select><br>
    <input name="time" placeholder="考试时间"><br>
    <input type="submit" value="创建">
</form>
<hr/>
<table border="1">
    <tr>
        <th>序号</th>
        <th>班级名称</th>
        <th>试卷名称</th>
        <th>考试时间</th>
        <th>考试状态</th>
        <th>教务姓名</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach var="classPaper" items="${sessionScope.classPapers}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${classPaper.clazz.title}</td>
            <td>${classPaper.paper.course.title} 试卷${classPaper.paper.id}</td>
            <td><fmt:formatDate value="${classPaper.time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
            <td>${classPaper.status}</td>
            <td>${classPaper.assistant.username}</td>
            <td><a href="${ctx}/classpaper/queryById/${classPaper.id}">修改</a></td>
            <td><a href="">删除</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
