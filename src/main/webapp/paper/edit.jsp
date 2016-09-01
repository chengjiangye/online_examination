<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>paper edit page</title>
    </head>
    <body>
        <h1>Paper Edit</h1>
        <form action="${ctx}/paper/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.paper.id}">
            TIME: <input name="time" value="${sessionScope.paper.time}"><br>
            SCORE: <input name="score" value="${sessionScope.paper.score}"><br>
            TEACHERID: <input name="teacherId" value="${sessionScope.paper.teacherId}"><br>
            COURSEID: <input name="courseId" value="${sessionScope.paper.courseId}"><br>
            <input type="submit" value="MODIFY">
        </form>
    </body>
</html>