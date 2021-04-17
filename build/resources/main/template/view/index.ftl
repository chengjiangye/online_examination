<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>${model?uncap_first} index page</title>
    </head>
    <body>
        <h1>${model} Index</h1>
        <p><a href="${'$'}{ctx}/${model?lower_case}/create.jsp">CREATE</a></p>
        <p><a href="${'$'}{ctx}/${model?lower_case}/list">LIST</a></p>
    </body>
</html>