<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>修改考试信息 - 教务</title>
</head>
<body>
<h1>修改考试信息</h1>
<form action="${ctx}/classpaper/modify" method="post">
    <input type="hidden" name="id" value="${sessionScope.classPaper.id}">
    时间: <input name="time" value="<fmt:formatDate value="${sessionScope.classPaper.time}" pattern="yyyy-MM-dd HH:mm:ss"/>"><br>
    状态:
    <select name="status">
        <option value="未考试">未考试</option>
        <option value="考试中">考试中</option>
        <option value="考试结束">考试结束</option>
        <option value="判卷结束">判卷结束</option>
    </select><br>
    班级ID: <input type="text" name="classId" value="${sessionScope.classPaper.classId}"><br>
    试卷ID: <input type="text" name="paperId" value="${sessionScope.classPaper.paperId}"><br>
    教务ID: <input type="text" name="assistantId" value="${sessionScope.classPaper.assistantId}"><br>
    <input type="submit" value="保存">
</form>
</body>
</html>