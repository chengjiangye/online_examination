<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>teacher edit page</title>
    </head>
    <body>
        <h1>Teacher Edit</h1>
        <form action="${ctx}/teacher/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.teacher.id}">
            EMAIL: <input name="email" value="${sessionScope.teacher.email}"><br>
            USERNAME: <input name="username" value="${sessionScope.teacher.username}"><br>
            PASSWORD: <input name="password" value="${sessionScope.teacher.password}"><br>
            <input type="submit" value="MODIFY">
        </form>
    </body>
</html>