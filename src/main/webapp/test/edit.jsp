<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>test edit page</title>
    </head>
    <body>
        <h1>Test Edit</h1>
        <form action="${ctx}/test/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.test.id}">
            TYPE: <input name="type" value="${sessionScope.test.type}"><br>
            QUESTION: <input name="question" value="${sessionScope.test.question}"><br>
            OPTIONA: <input name="optionA" value="${sessionScope.test.optionA}"><br>
            OPTIONB: <input name="optionB" value="${sessionScope.test.optionB}"><br>
            OPTIONC: <input name="optionC" value="${sessionScope.test.optionC}"><br>
            OPTIOND: <input name="optionD" value="${sessionScope.test.optionD}"><br>
            ANSWER: <input name="answer" value="${sessionScope.test.answer}"><br>
            PAPERID: <input name="paperId" value="${sessionScope.test.paperId}"><br>
            <input type="submit" value="MODIFY">
        </form>
    </body>
</html>