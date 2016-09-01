<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/8/31
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/inc.jsp" %>
<html>
<head>
    <title>学生信息 - 教务</title>
</head>
<body>
<h1>学生信息</h1>
<hr/>
<h3>${sessionScope.clazz.id} - ${sessionScope.clazz.title}</h3>
<small>${sessionScope.clazz.start}</small> - <small>${sessionScope.clazz.finish}</small>
<table border="1">
    <tr>
        <th>序号</th>
        <th>照片</th>
        <th>姓名</th>
        <th>邮箱</th>
        <th>姓名</th>
        <th>性别</th>
        <th>出生日期</th>
        <th>电话</th>
        <th>学历</th>
        <th>专业</th>
        <th>毕业院校</th>
        <th>毕业日期</th>
        <th>培训经历</th>
        <th>工作经验</th>
        <th>备注信息</th>
        <th>上机卡号</th>
        <th>最后登录地址</th>
        <th>最后登录时间</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach var="student" items="${sessionScope.clazz.students}" varStatus="vs">
        <tr>
            <td>${vs.count}</td>
            <td><img src="${ctx}/static/photo/${student.photo}" alt="${student.username}" width="80"></td>
            <td>${student.username}</td>
            <td>${student.email}</td>
            <td>${student.username}</td>
            <td>${student.gender}</td>
            <td>${student.dob}</td>
            <td>${student.phone}</td>
            <td>${student.education}</td>
            <td>${student.major}</td>
            <td>${student.academy}</td>
            <td>${student.graduation}</td>
            <td>${student.training}</td>
            <td>${student.experience}</td>
            <td>${student.remark}</td>
            <td>${student.card}</td>
            <td>${student.lastIp}</td>
            <td>${student.lastLogin}</td>
            <td><a href="">修改</a></td>
            <td><a href="${ctx}/assistant/removeStudent/${student.id}">删除</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
