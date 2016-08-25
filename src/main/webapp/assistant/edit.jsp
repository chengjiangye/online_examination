<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>assistant edit page</title>
    </head>
    <body>
        <h1>Assistant Edit</h1>
        <form action="${ctx}/assistant/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.assistant.id}">
            EMAIL: <input name="email" value="${sessionScope.assistant.email}"><br>
            USERNAME: <input name="username" value="${sessionScope.assistant.username}"><br>
            PASSWORD: <input name="password" value="${sessionScope.assistant.password}"><br>
            <input type="submit" value="MODIFY">
        </form>
    </body>
</html>