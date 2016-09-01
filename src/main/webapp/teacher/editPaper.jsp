<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>编辑试卷 - 教师</title>
    </head>
    <body>
        <h1>编辑试卷</h1>
        <form action="${ctx}/paper/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.paper.id}">
            <input type="hidden" name="teacherId" value="${sessionScope.paper.teacherId}"><br>
            <input type="hidden" name="courseId" value="${sessionScope.paper.courseId}"><br>
            考试时间 <input name="time" value="${sessionScope.paper.time}"><br>
            试题总分 <input name="score" value="${sessionScope.paper.score}"><br>
            <input type="submit" value="保存">
        </form>
    </body>
</html>