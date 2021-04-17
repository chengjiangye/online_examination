<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/26
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/inc.jsp" %>
<html>
<head>
    <title>首页 - 教务</title>
    <script>
        function del() { return confirm('REMOVE?'); }
    </script>
</head>
<body>
<c:if test="${sessionScope.assistant eq null}">
    <c:redirect url="${ctx}/assistant/index.jsp"/>
</c:if>
<h1>首页</h1>
教务：${sessionScope.assistant.username}
<hr>
<form action="${ctx}/class/create" method="post">
    <input name="title" placeholder="班级名称"><br>
    <input name="start" placeholder="开班日期"><br>
    <input name="finish" placeholder="结业日期"><br>
    <input type="submit" value="创建">
</form>
<hr/>
<table border="1">
    <tr>
        <th>序号</th>
        <th>班级名称</th>
        <th>开班日期</th>
        <th>结业日期</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach var="clazz" items="${sessionScope.list}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td><a href="${ctx}/assistant/queryStudentsByClassId/${clazz.id}">${clazz.title}</a></td>
            <td>${clazz.start}</td>
            <td>${clazz.finish}</td>
            <td><a href="${ctx}/class/queryById/${clazz.id}">修改</a></td>
            <td><a class="delete" href="${ctx }/class/remove/${clazz.id}" onclick="return del()">删除</a></td>
        </tr>
    </c:forEach>
</table>
<hr>
<a href="${ctx}/assistant/queryClassAndPaper">维护考试信息</a>
</body>
</html>
