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
    <title>判分 - 教师</title>
    <style>
        @import "${ctx}/static/css/style.css";
    </style>
    <script src="${ctx}/static/js/jquery-3.1.0.min.js"></script>
    <script>
        $(function () {
            var xScoreTotal = 0;
            var tScoreTotal = 0;
            var jScoreTotal = 0;
            var bScoreTotal = 0;

            $.each($('.x_score'), function () {
                xScoreTotal += +$(this).text();
            });
            $('.x_score_total').text('（共 ' + xScoreTotal + ' 分）');

            $.each($('.t_score'), function () {
                tScoreTotal += +$(this).text();
            });
            $('.t_score_total').text('（共 ' + tScoreTotal + ' 分）');

            $.each($('.j_score'), function () {
                jScoreTotal += +$(this).text();
            });
            $('.j_score_total').text('（共 ' + jScoreTotal + ' 分）');

            $.each($('.b_score'), function () {
                bScoreTotal += +$(this).text();
            });
            $('.b_score_total').text('（共 ' + bScoreTotal + ' 分）');

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

            $('form').submit(function () {
                return confirm('是否确认提交试卷？')
            });
        });
    </script>
</head>
<body>
<c:if test="${sessionScope.teacher eq null}">
    <c:redirect url="${ctx}/teacher/index.jsp"/>
</c:if>
<h1>判分</h1>
教师：${sessionScope.teacher.username}
<hr>
<div id="paper">
    <h1>${sessionScope.paper.course.title} 课程考试</h1>
    <h2>考试时间：${sessionScope.paper.time}分钟</h2>
    <h2>总分：${sessionScope.paper.score}</h2>
    <form action="${ctx}/studenttest/submit" method="post" enctype="multipart/form-data">
        <h3>一、选择题 <b class="x_score_total"></b></h3>
        <c:forEach var="test" items="${sessionScope.tests}">
            <c:if test="${test.type == '选择题'}">
                <div class="x">
                        ${test.question} （<span class="x_score">${test.score}</span> 分）
                    参考答案 ${test.answer}
                    学生答案 ${test.studentTests[0].answer}
                    [
                    <c:if test="${test.answer eq test.studentTests[0].answer}">
                        正确
                    </c:if>
                    <c:if test="${test.answer ne test.studentTests[0].answer}">
                        错误
                    </c:if>
                    ]
                </div>
                <input type="radio" name="${test.id}" value="A">A. ${test.optionA}<br>
                <input type="radio" name="${test.id}" value="B">B. ${test.optionB}<br>
                <input type="radio" name="${test.id}" value="C">C. ${test.optionC}<br>
                <input type="radio" name="${test.id}" value="D">D. ${test.optionD}<br>
            </c:if>
        </c:forEach>
        <h3>二、填空题 <b class="t_score_total"></b></h3>
        <c:forEach var="test" items="${sessionScope.tests}">
            <c:if test="${test.type == '填空题'}">
                <div class="t" title="${test.id}">
                        ${test.question} （<span class="t_score">${test.score}</span> 分）
                            参考答案 ${test.answer}
                            学生答案 ${test.studentTests[0].answer}
                            [
                            <c:if test="${test.answer eq test.studentTests[0].answer}">
                                正确
                            </c:if>
                            <c:if test="${test.answer ne test.studentTests[0].answer}">
                                错误
                            </c:if>
                            ]
                </div>
            </c:if>
        </c:forEach>
        <h3>三、简答题 <b class="j_score_total"></b></h3>
        <c:forEach var="test" items="${sessionScope.tests}">
            <c:if test="${test.type == '简答题'}">
                <div class="j">${test.question} （<span class="j_score">${test.score}</span> 分）</div>
                <textarea name="${test.id}">${test.answer}</textarea><br>
                学生答案<br>
                ${test.studentTests[0].answer}<br>
                <input type="text" name="${test.id}" placeholder="得分"><br>
            </c:if>
        </c:forEach>
        <h3>四、编程题 <b class="b_score_total"></b></h3>
        <c:forEach var="test" items="${sessionScope.tests}">
            <c:if test="${test.type == '编程题'}">
                <div class="b">${test.question} （<span class="b_score">${test.score}</span> 分）</div>
                <input type="file" name="files">
                <small class="hint">文件名为 ${test.id}.rar 或 ${test.id}.zip</small>
                <br>
            </c:if>
        </c:forEach>
        <div id="submit"><input type="submit" value="提交试卷"></div>
    </form>
</div>
</body>
</html>
