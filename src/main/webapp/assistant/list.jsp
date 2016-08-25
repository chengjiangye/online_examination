<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>assistant list page</title>
        <script>
            function del() { return confirm('REMOVE?'); }
        </script>
    </head>
    <body>
        <h1>Assistant List</h1>
        <hr/>
        <c:import url="${ctx}/assistant/create.jsp"/>
        <hr/>
        <table border="1">
            <tr>
                <th>INDEX</th>
                <th>ID</th>
                <th>EMAIL</th>
                <th>USERNAME</th>
                <th>PASSWORD</th>
                <th colspan="2">OPERATION</th>
            </tr>
            <c:forEach var="assistant" items="${sessionScope.list}" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${assistant.id}</td>
                <td>${assistant.email}</td>
                <td>${assistant.username}</td>
                <td>${assistant.password}</td>
                <td><a href="${ctx}/assistant/queryById/${assistant.id}">MODIFY</a></td>
                <td><a class="delete" href="${ctx }/assistant/remove/${assistant.id}" onclick="return del()">REMOVE</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>