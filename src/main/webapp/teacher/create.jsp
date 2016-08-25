<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>teacher add page</title>
    </head>
    <body>
        <h1>Teacher Create</h1>
        <form action="${ctx}/teacher/create" method="post">
            <input name="email" palceholder="EMAIL"><br>
            <input name="username" palceholder="USERNAME"><br>
            <input name="password" palceholder="PASSWORD"><br>
            <input type="submit" value="CREATE">
        </form>
    </body>
</html>