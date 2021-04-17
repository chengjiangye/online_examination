<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>test add page</title>
    </head>
    <body>
        <h1>Test Create</h1>
        <form action="${ctx}/test/create" method="post">
            <input name="type" placeholder="TYPE"><br>
            <input name="question" placeholder="QUESTION"><br>
            <input name="optionA" placeholder="OPTIONA"><br>
            <input name="optionB" placeholder="OPTIONB"><br>
            <input name="optionC" placeholder="OPTIONC"><br>
            <input name="optionD" placeholder="OPTIOND"><br>
            <input name="answer" placeholder="ANSWER"><br>
            <input name="paperId" placeholder="PAPERID"><br>
            <input type="submit" value="CREATE">
        </form>
    </body>
</html>