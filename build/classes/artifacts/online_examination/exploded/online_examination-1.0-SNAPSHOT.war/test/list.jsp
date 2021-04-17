<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>test list page</title>
        <script>
            function del() { return confirm('REMOVE?'); }
        </script>
    </head>
    <body>
        <h1>Test List</h1>
        <hr/>
        <c:import url="${ctx}/test/create.jsp"/>
        <hr/>
        <table border="1">
            <tr>
                <th>INDEX</th>
                <th>ID</th>
                <th>TYPE</th>
                <th>QUESTION</th>
                <th>OPTIONA</th>
                <th>OPTIONB</th>
                <th>OPTIONC</th>
                <th>OPTIOND</th>
                <th>ANSWER</th>
                <th>PAPERID</th>
                <th colspan="2">OPERATION</th>
            </tr>
            <c:forEach var="test" items="${sessionScope.list}" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${test.id}</td>
                <td>${test.type}</td>
                <td>${test.question}</td>
                <td>${test.optionA}</td>
                <td>${test.optionB}</td>
                <td>${test.optionC}</td>
                <td>${test.optionD}</td>
                <td>${test.answer}</td>
                <td>${test.paperId}</td>
                <td><a href="${ctx}/test/queryById/${test.id}">MODIFY</a></td>
                <td><a class="delete" href="${ctx }/test/remove/${test.id}" onclick="return del()">REMOVE</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>