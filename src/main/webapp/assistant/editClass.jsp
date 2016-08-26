<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>修改班级 - 教务</title>
    </head>
    <body>
        <h1>修改班级</h1>
        <form action="${ctx}/class/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.clazz.id}">
            TITLE: <input name="title" value="${sessionScope.clazz.title}"><br>
            START: <input name="start" value="${sessionScope.clazz.start}"><br>
            FINISH: <input name="finish" value="${sessionScope.clazz.finish}"><br>
            <input type="submit" value="保存">
        </form>
    </body>
</html>