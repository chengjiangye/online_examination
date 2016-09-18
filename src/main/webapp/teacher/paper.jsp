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
    <style>
        @import "${ctx}/static/css/style.css";
    </style>
    <script src="${ctx}/static/js/jquery-3.1.0.min.js"></script>
    <script>
        function del() {
            return confirm('REMOVE?');
        }
        $(function () {
            $('#type').change(function () {
                var selectedType = $(this).val();
                console.log(selectedType);
                if (selectedType != '选择题') {
                    $('#options').hide();
                } else {
                    $('#options').show();
                }
                if (selectedType == '编程题') {
                    $('#answer').hide();
                } else {
                    $('#answer').show();
                }
            });

            $('button').click(function () {
                $('#preview').toggle();
                if ($('#preview').css('display') == 'none') {
                    $(this).text('预览试卷');
                } else {
                    $(this).text('取消预览');
                }
            });

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
    <select id="type" name="type">
        <option value="选择题">选择题</option>
        <option value="填空题">填空题</option>
        <option value="简答题">简答题</option>
        <option value="编程题">编程题</option>
    </select><br>
    <textarea name="question" placeholder="题目"></textarea>
    <small>填空题的空白用 ### 表示</small>
    <br>
    <div id="options">
        <input name="optionA" placeholder="选项 A"><br>
        <input name="optionB" placeholder="选项 B"><br>
        <input name="optionC" placeholder="选项 C"><br>
        <input name="optionD" placeholder="选项 D"><br>
    </div>
    <textarea id="answer" name="answer" placeholder="参考答案"></textarea><br>
    <input name="score" placeholder="分数"><br>
    <input type="submit" value="创建">
</form>
<hr>
<table border="1">
    <tr>
        <th>序号</th>
        <th>题型</th>
        <th>题目</th>
        <th>选项A</th>
        <th>选项B</th>
        <th>选项C</th>
        <th>选项D</th>
        <th>参考答案</th>
        <th>分数</th>
        <th colspan="2">操作</th>
    </tr>
    <c:set var="totalScore"/>
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
            <td>${test.score}</td>
            <td><a href="${ctx}/test/queryById/${test.id}">MODIFY</a></td>
            <td><a class="delete" href="${ctx }/test/remove/${test.id}" onclick="return del()">REMOVE</a></td>
        </tr>
        <c:set var="totalScore" value="${totalScore + test.score}"/>
    </c:forEach>
</table>
当前试卷总分：${totalScore}
<hr>
<button>预览试卷</button>
<div id="preview">
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
</div>
</body>
</html>
