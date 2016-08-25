<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>teacher list page</title>
        <script>
            function del() { return confirm('REMOVE?'); }
        </script>
    </head>
    <body>
        <h1>Teacher List</h1>
        <hr/>
        <c:import url="${ctx}/teacher/create.jsp"/>
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
            <c:forEach var="teacher" items="${sessionScope.list}" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${teacher.id}</td>
                <td>${teacher.email}</td>
                <td>${teacher.username}</td>
                <td>${teacher.password}</td>
                <td><a href="${ctx}/teacher/queryById/${teacher.id}">MODIFY</a></td>
                <td><a class="delete" href="${ctx }/teacher/remove/${teacher.id}" onclick="return del()">REMOVE</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>