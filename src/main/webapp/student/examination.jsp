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
    <title>在线考试 - 学生</title>
    <style>
        @import "${ctx}/static/css/style.css";
    </style>
    <script src="${ctx}/static/js/jquery-3.1.0.min.js"></script>
    <script>
        $(function () {
            $.each($('.x'), function (index) {
                $(this).prepend(index + 1 + '. ');
            });
            $.each($('.t'), function (index) {
                $(this).html($(this).text().replace('###', '<input name="' + $(this).attr('title') + '">'));
                $(this).prepend(index + 1 + '. ');
            });
            $.each($('.j'), function (index) {
                $(this).prepend(index + 1 + '. ');
            });
            $.each($('.b'), function (index) {
                $(this).prepend(index + 1 + '. ');
            });
        });
    </script>
</head>
<body>
<c:if test="${sessionScope.student eq null}">
    <c:redirect url="${ctx}/student/index.jsp"/>
</c:if>
<h1>在线考试</h1>
学生：${sessionScope.student.username}<br>
<img src="${ctx}/static/photo/${sessionScope.student.photo}" alt="${sessionScope.student.username}"
     title="${sessionScope.student.username}" width="80">
<hr>
<div>
    <h1>${sessionScope.paper.course.title} 课程考试</h1>
    <small>考试时间：${sessionScope.paper.time}分钟</small>
    <small>总分：${sessionScope.paper.score}</small>
    <form action="${ctx}/student/" method="post" enctype="multipart/form-data">
        <h2>一、选择题</h2>
        <c:forEach var="test" items="${sessionScope.paper.tests}">
            <c:if test="${test.type == '选择题'}">
                <div class="x">${test.question}</div>
                <input type="radio" name="${test.id}">A. ${test.optionA}<br>
                <input type="radio" name="${test.id}">B. ${test.optionB}<br>
                <input type="radio" name="${test.id}">C. ${test.optionC}<br>
                <input type="radio" name="${test.id}">D. ${test.optionD}<br>
            </c:if>
        </c:forEach>
        <h2>二、填空题</h2>
        <c:forEach var="test" items="${sessionScope.paper.tests}">
            <c:if test="${test.type == '填空题'}">
                <div class="t" title="${test.id}">${test.question}</div>
            </c:if>
        </c:forEach>
        <h2>三、简答题</h2>
        <c:forEach var="test" items="${sessionScope.paper.tests}">
            <c:if test="${test.type == '简答题'}">
                <div class="j">${test.question}</div>
                <textarea name="${test.id}"></textarea><br>
            </c:if>
        </c:forEach>
        <h2>三、编程题</h2>
        <c:forEach var="test" items="${sessionScope.paper.tests}">
            <c:if test="${test.type == '编程题'}">
                <div class="b">${test.question}</div>
                <input type="file" name="${test.id}"><br>
            </c:if>
        </c:forEach>
        <input type="submit" value="提交">
    </form>
</div>
</body>
</html>
