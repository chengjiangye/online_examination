<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>paper add page</title>
    </head>
    <body>
        <h1>Paper Create</h1>
        <form action="${ctx}/paper/create" method="post">
            <input name="time" placeholder="TIME"><br>
            <input name="score" placeholder="SCORE"><br>
            <input name="teacherId" placeholder="TEACHERID"><br>
            <input name="courseId" placeholder="COURSEID"><br>
            <input type="submit" value="CREATE">
        </form>
    </body>
</html>