<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>注册 - 学生</title>
</head>
<body>
<h1>注册</h1>
<form action="${ctx}/student/register" method="post">
    班级 <select name="classId">
    <c:forEach var="clazz" items="${sessionScope.classes}">
        <option value="${clazz.id}">${clazz.title}</option>
    </c:forEach>
</select><br>
    <input name="email" placeholder="EMAIL"><br>
    <input name="username" placeholder="USERNAME"><br>
    <input type="password" name="password" placeholder="密码"><br>
    <input type="password" name="repassword" placeholder="重复密码"><br>
    <input type="radio" name="gender" value="男" checked="checked">男
    <input type="radio" name="gender" value="女">女<br>
    出生日期 <input type="date" name="dob" placeholder="DOB"><br>
    <input name="phone" placeholder="PHONE"><br>
    <input name="education" placeholder="EDUCATION"><br>
    <input name="major" placeholder="MAJOR"><br>
    <input name="academy" placeholder="ACADEMY"><br>
    毕业日期 <input type="date" name="graduation" placeholder="GRADUATION"><br>
    <textarea name="training" placeholder="TRAINING"></textarea><br>
    <textarea name="experience" placeholder="EXPERIENCE"></textarea><br>
    上传照片 <input type="file" name="photo" placeholder="PHOTO"><br>
    <textarea name="remark" placeholder="REMARK"></textarea><br>
    <input name="card" placeholder="CARD"><br>
    <input type="submit" value="注册">
</form>
</body>
</html>