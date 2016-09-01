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
    <title>试卷 - 教师</title>
    <script>
        function del() {
            return confirm('REMOVE?');
        }
    </script>
</head>
<body>
<c:if test="${sessionScope.teacher eq null}">
    <c:redirect url="${ctx}/teacher/index.jsp"/>
</c:if>
<h1>试卷</h1>
教师：${sessionScope.teacher.username}
<hr>
<h3>${sessionScope.paper.course.title}考试 试卷</h3>
<small>满分${sessionScope.paper.score}分；考试时间为${sessionScope.paper.time}分钟</small>
<form action="${ctx}/test/create" method="post">
    <input type="hidden" name="paperId" value="${sessionScope.paper.id}">
    题型
    <select name="type">
        <option value="选择题">选择题</option>
        <option value="填空题">填空题</option>
        <option value="简答题">简答题</option>
        <option value="编程题">编程题</option>
    </select><br>
    <textarea name="question" placeholder="题目"></textarea><br>
    <input name="optionA" placeholder="选项 A"><br>
    <input name="optionB" placeholder="选项 B"><br>
    <input name="optionC" placeholder="选项 C"><br>
    <input name="optionD" placeholder="选项 D"><br>
    <textarea name="answer" placeholder="参考答案"></textarea><br>
    <input type="submit" value="创建">
</form>
<hr>
<table border="1">
    <tr>
        <th>序号</th>
        <th>TYPE</th>
        <th>QUESTION</th>
        <th>OPTIONA</th>
        <th>OPTIONB</th>
        <th>OPTIONC</th>
        <th>OPTIOND</th>
        <th>ANSWER</th>
        <th colspan="2">OPERATION</th>
    </tr>
    <c:forEach var="test" items="${sessionScope.paper.tests}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td>${test.type}</td>
            <td>${test.question}</td>
            <td>${test.optionA}</td>
            <td>${test.optionB}</td>
            <td>${test.optionC}</td>
            <td>${test.optionD}</td>
            <td>${test.answer}</td>
            <td><a href="${ctx}/test/queryById/${test.id}">MODIFY</a></td>
            <td><a class="delete" href="${ctx }/test/remove/${test.id}" onclick="return del()">REMOVE</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>